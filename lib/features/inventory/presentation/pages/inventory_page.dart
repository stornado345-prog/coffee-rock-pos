import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final inventoryItems = [
      {'name': 'Ethiopia Guji Roasted Beans', 'category': 'Coffee Beans', 'stock': '14.5 kg', 'min': '5.0 kg', 'status': 'OK'},
      {'name': 'Brazil Cerrado Espresso Blend', 'category': 'Coffee Beans', 'stock': '22.0 kg', 'min': '10.0 kg', 'status': 'OK'},
      {'name': 'Greenfields Fresh Milk 1L', 'category': 'Dairy & Plant Milk', 'stock': '18 cartons', 'min': '20 cartons', 'status': 'LOW'},
      {'name': 'Oatside Barista Blend Oat Milk', 'category': 'Dairy & Plant Milk', 'stock': '34 cartons', 'min': '15 cartons', 'status': 'OK'},
      {'name': 'Artisan Caramel Sauce 2L', 'category': 'Syrups & Sauces', 'stock': '3 bottles', 'min': '2 bottles', 'status': 'OK'},
      {'name': 'Sea Salt Cream Base 1L', 'category': 'Syrups & Sauces', 'stock': '1 bottle', 'min': '3 bottles', 'status': 'REORDER'},
      {'name': 'Paper Cup 12oz Cold (Bespoke Logo)', 'category': 'Packaging', 'stock': '450 pcs', 'min': '200 pcs', 'status': 'OK'},
      {'name': 'Biodegradable Straws', 'category': 'Packaging', 'stock': '600 pcs', 'min': '300 pcs', 'status': 'OK'},
    ];

    return Container(
      color: AppColors.canvas,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bar & Roastery Inventory',
                    style: AppTypography.headlineLarge.copyWith(
                      color: AppColors.espressoBrown,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Track raw beans, dairy consumption, and packaging levels in real time',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Restock PO submitted to roastery')),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart, size: 18),
                label: const Text('New Stock Intake'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.espressoBrown,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Inventory cards
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.beige),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: inventoryItems.length,
                separatorBuilder: (_, __) => const Divider(color: AppColors.beige),
                itemBuilder: (context, index) {
                  final item = inventoryItems[index];
                  final isLow = item['status'] == 'LOW' || item['status'] == 'REORDER';

                  return ListTile(
                    leading: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: isLow
                            ? AppColors.errorContainer
                            : AppColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isLow ? Icons.warning_amber_rounded : Icons.inventory_2,
                        color: isLow ? AppColors.error : AppColors.caramel,
                      ),
                    ),
                    title: Text(
                      item['name']!,
                      style: AppTypography.headlineSmall.copyWith(
                        fontSize: 15,
                        color: AppColors.espressoBrown,
                      ),
                    ),
                    subtitle: Text(
                      '${item['category']} • Min threshold: ${item['min']}',
                      style: AppTypography.bodySmall,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item['stock']!,
                          style: AppTypography.numericCurrency.copyWith(
                            fontSize: 16,
                            color: isLow ? AppColors.error : AppColors.espressoBrown,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: isLow ? AppColors.error : AppColors.success,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            item['status']!,
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
