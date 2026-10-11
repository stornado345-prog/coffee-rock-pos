import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/currency_formatter.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.canvas,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daily Sales & Shift Reports',
            style: AppTypography.headlineLarge.copyWith(
              color: AppColors.espressoBrown,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Today: 11 October 2026 • Shift #2 (07:00 - 15:30) • Register 01',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 20),

          // KPI Cards Row
          Row(
            children: [
              _buildKpiCard(
                title: 'TOTAL REVENUE (GROSS)',
                value: CurrencyFormatter.format(4850000),
                subtext: '38 completed orders',
                icon: Icons.monetization_on_outlined,
              ),
              const SizedBox(width: 14),
              _buildKpiCard(
                title: 'AVERAGE BASKET (ATV)',
                value: CurrencyFormatter.format(127600),
                subtext: '2.8 items per ticket',
                icon: Icons.shopping_basket_outlined,
              ),
              const SizedBox(width: 14),
              _buildKpiCard(
                title: 'PB1 TAX COLLECTED',
                value: CurrencyFormatter.format(421700),
                subtext: '10% Government Tax',
                icon: Icons.account_balance_outlined,
              ),
              const SizedBox(width: 14),
              _buildKpiCard(
                title: 'SERVICE CHARGE (5%)',
                value: CurrencyFormatter.format(210850),
                subtext: 'Barista Service Pool',
                icon: Icons.volunteer_activism_outlined,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Lower Section: Payment Methods Split & Best Sellers
          Expanded(
            child: Row(
              children: [
                // Payment Method Breakdown
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.beige),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Payment Channel Split',
                            style: AppTypography.headlineSmall),
                        const SizedBox(height: 16),
                        _buildPaymentRow('QRIS (Dynamic)', 'Rp 2.450.000', '50.5%', AppColors.espressoBrown),
                        const SizedBox(height: 12),
                        _buildPaymentRow('EDC Card (Visa/Mastercard)', 'Rp 1.620.000', '33.4%', AppColors.caramel),
                        const SizedBox(height: 12),
                        _buildPaymentRow('Cash Drawer', 'Rp 780.000', '16.1%', AppColors.secondary),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Top Selling Items
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.beige),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Top Selling Beverages Today',
                            style: AppTypography.headlineSmall),
                        const SizedBox(height: 14),
                        Expanded(
                          child: ListView(
                            children: const [
                              _TopItemTile(rank: 1, name: 'Rock Caramel Cloud', sold: '28 cups', rev: 'Rp 1.344.000'),
                              _TopItemTile(rank: 2, name: 'Cascading Cold Brew', sold: '22 cups', rev: 'Rp 990.000'),
                              _TopItemTile(rank: 3, name: 'Iced Matcha Latte', sold: '17 cups', rev: 'Rp 714.000'),
                              _TopItemTile(rank: 4, name: 'French Butter Croissant', sold: '15 pcs', rev: 'Rp 420.000'),
                              _TopItemTile(rank: 5, name: 'Faceted Double Macchiato', sold: '12 cups', rev: 'Rp 456.000'),
                            ],
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

  Widget _buildKpiCard({
    required String title,
    required String value,
    required String subtext,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.beige),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(icon, size: 20, color: AppColors.caramel),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: AppTypography.displayLg.copyWith(
                fontSize: 20,
                color: AppColors.espressoBrown,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtext,
              style: AppTypography.bodySmall.copyWith(
                fontSize: 11,
                color: AppColors.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentRow(String label, String amount, String pct, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            const SizedBox(width: 8),
            Text(label, style: AppTypography.bodyMedium),
          ],
        ),
        Row(
          children: [
            Text(amount, style: AppTypography.labelLarge.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(width: 8),
            Text('($pct)', style: AppTypography.bodySmall),
          ],
        ),
      ],
    );
  }
}

class _TopItemTile extends StatelessWidget {
  final int rank;
  final String name;
  final String sold;
  final String rev;

  const _TopItemTile({
    required this.rank,
    required this.name,
    required this.sold,
    required this.rev,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: rank <= 3 ? AppColors.espressoBrown : AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$rank',
                  style: AppTypography.labelSmall.copyWith(
                    color: rank <= 3 ? AppColors.white : AppColors.espressoBrown,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(name, style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
          Row(
            children: [
              Text(sold, style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary)),
              const SizedBox(width: 16),
              Text(rev, style: AppTypography.labelMedium.copyWith(fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}
