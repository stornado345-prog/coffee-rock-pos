import 'package:coffee_rock_pos/features/checkout/domain/entities/payment.dart';
import 'package:coffee_rock_pos/features/orders/domain/entities/order.dart';
import 'package:coffee_rock_pos/features/orders/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final List<OrderEntity> _orders = [];
  int _orderCounter = 1048;

  OrderRepositoryImpl() {
    // Seed initial completed ticket from prompt mock (#CR-1048)
    _orders.add(
      OrderEntity(
        id: 1,
        orderNumber: '#CR-1048',
        orderType: 'Dine-in',
        tableName: 'Table 04 • Regular Guest',
        cashierName: 'Alex M.',
        shiftName: 'Shift #2 • Alex M.',
        subtotalRupiah: 169000,
        taxPb1Rupiah: 16900,
        serviceChargeRupiah: 8450,
        totalRupiah: 194350,
        status: 'COMPLETED',
        createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
        paymentMethod: 'EDC Card',
        items: const [
          OrderItemSnapshot(
            id: 101,
            productId: 1,
            productName: 'Rock Caramel Cloud',
            variantName: 'Size L',
            unitPrice: 48000,
            quantity: 2,
            lineTotal: 96000,
            modifierSnapshots: ['Size L (+Rp 6.000)', 'Oat Milk (+Rp 8.000)', '50% Sweetness'],
          ),
          OrderItemSnapshot(
            id: 102,
            productId: 2,
            productName: 'Cascading Cold Brew',
            variantName: 'Size Reg',
            unitPrice: 45000,
            quantity: 1,
            lineTotal: 45000,
            modifierSnapshots: ['Size Reg', 'Vanilla Foam Top'],
          ),
          OrderItemSnapshot(
            id: 103,
            productId: 6,
            productName: 'French Butter Croissant',
            variantName: 'Standard',
            unitPrice: 28000,
            quantity: 1,
            lineTotal: 28000,
            modifierSnapshots: ['Warmed up', 'Pure Strawberry Jam (+Rp 0)'],
          ),
        ],
      ),
    );
  }

  @override
  Future<List<OrderEntity>> getOrders() async {
    return List.unmodifiable(_orders.reversed.toList());
  }

  @override
  Future<OrderEntity?> getOrderById(int id) async {
    try {
      return _orders.firstWhere((o) => o.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<OrderEntity> createOrder({
    required String orderType,
    required String tableName,
    required String cashierName,
    required String shiftName,
    required int subtotalRupiah,
    required int taxPb1Rupiah,
    required int serviceChargeRupiah,
    required int totalRupiah,
    required List<OrderItemSnapshot> items,
    required PaymentMethod paymentMethod,
    required int amountPaidRupiah,
    required int changeDueRupiah,
  }) async {
    _orderCounter++;
    final newOrder = OrderEntity(
      id: _orders.length + 1,
      orderNumber: '#CR-$_orderCounter',
      orderType: orderType,
      tableName: tableName,
      cashierName: cashierName,
      shiftName: shiftName,
      subtotalRupiah: subtotalRupiah,
      taxPb1Rupiah: taxPb1Rupiah,
      serviceChargeRupiah: serviceChargeRupiah,
      totalRupiah: totalRupiah,
      status: 'COMPLETED',
      createdAt: DateTime.now(),
      items: items,
      paymentMethod: paymentMethod.displayName,
    );

    _orders.add(newOrder);
    return newOrder;
  }

  @override
  Future<void> voidOrder(int id) async {
    final index = _orders.indexWhere((o) => o.id == id);
    if (index != -1) {
      final existing = _orders[index];
      _orders[index] = OrderEntity(
        id: existing.id,
        orderNumber: existing.orderNumber,
        orderType: existing.orderType,
        tableName: existing.tableName,
        cashierName: existing.cashierName,
        shiftName: existing.shiftName,
        subtotalRupiah: existing.subtotalRupiah,
        taxPb1Rupiah: existing.taxPb1Rupiah,
        serviceChargeRupiah: existing.serviceChargeRupiah,
        totalRupiah: existing.totalRupiah,
        status: 'VOIDED',
        createdAt: existing.createdAt,
        items: existing.items,
        paymentMethod: existing.paymentMethod,
      );
    }
  }
}
