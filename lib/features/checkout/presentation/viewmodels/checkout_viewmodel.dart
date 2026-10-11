import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffee_rock_pos/core/constants/constants.dart';
import 'package:coffee_rock_pos/features/cart/presentation/viewmodels/cart_viewmodel.dart';
import 'package:coffee_rock_pos/features/checkout/domain/entities/payment.dart';
import 'package:coffee_rock_pos/features/orders/domain/entities/order.dart';
import 'package:coffee_rock_pos/features/orders/presentation/viewmodels/orders_viewmodel.dart';

class CheckoutState {
  final PaymentMethod selectedMethod;
  final int cashTenderAmount;
  final bool isProcessing;
  final OrderEntity? lastCompletedOrder;
  final String? errorMessage;

  const CheckoutState({
    this.selectedMethod = PaymentMethod.qris,
    this.cashTenderAmount = 0,
    this.isProcessing = false,
    this.lastCompletedOrder,
    this.errorMessage,
  });

  CheckoutState copyWith({
    PaymentMethod? selectedMethod,
    int? cashTenderAmount,
    bool? isProcessing,
    OrderEntity? lastCompletedOrder,
    String? errorMessage,
  }) {
    return CheckoutState(
      selectedMethod: selectedMethod ?? this.selectedMethod,
      cashTenderAmount: cashTenderAmount ?? this.cashTenderAmount,
      isProcessing: isProcessing ?? this.isProcessing,
      lastCompletedOrder: lastCompletedOrder ?? this.lastCompletedOrder,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class CheckoutViewModel extends StateNotifier<CheckoutState> {
  final Ref _ref;

  CheckoutViewModel(this._ref) : super(const CheckoutState());

  void setPaymentMethod(PaymentMethod method) {
    state = state.copyWith(selectedMethod: method);
  }

  void setCashTender(int amount) {
    state = state.copyWith(cashTenderAmount: amount);
  }

  Future<bool> processPayment() async {
    final cart = _ref.read(cartViewModelProvider);
    if (cart.items.isEmpty) {
      state = state.copyWith(errorMessage: 'Cart is empty');
      return false;
    }

    final total = cart.totalDue;
    int tendered = state.cashTenderAmount;
    if (state.selectedMethod != PaymentMethod.cash) {
      tendered = total;
    } else if (tendered < total) {
      tendered = total; // Default to exact
    }

    final changeDue = tendered - total;

    state = state.copyWith(isProcessing: true, errorMessage: null);

    try {
      final orderRepo = _ref.read(orderRepositoryProvider);

      final itemSnapshots = cart.items.map((cartItem) {
        final modNames = <String>[];
        if (cartItem.selectedVariant.name.isNotEmpty) {
          modNames.add('${cartItem.selectedVariant.name} ${cartItem.selectedVariant.priceAdjustment > 0 ? "(+Rp ${cartItem.selectedVariant.priceAdjustment})" : ""}');
        }
        for (final m in cartItem.selectedModifiers) {
          modNames.add('${m.name} ${m.priceAdjustment > 0 ? "(+Rp ${m.priceAdjustment})" : ""}');
        }

        return OrderItemSnapshot(
          id: DateTime.now().millisecondsSinceEpoch % 100000,
          productId: cartItem.product.id,
          productName: cartItem.product.name,
          variantName: cartItem.selectedVariant.name,
          unitPrice: cartItem.unitPrice,
          quantity: cartItem.quantity,
          lineTotal: cartItem.lineTotal,
          modifierSnapshots: modNames,
          notes: cartItem.notes,
        );
      }).toList();

      final newOrder = await orderRepo.createOrder(
        orderType: cart.orderType,
        tableName: cart.tableName,
        cashierName: AppConstants.defaultCashierName,
        shiftName: AppConstants.defaultShift,
        subtotalRupiah: cart.subtotal,
        taxPb1Rupiah: cart.pb1Tax,
        serviceChargeRupiah: cart.serviceCharge,
        totalRupiah: total,
        items: itemSnapshots,
        paymentMethod: state.selectedMethod,
        amountPaidRupiah: tendered,
        changeDueRupiah: changeDue,
      );

      // Refresh orders list
      await _ref.read(ordersViewModelProvider.notifier).loadOrders();

      // Clear cart & set new ticket
      _ref.read(cartViewModelProvider.notifier).generateNewTicket();

      state = state.copyWith(
        isProcessing: false,
        lastCompletedOrder: newOrder,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isProcessing: false,
        errorMessage: 'Transaction error: $e',
      );
      return false;
    }
  }

  void resetCheckout() {
    state = state.copyWith(
      lastCompletedOrder: null,
      errorMessage: null,
      cashTenderAmount: 0,
    );
  }
}

final checkoutViewModelProvider =
    StateNotifierProvider<CheckoutViewModel, CheckoutState>((ref) {
  return CheckoutViewModel(ref);
});
