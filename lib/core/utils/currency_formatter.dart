import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static final NumberFormat _formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  /// Format integer Rupiah amount (e.g. 48000 -> "Rp 48.000")
  static String format(int amountInRupiah) {
    return _formatter.format(amountInRupiah).trim();
  }

  /// Parse Rupiah string to integer
  static int parse(String formatted) {
    final clean = formatted.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(clean) ?? 0;
  }

  /// Authoritative integer tax calculation (PB1 10%)
  static int calculatePb1Tax(int subtotal) {
    // Rounding half up using integer arithmetic
    return ((subtotal * 10) + 50) ~/ 100;
  }

  /// Authoritative integer service charge calculation (5%)
  static int calculateServiceCharge(int subtotal) {
    return ((subtotal * 5) + 50) ~/ 100;
  }
}
