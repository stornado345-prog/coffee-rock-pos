import 'package:coffee_rock_pos/core/constants/constants.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/modifier.dart';
import '../../domain/entities/product.dart';

class ProductLocalDataSource {
  static List<CategoryEntity> getInitialCategories() {
    return const [
      CategoryEntity(id: 0, name: 'All', displayOrder: 0, itemCount: 16),
      CategoryEntity(id: 1, name: 'Coffee', displayOrder: 1, itemCount: 8),
      CategoryEntity(id: 2, name: 'Non Coffee', displayOrder: 2, itemCount: 4),
      CategoryEntity(id: 3, name: 'Tea', displayOrder: 3, itemCount: 2),
      CategoryEntity(id: 4, name: 'Pastry & Food', displayOrder: 4, itemCount: 2),
      CategoryEntity(id: 5, name: 'Whole Beans', displayOrder: 5, itemCount: 3),
    ];
  }

  static List<ProductEntity> getInitialProducts() {
    // Shared modifier groups
    const sizeVariants = [
      ProductVariant(id: 1, name: 'Regular', priceAdjustment: 0),
      ProductVariant(id: 2, name: 'Size L', priceAdjustment: 6000),
    ];

    const milkGroup = ModifierGroupEntity(
      id: 1,
      name: 'Milk Choice',
      isRequired: false,
      minSelect: 0,
      maxSelect: 1,
      options: [
        ModifierOptionEntity(id: 101, groupId: 1, name: 'Fresh Dairy Milk', priceAdjustment: 0),
        ModifierOptionEntity(id: 102, groupId: 1, name: 'Oat Milk', priceAdjustment: 8000),
        ModifierOptionEntity(id: 103, groupId: 1, name: 'Almond Milk', priceAdjustment: 8000),
      ],
    );

    const sweetnessGroup = ModifierGroupEntity(
      id: 2,
      name: 'Sweetness',
      isRequired: false,
      minSelect: 0,
      maxSelect: 1,
      options: [
        ModifierOptionEntity(id: 201, groupId: 2, name: 'Normal (100%)', priceAdjustment: 0),
        ModifierOptionEntity(id: 202, groupId: 2, name: 'Less Sweet (70%)', priceAdjustment: 0),
        ModifierOptionEntity(id: 203, groupId: 2, name: '50% Sweetness', priceAdjustment: 0),
        ModifierOptionEntity(id: 204, groupId: 2, name: 'No Sugar (0%)', priceAdjustment: 0),
      ],
    );

    const extrasGroup = ModifierGroupEntity(
      id: 3,
      name: 'Add-ons & Extras',
      isRequired: false,
      minSelect: 0,
      maxSelect: 3,
      options: [
        ModifierOptionEntity(id: 301, groupId: 3, name: 'Extra Espresso Shot', priceAdjustment: 6000),
        ModifierOptionEntity(id: 302, groupId: 3, name: 'Sea Salt Foam', priceAdjustment: 5000),
        ModifierOptionEntity(id: 303, groupId: 3, name: 'Artisan Caramel Drizzle', priceAdjustment: 4000),
        ModifierOptionEntity(id: 304, groupId: 3, name: 'Vanilla Foam Top', priceAdjustment: 5000),
      ],
    );

    return [
      // 1. Rock Caramel Cloud
      const ProductEntity(
        id: 1,
        categoryId: 1,
        name: 'Rock Caramel Cloud',
        shortDescription: 'Espresso, sea salt foam, artisan caramel',
        basePrice: 48000,
        imageUrl: AppConstants.imgRockCaramelCloud,
        badge: 'Best Seller',
        isBestSeller: true,
        variants: sizeVariants,
        modifierGroups: [sweetnessGroup, milkGroup, extrasGroup],
      ),

      // 2. Cascading Cold Brew
      const ProductEntity(
        id: 2,
        categoryId: 1,
        name: 'Cascading Cold Brew',
        shortDescription: '16-hour steep, velvety cascading froth',
        basePrice: 45000,
        imageUrl: AppConstants.imgCascadingColdBrew,
        badge: 'Nitro Cold Drip',
        variants: sizeVariants,
        modifierGroups: [sweetnessGroup, extrasGroup],
      ),

      // 3. Faceted Double Macchiato
      const ProductEntity(
        id: 3,
        categoryId: 1,
        name: 'Faceted Double Macchiato',
        shortDescription: 'Cortado glass, double ristretto, dense foam',
        basePrice: 38000,
        imageUrl: AppConstants.imgFacetedDoubleMacchiato,
        badge: 'Cup of Excellence',
        variants: sizeVariants,
        modifierGroups: [milkGroup, sweetnessGroup, extrasGroup],
      ),

      // 4. Iced Matcha Latte
      const ProductEntity(
        id: 4,
        categoryId: 3,
        name: 'Iced Matcha Latte',
        shortDescription: 'Uji Kyoto matcha, farm fresh milk, raw honey',
        basePrice: 42000,
        imageUrl: AppConstants.imgIcedMatchaLatte,
        badge: 'Ceremonial Grade',
        variants: sizeVariants,
        modifierGroups: [sweetnessGroup, milkGroup, extrasGroup],
      ),

      // 5. Iced Americano
      const ProductEntity(
        id: 5,
        categoryId: 1,
        name: 'Iced Americano',
        shortDescription: 'Floral jasmine notes, stone fruit sweetness',
        basePrice: 32000,
        imageUrl: AppConstants.imgIcedAmericano,
        badge: 'Ethiopia Guji',
        variants: sizeVariants,
        modifierGroups: [sweetnessGroup, extrasGroup],
      ),

      // 6. French Butter Croissant
      const ProductEntity(
        id: 6,
        categoryId: 4,
        name: 'French Butter Croissant',
        shortDescription: 'Isigny butter, flaky honeycomb lamination',
        basePrice: 28000,
        imageUrl: AppConstants.imgFrenchCroissant,
        badge: 'Fresh Baked',
        variants: [
          ProductVariant(id: 601, name: 'Standard', priceAdjustment: 0),
        ],
        modifierGroups: [
          ModifierGroupEntity(
            id: 4,
            name: 'Preparation',
            isRequired: false,
            minSelect: 0,
            maxSelect: 2,
            options: [
              ModifierOptionEntity(id: 401, groupId: 4, name: 'Warmed up', priceAdjustment: 0),
              ModifierOptionEntity(id: 402, groupId: 4, name: 'Pure Strawberry Jam', priceAdjustment: 0),
              ModifierOptionEntity(id: 403, groupId: 4, name: 'French Salted Butter', priceAdjustment: 4000),
            ],
          ),
        ],
      ),

      // 7. Vanilla Bean Latte
      const ProductEntity(
        id: 7,
        categoryId: 1,
        name: 'Vanilla Bean Latte',
        shortDescription: 'Madagascar bourbon vanilla, double shot espresso',
        basePrice: 44000,
        imageUrl: AppConstants.imgRockCaramelCloud,
        variants: sizeVariants,
        modifierGroups: [sweetnessGroup, milkGroup, extrasGroup],
      ),

      // 8. Single Origin Ethiopian Guji Beans
      const ProductEntity(
        id: 8,
        categoryId: 5,
        name: 'Ethiopia Guji 250g',
        shortDescription: 'Natural process, peach, bergamot, floral jasmine',
        basePrice: 125000,
        imageUrl: AppConstants.imgIcedAmericano,
        badge: 'Single Origin',
        variants: [
          ProductVariant(id: 801, name: 'Whole Bean', priceAdjustment: 0),
          ProductVariant(id: 802, name: 'Filter Grind', priceAdjustment: 0),
          ProductVariant(id: 803, name: 'Espresso Grind', priceAdjustment: 0),
        ],
      ),
    ];
  }
}
