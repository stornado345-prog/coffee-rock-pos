enum PaymentMethod {
  qris,
  edc,
  cash,
}

extension PaymentMethodExt on PaymentMethod {
  String get displayName {
    switch (this) {
      case PaymentMethod.qris:
        return 'QRIS';
      case PaymentMethod.edc:
        return 'EDC Card';
      case PaymentMethod.cash:
        return 'Cash Drawer';
    }
  }

  String get code {
    switch (this) {
      case PaymentMethod.qris:
        return 'QRIS';
      case PaymentMethod.edc:
        return 'EDC';
      case PaymentMethod.cash:
        return 'CASH';
    }
  }
}

class PaymentEntity {
  final int id;
  final int orderId;
  final PaymentMethod method;
  final int amountPaidRupiah;
  final int changeDueRupiah;
  final String? referenceCode;
  final String status;
  final DateTime createdAt;

  const PaymentEntity({
    required this.id,
    required this.orderId,
    required this.method,
    required this.amountPaidRupiah,
    this.changeDueRupiah = 0,
    this.referenceCode,
    this.status = 'SUCCESS',
    required this.createdAt,
  });
}
