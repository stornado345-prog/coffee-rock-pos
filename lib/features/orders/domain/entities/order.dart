class OrderItemSnapshot {
  final int id;
  final int productId;
  final String productName;
  final String variantName;
  final int unitPrice;
  final int quantity;
  final int lineTotal;
  final List<String> modifierSnapshots;
  final String? notes;

  const OrderItemSnapshot({
    required this.id,
    required this.productId,
    required this.productName,
    required this.variantName,
    required this.unitPrice,
    required this.quantity,
    required this.lineTotal,
    required this.modifierSnapshots,
    this.notes,
  });
}

class OrderEntity {
  final int id;
  final String orderNumber; // e.g. "#CR-1048"
  final String orderType; // "Dine-in", "Takeaway"
  final String tableName; // "Table 04 • Regular Guest"
  final String cashierName;
  final String shiftName;
  final int subtotalRupiah;
  final int taxPb1Rupiah;
  final int serviceChargeRupiah;
  final int totalRupiah;
  final String status; // "COMPLETED", "VOIDED"
  final DateTime createdAt;
  final List<OrderItemSnapshot> items;
  final String? paymentMethod;

  const OrderEntity({
    required this.id,
    required this.orderNumber,
    required this.orderType,
    required this.tableName,
    required this.cashierName,
    required this.shiftName,
    required this.subtotalRupiah,
    required this.taxPb1Rupiah,
    required this.serviceChargeRupiah,
    required this.totalRupiah,
    required this.status,
    required this.createdAt,
    required this.items,
    this.paymentMethod,
  });
}
