import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onTap;
  final VoidCallback onQuickAdd;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onQuickAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.beige, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(66, 43, 32, 0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Product Image with Badge
              Expanded(
                flex: 5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.surfaceContainer,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.local_cafe_outlined,
                          size: 40,
                          color: AppColors.caramel,
                        ),
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: AppColors.surfaceContainerLow,
                          child: const Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.caramel,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    if (product.badge != null)
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getBadgeColor(product.badge!),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Text(
                            product.badge!.toUpperCase(),
                            style: AppTypography.labelSm.copyWith(
                              color: _getBadgeTextColor(product.badge!),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    if (!product.isAvailable)
                      Container(
                        color: Colors.black.withOpacity(0.55),
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.darkCoffee,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'HABIS / SOLD OUT',
                            style: AppTypography.labelSm.copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Product Info & Quick Action
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: AppTypography.headlineSm.copyWith(
                              fontSize: 16,
                              color: AppColors.espressoBrown,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            product.shortDescription,
                            style: AppTypography.bodySm.copyWith(
                              fontSize: 11,
                              color: AppColors.textSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            CurrencyFormatter.format(product.basePrice),
                            style: AppTypography.numericCurrency.copyWith(
                              fontSize: 16,
                              color: AppColors.espressoBrown,
                            ),
                          ),
                          Material(
                            color: AppColors.espressoBrown,
                            shape: const CircleBorder(),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: onQuickAdd,
                              child: const SizedBox(
                                width: 36,
                                height: 36,
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getBadgeColor(String badge) {
    if (badge.contains('Best Seller')) return AppColors.secondary;
    if (badge.contains('Nitro')) return AppColors.darkCoffee;
    if (badge.contains('Cup of Excellence')) return AppColors.surfaceContainerHighest;
    if (badge.contains('Ceremonial')) return AppColors.secondaryFixed;
    if (badge.contains('Ethiopia')) return const Color(0xFFFFDBCC);
    return AppColors.secondary;
  }

  Color _getBadgeTextColor(String badge) {
    if (badge.contains('Cup of Excellence')) return AppColors.textSecondary;
    if (badge.contains('Ceremonial')) return const Color(0xFF673D16);
    if (badge.contains('Ethiopia')) return AppColors.espressoBrown;
    return AppColors.white;
  }
}
