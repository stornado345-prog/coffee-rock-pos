import 'package:coffee_rock_pos/features/checkout/domain/entities/payment.dart';
import 'package:coffee_rock_pos/features/orders/domain/entities/order.dart';

abstract class OrderRepository {
  Future<List<OrderEntity>> getOrders();
  Future<OrderEntity?> getOrderById(int id);
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
  });
  Future<void> voidOrder(int id);
}
