import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../viewmodels/products_viewmodel.dart';

class MenuManagementPage extends ConsumerWidget {
  const MenuManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsViewModelProvider);
    final productsNotifier = ref.read(productsViewModelProvider.notifier);

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
                    'Menu & Product Management',
                    style: AppTypography.headlineLarge.copyWith(
                      color: AppColors.espressoBrown,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Update live availability, edit base prices, and manage modifier groups',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Add New Product dialog')),
                  );
                },
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add Product'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.espressoBrown,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Product table
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.beige),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: productsState.products.length,
                separatorBuilder: (_, __) => const Divider(color: AppColors.beige),
                itemBuilder: (context, index) {
                  final product = productsState.products[index];

                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.imageUrl,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 48,
                          height: 48,
                          color: AppColors.surfaceContainer,
                          child: const Icon(Icons.coffee, color: AppColors.caramel),
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          product.name,
                          style: AppTypography.headlineSmall.copyWith(
                            fontSize: 16,
                            color: AppColors.espressoBrown,
                          ),
                        ),
                        if (product.badge != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              product.badge!,
                              style: AppTypography.labelSmall.copyWith(
                                color: AppColors.caramel,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    subtitle: Text(
                      '${product.shortDescription} • Variants: ${product.variants.length}',
                      style: AppTypography.bodySmall,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          CurrencyFormatter.format(product.basePrice),
                          style: AppTypography.numericCurrency.copyWith(
                            fontSize: 16,
                            color: AppColors.espressoBrown,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Row(
                          children: [
                            Text(
                              product.isAvailable ? 'In Stock' : 'Habis',
                              style: AppTypography.bodySmall.copyWith(
                                color: product.isAvailable
                                    ? AppColors.success
                                    : AppColors.error,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Switch(
                              value: product.isAvailable,
                              activeColor: AppColors.espressoBrown,
                              onChanged: (val) {
                                productsNotifier.toggleAvailability(product.id, val);
                              },
                            ),
                          ],
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
