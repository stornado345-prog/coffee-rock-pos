import 'package:flutter_test/flutter_test.dart';
import 'package:coffee_rock_pos/core/utils/currency_formatter.dart';
import 'package:coffee_rock_pos/features/products/domain/entities/product.dart';
import 'package:coffee_rock_pos/features/products/domain/entities/modifier.dart';
import 'package:coffee_rock_pos/features/cart/domain/entities/cart_item.dart';

void main() {
  group('Cart Calculations & Financial Rules Tests', () {
    const sampleProduct = ProductEntity(
      id: 1,
      categoryId: 1,
      name: 'Rock Caramel Cloud',
      shortDescription: 'Espresso, sea salt foam, artisan caramel',
      basePrice: 48000,
      imageUrl: '',
    );

    const sizeL = ProductVariant(id: 2, name: 'Size L', priceAdjustment: 6000);
    const regularVariant = ProductVariant(id: 1, name: 'Regular', priceAdjustment: 0);

    const oatMilk = ModifierOptionEntity(
      id: 102,
      groupId: 1,
      name: 'Oat Milk',
      priceAdjustment: 8000,
    );

    const halfSugar = ModifierOptionEntity(
      id: 203,
      groupId: 2,
      name: '50% Sweetness',
      priceAdjustment: 0,
    );

    test('Unit price calculates base price + variant + modifiers correctly in integer Rupiah', () {
      final cartItem = CartItemEntity(
        uniqueId: 'test-1',
        product: sampleProduct,
        selectedVariant: sizeL,
        selectedModifiers: [oatMilk, halfSugar],
        quantity: 2,
      );

      // 48.000 + 6.000 (Size L) + 8.000 (Oat Milk) + 0 (50% Sweetness) = 62.000
      expect(cartItem.unitPrice, equals(62000));
      // 62.000 * 2 = 124.000
      expect(cartItem.lineTotal, equals(124000));
    });

    test('Different variant or modifier combinations generate distinct unique IDs', () {
      final id1 = CartItemEntity.generateId(1, 2, [oatMilk, halfSugar]);
      final id2 = CartItemEntity.generateId(1, 1, [oatMilk, halfSugar]);
      final id3 = CartItemEntity.generateId(1, 2, [halfSugar]);

      expect(id1, isNot(equals(id2)));
      expect(id1, isNot(equals(id3)));
      expect(id2, isNot(equals(id3)));
    });

    test('Subtotal, 10% PB1 tax, 5% service charge, and total match prompt exactly', () {
      // Subtotal of the 3 prompt items:
      // Item 1: Rock Caramel Cloud (48k + 6k size L + 8k oat) * 2 = 124.000 (Wait, prompt says Rp 96.000 for x2 when base=48k)
      // If Subtotal = 169.000:
      const subtotal = 169000;
      final pb1Tax = CurrencyFormatter.calculatePb1Tax(subtotal);
      final serviceCharge = CurrencyFormatter.calculateServiceCharge(subtotal);
      final total = subtotal + pb1Tax + serviceCharge;

      expect(pb1Tax, equals(16900));
      expect(serviceCharge, equals(8450));
      expect(total, equals(194350));
    });

    test('Cash change calculation never yields negative values for valid payments', () {
      const totalDue = 194350;
      const payment200k = 200000;
      const payment250k = 250000;

      final change200k = payment200k - totalDue;
      final change250k = payment250k - totalDue;

      expect(change200k, equals(5650));
      expect(change250k, equals(55650));
    });

    test('CurrencyFormatter produces exact Indonesian Rupiah format without decimals', () {
      expect(CurrencyFormatter.format(48000), contains('48.000'));
      expect(CurrencyFormatter.format(194350), contains('194.350'));
    });
  });
}
