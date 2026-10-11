import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../cart/presentation/viewmodels/cart_viewmodel.dart';
import '../../../cart/presentation/widgets/cart_panel.dart';
import '../../../checkout/presentation/widgets/payment_dialog.dart';
import '../../domain/entities/product.dart';
import '../viewmodels/products_viewmodel.dart';
import '../widgets/category_chips.dart';
import '../widgets/product_card.dart';
import '../widgets/product_customization_dialog.dart';

class PosPage extends ConsumerStatefulWidget {
  const PosPage({super.key});

  @override
  ConsumerState<PosPage> createState() => _PosPageState();
}

class _PosPageState extends ConsumerState<PosPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openCustomizationDialog(ProductEntity product) {
    showDialog(
      context: context,
      builder: (ctx) => ProductCustomizationDialog(
        product: product,
        onAddToCart: ({
          required variant,
          required modifiers,
          required quantity,
          notes,
        }) {
          ref.read(cartViewModelProvider.notifier).addItem(
                product: product,
                variant: variant,
                modifiers: modifiers,
                quantity: quantity,
                notes: notes,
              );
        },
      ),
    );
  }

  void _quickAddToCart(ProductEntity product) {
    final variant = product.variants.isNotEmpty
        ? product.variants.first
        : const ProductVariant(id: 0, name: 'Standard', priceAdjustment: 0);

    ref.read(cartViewModelProvider.notifier).addItem(
          product: product,
          variant: variant,
          quantity: 1,
        );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added ${product.name} to order'),
        duration: const Duration(milliseconds: 900),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _openCheckoutDialog() {
    showDialog(
      context: context,
      builder: (ctx) => const PaymentDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(productsViewModelProvider);
    final productsNotifier = ref.read(productsViewModelProvider.notifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        // On tablet landscape, cart is persistent on the right (approx 360px)
        final bool isLandscapeTablet = availableWidth >= 900;
        final int crossAxisCount = availableWidth >= 1200 ? 3 : 2;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Center Zone: Product Catalog & Fast Ordering
            Expanded(
              flex: 7,
              child: Container(
                color: AppColors.canvas,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Top Search Bar & Shift Pill
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.beige),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(66, 43, 32, 0.03),
                            blurRadius: 6,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search,
                              size: 22, color: AppColors.outline),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              onChanged: productsNotifier.updateSearchQuery,
                              decoration: const InputDecoration(
                                hintText:
                                    'Search coffee, beans, or SKU (e.g. Rock Caramel, Espresso)...',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                filled: false,
                              ),
                              style: AppTypography.bodyMedium,
                            ),
                          ),
                          if (_searchController.text.isNotEmpty)
                            IconButton(
                              onPressed: () {
                                _searchController.clear();
                                productsNotifier.updateSearchQuery('');
                              },
                              icon: const Icon(Icons.clear, size: 18),
                              color: AppColors.outline,
                            ),
                          IconButton(
                            tooltip: 'Scan Barcode / QR',
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Barcode scanner active'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            icon: const Icon(Icons.qr_code_scanner, size: 20),
                            color: AppColors.caramel,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.badge_outlined,
                                    size: 16, color: AppColors.caramel),
                                const SizedBox(width: 6),
                                Text(
                                  AppConstants.defaultShift,
                                  style: AppTypography.labelMedium.copyWith(
                                    color: AppColors.caramel,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Category Filter Chips
                    CategoryChips(
                      categories: productsState.categories,
                      selectedCategoryId: productsState.selectedCategoryId,
                      onCategorySelected: productsNotifier.selectCategory,
                    ),
                    const SizedBox(height: 14),

                    // Products Grid
                    Expanded(
                      child: productsState.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.espressoBrown,
                              ),
                            )
                          : productsState.filteredProducts.isEmpty
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.search_off,
                                          size: 48, color: AppColors.outline),
                                      const SizedBox(height: 12),
                                      Text(
                                        'No matching items found',
                                        style: AppTypography.headlineSm.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    crossAxisSpacing: 14,
                                    mainAxisSpacing: 14,
                                    childAspectRatio: 0.88,
                                  ),
                                  itemCount:
                                      productsState.filteredProducts.length,
                                  itemBuilder: (context, index) {
                                    final product =
                                        productsState.filteredProducts[index];
                                    return ProductCard(
                                      product: product,
                                      onTap: () =>
                                          _openCustomizationDialog(product),
                                      onQuickAdd: () =>
                                          _quickAddToCart(product),
                                    );
                                  },
                                ),
                    ),
                  ],
                ),
              ),
            ),

            // Right Zone: Interactive Persistent Cart Panel
            if (isLandscapeTablet)
              SizedBox(
                width: 360,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                  child: CartPanel(
                    onCheckoutPressed: _openCheckoutDialog,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
