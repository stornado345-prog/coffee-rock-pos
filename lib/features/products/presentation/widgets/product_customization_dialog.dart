import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../domain/entities/modifier.dart';
import '../../domain/entities/product.dart';

class ProductCustomizationDialog extends StatefulWidget {
  final ProductEntity product;
  final Function({
    required ProductVariant variant,
    required List<ModifierOptionEntity> modifiers,
    required int quantity,
    String? notes,
  }) onAddToCart;

  const ProductCustomizationDialog({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  State<ProductCustomizationDialog> createState() =>
      _ProductCustomizationDialogState();
}

class _ProductCustomizationDialogState extends State<ProductCustomizationDialog> {
  late ProductVariant _selectedVariant;
  final Map<int, List<ModifierOptionEntity>> _selectedModifiersByGroup = {};
  int _quantity = 1;
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Default variant
    if (widget.product.variants.isNotEmpty) {
      _selectedVariant = widget.product.variants.first;
    } else {
      _selectedVariant = const ProductVariant(id: 0, name: 'Standard', priceAdjustment: 0);
    }

    // Default modifiers if any
    for (final group in widget.product.modifierGroups) {
      if (group.options.isNotEmpty) {
        _selectedModifiersByGroup[group.id] = [group.options.first];
      } else {
        _selectedModifiersByGroup[group.id] = [];
      }
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  int get _unitPrice {
    int price = widget.product.basePrice + _selectedVariant.priceAdjustment;
    for (final list in _selectedModifiersByGroup.values) {
      for (final mod in list) {
        price += mod.priceAdjustment;
      }
    }
    return price;
  }

  int get _totalPrice => _unitPrice * _quantity;

  List<ModifierOptionEntity> get _allSelectedModifiers {
    final list = <ModifierOptionEntity>[];
    for (final mods in _selectedModifiersByGroup.values) {
      list.addAll(mods);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 680,
        height: 600,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // Modal Header with Product Summary
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.surfaceContainerLow,
                border: Border(bottom: BorderSide(color: AppColors.beige)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.product.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 80,
                        height: 80,
                        color: AppColors.surfaceContainer,
                        child: const Icon(Icons.local_cafe, color: AppColors.caramel),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: AppTypography.headlineMedium.copyWith(
                            color: AppColors.espressoBrown,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.product.shortDescription,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: AppColors.textSecondary),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Customization Groups
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Size Variant Selection
                    if (widget.product.variants.isNotEmpty) ...[
                      Text('Size & Variant', style: AppTypography.labelLarge),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: widget.product.variants.map((v) {
                          final isSelected = v.id == _selectedVariant.id;
                          return InkWell(
                            onTap: () => setState(() => _selectedVariant = v),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.espressoBrown
                                    : AppColors.surface,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.espressoBrown
                                      : AppColors.beige,
                                ),
                              ),
                              child: Text(
                                '${v.name} ${v.priceAdjustment > 0 ? "(+${CurrencyFormatter.format(v.priceAdjustment)})" : ""}',
                                style: AppTypography.bodyMedium.copyWith(
                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.textPrimary,
                                  fontWeight:
                                      isSelected ? FontWeight.w600 : FontWeight.w400,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // Dynamic Modifier Groups (Milk, Sweetness, Extras)
                    ...widget.product.modifierGroups.map((group) {
                      final selectedList = _selectedModifiersByGroup[group.id] ?? [];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(group.name, style: AppTypography.labelLarge),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 10,
                              runSpacing: 8,
                              children: group.options.map((opt) {
                                final isSelected =
                                    selectedList.any((m) => m.id == opt.id);
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (group.maxSelect == 1) {
                                        _selectedModifiersByGroup[group.id] = [opt];
                                      } else {
                                        if (isSelected) {
                                          selectedList.removeWhere((m) => m.id == opt.id);
                                        } else {
                                          if (selectedList.length < group.maxSelect) {
                                            selectedList.add(opt);
                                          }
                                        }
                                        _selectedModifiersByGroup[group.id] = selectedList;
                                      }
                                    });
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColors.espressoBrown
                                          : AppColors.surface,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: isSelected
                                            ? AppColors.espressoBrown
                                            : AppColors.beige,
                                      ),
                                    ),
                                    child: Text(
                                      '${opt.name} ${opt.priceAdjustment > 0 ? "(+${CurrencyFormatter.format(opt.priceAdjustment)})" : ""}',
                                      style: AppTypography.bodySmall.copyWith(
                                        color: isSelected
                                            ? AppColors.white
                                            : AppColors.textPrimary,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      );
                    }),

                    // Notes / Special Instructions
                    Text('Notes / Barista Instructions',
                        style: AppTypography.labelLarge),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        hintText: 'e.g. Extra hot, separate ice, less cinnamon...',
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Action Bar with Total & Add to Cart
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.surfaceContainerLow,
                border: Border(top: BorderSide(color: AppColors.beige)),
              ),
              child: Row(
                children: [
                  // Quantity Stepper
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.beige),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_quantity > 1) {
                              setState(() => _quantity--);
                            }
                          },
                          icon: const Icon(Icons.remove, size: 18),
                          color: AppColors.espressoBrown,
                        ),
                        SizedBox(
                          width: 32,
                          child: Text(
                            '$_quantity',
                            textAlign: TextAlign.center,
                            style: AppTypography.headlineSmall.copyWith(fontSize: 16),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() => _quantity++);
                          },
                          icon: const Icon(Icons.add, size: 18),
                          color: AppColors.espressoBrown,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Add to Cart Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onAddToCart(
                          variant: _selectedVariant,
                          modifiers: _allSelectedModifiers,
                          quantity: _quantity,
                          notes: _notesController.text.trim().isEmpty
                              ? null
                              : _notesController.text.trim(),
                        );
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.espressoBrown,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add to Order',
                            style: AppTypography.headlineSmall.copyWith(
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            CurrencyFormatter.format(_totalPrice),
                            style: AppTypography.numericCurrency.copyWith(
                              fontSize: 18,
                              color: AppColors.white,
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
      ),
    );
  }
}
