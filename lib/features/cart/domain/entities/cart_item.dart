import '../../../products/domain/entities/product.dart';
import '../../../products/domain/entities/modifier.dart';

class CartItemEntity {
  final String uniqueId; // Generated composite key
  final ProductEntity product;
  final ProductVariant selectedVariant;
  final List<ModifierOptionEntity> selectedModifiers;
  final int quantity;
  final String? notes;

  CartItemEntity({
    required this.uniqueId,
    required this.product,
    required this.selectedVariant,
    this.selectedModifiers = const [],
    this.quantity = 1,
    this.notes,
  });

  /// Computes authoritative unit price in integer Rupiah
  int get unitPrice {
    int price = product.basePrice + selectedVariant.priceAdjustment;
    for (final mod in selectedModifiers) {
      price += mod.priceAdjustment;
    }
    return price;
  }

  /// Line total in integer Rupiah
  int get lineTotal => unitPrice * quantity;

  /// Helper to generate distinct line ID for combinations
  static String generateId(
    int productId,
    int variantId,
    List<ModifierOptionEntity> modifiers,
  ) {
    final sortedModIds = modifiers.map((m) => m.id).toList()..sort();
    return '$productId-v$variantId-mods[${sortedModIds.join(",")}]';
  }

  CartItemEntity copyWith({
    String? uniqueId,
    ProductEntity? product,
    ProductVariant? selectedVariant,
    List<ModifierOptionEntity>? selectedModifiers,
    int? quantity,
    String? notes,
  }) {
    return CartItemEntity(
      uniqueId: uniqueId ?? this.uniqueId,
      product: product ?? this.product,
      selectedVariant: selectedVariant ?? this.selectedVariant,
      selectedModifiers: selectedModifiers ?? this.selectedModifiers,
      quantity: quantity ?? this.quantity,
      notes: notes ?? this.notes,
    );
  }
}
