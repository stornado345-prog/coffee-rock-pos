import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffee_rock_pos/features/checkout/domain/entities/payment.dart';
import 'package:coffee_rock_pos/features/checkout/presentation/viewmodels/checkout_viewmodel.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../viewmodels/cart_viewmodel.dart';
import 'cart_item_tile.dart';

class CartPanel extends ConsumerWidget {
  final VoidCallback onCheckoutPressed;

  const CartPanel({
    super.key,
    required this.onCheckoutPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartViewModelProvider);
    final cartNotifier = ref.read(cartViewModelProvider.notifier);
    final checkoutState = ref.watch(checkoutViewModelProvider);
    final checkoutNotifier = ref.read(checkoutViewModelProvider.notifier);

    final totalDue = cartState.totalDue;

    // Smart cash presets: exact, rounded to 50k, rounded to 100k
    final exactAmount = totalDue;
    final round50k = totalDue > 0 ? ((totalDue + 49999) ~/ 50000) * 50000 : 0;
    final round100k = totalDue > 0 ? ((totalDue + 99999) ~/ 100000) * 100000 : 0;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.beige, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(66, 43, 32, 0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // 1. Order Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: const BoxDecoration(
              color: AppColors.surfaceContainer,
              border: Border(bottom: BorderSide(color: AppColors.beige)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartState.orderNumber,
                          style: AppTypography.headlineSm.copyWith(
                            fontSize: 17,
                            color: AppColors.espressoBrown,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            cartState.orderType.toUpperCase(),
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      cartState.tableName,
                      style: AppTypography.bodySm.copyWith(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      tooltip: 'Change Mode / Table',
                      onPressed: () {
                        // Toggle order type
                        final nextType = cartState.orderType == 'Dine-in'
                            ? 'Takeaway'
                            : 'Dine-in';
                        cartNotifier.setOrderType(nextType);
                      },
                      icon: const Icon(Icons.table_restaurant_outlined, size: 20),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.espressoBrown,
                      ),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      tooltip: 'Void / Clear Ticket',
                      onPressed: () {
                        if (cartState.items.isNotEmpty) {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Void Ticket?'),
                              content: const Text(
                                  'Are you sure you want to void all items in this current order?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx),
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    cartNotifier.clearCart();
                                    Navigator.pop(ctx);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.error,
                                    foregroundColor: AppColors.white,
                                  ),
                                  child: const Text('Void Ticket'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.delete_outline, size: 20),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.error,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 2. Scrollable Ticket Lines
          Expanded(
            child: cartState.items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 48,
                          color: AppColors.beige.withOpacity(0.8),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'No items in order',
                          style: AppTypography.headlineSm.copyWith(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Select products from the catalog to add',
                          style: AppTypography.bodySm.copyWith(
                            color: AppColors.outline,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(14),
                    itemCount: cartState.items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = cartState.items[index];
                      return CartItemTile(
                        item: item,
                        onQuantityChanged: (qty) =>
                            cartNotifier.updateQuantity(item.uniqueId, qty),
                        onRemove: () => cartNotifier.removeItem(item.uniqueId),
                      );
                    },
                  ),
          ),

          // 3. Bill Breakdown
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.surfaceContainerLow,
              border: Border(top: BorderSide(color: AppColors.beige)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal (${cartState.totalItemCount} items)',
                      style: AppTypography.bodySm.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      CurrencyFormatter.format(cartState.subtotal),
                      style: AppTypography.labelLg.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PB1 Tax (10%)',
                      style: AppTypography.bodySm.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      CurrencyFormatter.format(cartState.pb1Tax),
                      style: AppTypography.labelLg.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Service Charge (5%)',
                      style: AppTypography.bodySm.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      CurrencyFormatter.format(cartState.serviceCharge),
                      style: AppTypography.labelLg.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 18, color: AppColors.beige),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'Total Due',
                      style: AppTypography.headlineSm.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.espressoBrown,
                      ),
                    ),
                    Text(
                      CurrencyFormatter.format(totalDue),
                      style: AppTypography.displayLg.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.espressoBrown,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 4. Fast Tender Chips & Payment Channels
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(top: BorderSide(color: AppColors.beige)),
            ),
            child: Column(
              children: [
                // Cash Presets
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          checkoutNotifier.setPaymentMethod(PaymentMethod.cash);
                          checkoutNotifier.setCashTender(exactAmount);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Pas ${CurrencyFormatter.format(exactAmount)}',
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.espressoBrown,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          checkoutNotifier.setPaymentMethod(PaymentMethod.cash);
                          checkoutNotifier.setCashTender(round50k);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            CurrencyFormatter.format(round50k),
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.espressoBrown,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          checkoutNotifier.setPaymentMethod(PaymentMethod.cash);
                          checkoutNotifier.setCashTender(round100k);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            CurrencyFormatter.format(round100k),
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.espressoBrown,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Channels (QRIS, EDC Card, Cash Drawer)
                Row(
                  children: [
                    _PaymentChannelButton(
                      label: 'QRIS',
                      icon: Icons.qr_code_scanner,
                      isSelected:
                          checkoutState.selectedMethod == PaymentMethod.qris,
                      onTap: () =>
                          checkoutNotifier.setPaymentMethod(PaymentMethod.qris),
                    ),
                    const SizedBox(width: 8),
                    _PaymentChannelButton(
                      label: 'EDC Card',
                      icon: Icons.contactless,
                      isSelected:
                          checkoutState.selectedMethod == PaymentMethod.edc,
                      onTap: () =>
                          checkoutNotifier.setPaymentMethod(PaymentMethod.edc),
                    ),
                    const SizedBox(width: 8),
                    _PaymentChannelButton(
                      label: 'Cash Drawer',
                      icon: Icons.payments_outlined,
                      isSelected:
                          checkoutState.selectedMethod == PaymentMethod.cash,
                      onTap: () =>
                          checkoutNotifier.setPaymentMethod(PaymentMethod.cash),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Primary Checkout Action Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: cartState.items.isEmpty ? null : onCheckoutPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.espressoBrown,
                      disabledBackgroundColor:
                          AppColors.espressoBrown.withOpacity(0.4),
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.payments, size: 22, color: AppColors.white),
                            const SizedBox(width: 8),
                            Text(
                              'Bayar Sekarang',
                              style: AppTypography.headlineSm.copyWith(
                                fontSize: 16,
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          CurrencyFormatter.format(totalDue),
                          style: AppTypography.numericCurrency.copyWith(
                            fontSize: 17,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentChannelButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentChannelButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.espressoBrown
                : AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppColors.espressoBrown : AppColors.beige,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected ? AppColors.white : AppColors.espressoBrown,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTypography.labelSm.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.white : AppColors.espressoBrown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
