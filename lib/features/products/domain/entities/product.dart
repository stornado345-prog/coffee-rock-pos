import 'modifier.dart';

class ProductVariant {
  final int id;
  final String name; // e.g. "Regular", "Large"
  final int priceAdjustment; // integer Rupiah (+6000)

  const ProductVariant({
    required this.id,
    required this.name,
    this.priceAdjustment = 0,
  });
}

class ProductEntity {
  final int id;
  final int categoryId;
  final String name;
  final String shortDescription;
  final int basePrice; // In integer Rupiah (e.g. 48000)
  final String imageUrl;
  final String? badge; // "Best Seller", "Nitro Cold Drip", etc.
  final bool isAvailable;
  final bool isBestSeller;
  final List<ProductVariant> variants;
  final List<ModifierGroupEntity> modifierGroups;

  const ProductEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.shortDescription,
    required this.basePrice,
    required this.imageUrl,
    this.badge,
    this.isAvailable = true,
    this.isBestSeller = false,
    this.variants = const [],
    this.modifierGroups = const [],
  });

  ProductEntity copyWith({
    int? id,
    int? categoryId,
    String? name,
    String? shortDescription,
    int? basePrice,
    String? imageUrl,
    String? badge,
    bool? isAvailable,
    bool? isBestSeller,
    List<ProductVariant>? variants,
    List<ModifierGroupEntity>? modifierGroups,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      shortDescription: shortDescription ?? this.shortDescription,
      basePrice: basePrice ?? this.basePrice,
      imageUrl: imageUrl ?? this.imageUrl,
      badge: badge ?? this.badge,
      isAvailable: isAvailable ?? this.isAvailable,
      isBestSeller: isBestSeller ?? this.isBestSeller,
      variants: variants ?? this.variants,
      modifierGroups: modifierGroups ?? this.modifierGroups,
    );
  }
}
