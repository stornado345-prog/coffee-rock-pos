import 'package:flutter/material.dart';
import 'package:coffee_rock_pos/features/orders/domain/entities/order.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/currency_formatter.dart';

class ReceiptDialog extends StatelessWidget {
  final OrderEntity order;

  const ReceiptDialog({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: Center(
        child: Container(
          width: 420,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Receipt Thermal Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                decoration: const BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  border: Border(bottom: BorderSide(color: AppColors.beige)),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.check_circle_rounded,
                        color: AppColors.success, size: 48),
                    const SizedBox(height: 8),
                    Text(
                      'TRANSAKSI BERHASIL',
                      style: AppTypography.headlineSm.copyWith(
                        color: AppColors.espressoBrown,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'COFFEE ROCK ARTISANAL ROASTERS',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.caramel,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Senopati Roastery & Lab, Jakarta Selatan',
                      style: AppTypography.bodySmall.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ),

              // Receipt Ticket Body
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Order meta info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order No:', style: AppTypography.bodySmall),
                          Text(order.orderNumber,
                              style: AppTypography.labelLarge
                                  .copyWith(fontWeight: FontWeight.w700)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tipe / Table:', style: AppTypography.bodySmall),
                          Text('${order.orderType} • ${order.tableName}',
                              style: AppTypography.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Kasir / Shift:', style: AppTypography.bodySmall),
                          Text('${order.cashierName} • ${order.shiftName}',
                              style: AppTypography.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Waktu:', style: AppTypography.bodySmall),
                          Text(
                            '${order.createdAt.hour.toString().padLeft(2, '0')}:${order.createdAt.minute.toString().padLeft(2, '0')}',
                            style: AppTypography.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(color: AppColors.beige, thickness: 1),
                      const SizedBox(height: 8),

                      // Items list
                      ...order.items.map((item) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${item.quantity}x ${item.productName}',
                                        style: AppTypography.bodyMedium.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      CurrencyFormatter.format(item.lineTotal),
                                      style: AppTypography.bodyMedium.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                if (item.modifierSnapshots.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Text(
                                      item.modifierSnapshots.join(', '),
                                      style: AppTypography.bodySmall.copyWith(
                                        fontSize: 10,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          )),

                      const SizedBox(height: 8),
                      const Divider(color: AppColors.beige, thickness: 1),
                      const SizedBox(height: 8),

                      // Financial Breakdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal', style: AppTypography.bodySmall),
                          Text(CurrencyFormatter.format(order.subtotalRupiah),
                              style: AppTypography.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('PB1 Tax (10%)', style: AppTypography.bodySmall),
                          Text(CurrencyFormatter.format(order.taxPb1Rupiah),
                              style: AppTypography.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Service Charge (5%)',
                              style: AppTypography.bodySmall),
                          Text(CurrencyFormatter.format(order.serviceChargeRupiah),
                              style: AppTypography.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('TOTAL DUE',
                              style: AppTypography.headlineSmall.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              )),
                          Text(
                            CurrencyFormatter.format(order.totalRupiah),
                            style: AppTypography.headlineMedium.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppColors.espressoBrown,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Metode Bayar:', style: AppTypography.bodySmall),
                          Text(order.paymentMethod ?? 'PAID',
                              style: AppTypography.labelLarge.copyWith(
                                color: AppColors.caramel,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Action buttons
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  border: Border(top: BorderSide(color: AppColors.beige)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Simulate print receipt command
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Printing thermal receipt...'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        icon: const Icon(Icons.print_outlined, size: 18),
                        label: const Text('Cetak'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.espressoBrown,
                          side: const BorderSide(color: AppColors.beige),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.espressoBrown,
                          foregroundColor: AppColors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Order Baru'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
