import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../domain/entities/cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItemEntity item;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;
  final VoidCallback? onEditModifier;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
    this.onEditModifier,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.beige.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.product.imageUrl,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 52,
                    height: 52,
                    color: AppColors.surfaceContainer,
                    child: const Icon(Icons.local_cafe, size: 24, color: AppColors.caramel),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Title and Price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            item.product.name,
                            style: AppTypography.headlineSm.copyWith(
                              fontSize: 15,
                              color: AppColors.espressoBrown,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          CurrencyFormatter.format(item.lineTotal),
                          style: AppTypography.numericCurrency.copyWith(
                            fontSize: 15,
                            color: AppColors.espressoBrown,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Modifiers list
                    if (item.selectedVariant.name.isNotEmpty &&
                        item.selectedVariant.name != 'Standard')
                      Text(
                        '• ${item.selectedVariant.name} ${item.selectedVariant.priceAdjustment > 0 ? "(+${CurrencyFormatter.format(item.selectedVariant.priceAdjustment)})" : ""}',
                        style: AppTypography.bodySm.copyWith(
                          fontSize: 11,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ...item.selectedModifiers.map(
                      (m) => Text(
                        '• ${m.name} ${m.priceAdjustment > 0 ? "(+${CurrencyFormatter.format(m.priceAdjustment)})" : ""}',
                        style: AppTypography.bodySm.copyWith(
                          fontSize: 11,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    if (item.notes != null && item.notes!.isNotEmpty)
                      Text(
                        'Note: ${item.notes}',
                        style: AppTypography.bodySm.copyWith(
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                          color: AppColors.caramel,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Action Stepper and Edit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onEditModifier,
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                  child: Row(
                    children: [
                      const Icon(Icons.edit_note, size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text(
                        'Edit modifier',
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(2),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (item.quantity > 1) {
                          onQuantityChanged(item.quantity - 1);
                        } else {
                          onRemove();
                        }
                      },
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          item.quantity > 1 ? Icons.remove : Icons.delete_outline,
                          size: 16,
                          color: item.quantity > 1
                              ? AppColors.espressoBrown
                              : AppColors.error,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 28,
                      child: Text(
                        '${item.quantity}',
                        textAlign: TextAlign.center,
                        style: AppTypography.headlineSm.copyWith(
                          fontSize: 14,
                          color: AppColors.espressoBrown,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => onQuantityChanged(item.quantity + 1),
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.add,
                          size: 16,
                          color: AppColors.espressoBrown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
