import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffee_rock_pos/core/constants/constants.dart';
import 'package:coffee_rock_pos/core/utils/currency_formatter.dart';
import 'package:coffee_rock_pos/features/cart/domain/entities/cart_item.dart';
import 'package:coffee_rock_pos/features/products/domain/entities/modifier.dart';
import 'package:coffee_rock_pos/features/products/domain/entities/product.dart';

class CartState {
  final List<CartItemEntity> items;
  final String orderNumber;
  final String orderType; // "Dine-in" or "Takeaway"
  final String tableName; // "Table 04 • Regular Guest"
  final bool isTaxEnabled;
  final bool isServiceChargeEnabled;

  const CartState({
    this.items = const [],
    this.orderNumber = '#CR-1048',
    this.orderType = 'Dine-in',
    this.tableName = 'Table 04 • Regular Guest',
    this.isTaxEnabled = true,
    this.isServiceChargeEnabled = true,
  });

  int get totalItemCount => items.fold(0, (sum, item) => sum + item.quantity);

  int get subtotal => items.fold(0, (sum, item) => sum + item.lineTotal);

  int get pb1Tax => isTaxEnabled ? CurrencyFormatter.calculatePb1Tax(subtotal) : 0;

  int get serviceCharge =>
      isServiceChargeEnabled ? CurrencyFormatter.calculateServiceCharge(subtotal) : 0;

  int get totalDue => subtotal + pb1Tax + serviceCharge;

  CartState copyWith({
    List<CartItemEntity>? items,
    String? orderNumber,
    String? orderType,
    String? tableName,
    bool? isTaxEnabled,
    bool? isServiceChargeEnabled,
  }) {
    return CartState(
      items: items ?? this.items,
      orderNumber: orderNumber ?? this.orderNumber,
      orderType: orderType ?? this.orderType,
      tableName: tableName ?? this.tableName,
      isTaxEnabled: isTaxEnabled ?? this.isTaxEnabled,
      isServiceChargeEnabled: isServiceChargeEnabled ?? this.isServiceChargeEnabled,
    );
  }
}

class CartViewModel extends StateNotifier<CartState> {
  CartViewModel() : super(const CartState()) {
    _initDefaultItems();
  }

  void _initDefaultItems() {
    // Seed standard order matching user prompt design
    const sizeL = ProductVariant(id: 2, name: 'Size L', priceAdjustment: 6000);
    const sizeReg = ProductVariant(id: 1, name: 'Size Reg', priceAdjustment: 0);
    const standardVariant = ProductVariant(id: 601, name: 'Standard', priceAdjustment: 0);

    final item1 = CartItemEntity(
      uniqueId: '1-v2-mods[102,203]',
      product: const ProductEntity(
        id: 1,
        categoryId: 1,
        name: 'Rock Caramel Cloud',
        shortDescription: 'Espresso, sea salt foam, artisan caramel',
        basePrice: 48000,
        imageUrl: AppConstants.imgRockCaramelCloud,
      ),
      selectedVariant: sizeL,
      selectedModifiers: const [
        ModifierOptionEntity(id: 102, groupId: 1, name: 'Oat Milk', priceAdjustment: 8000),
        ModifierOptionEntity(id: 203, groupId: 2, name: '50% Sweetness', priceAdjustment: 0),
      ],
      quantity: 2,
    );

    final item2 = CartItemEntity(
      uniqueId: '2-v1-mods[304]',
      product: const ProductEntity(
        id: 2,
        categoryId: 1,
        name: 'Cascading Cold Brew',
        shortDescription: '16-hour steep, velvety cascading froth',
        basePrice: 45000,
        imageUrl: AppConstants.imgCascadingColdBrew,
      ),
      selectedVariant: sizeReg,
      selectedModifiers: const [
        ModifierOptionEntity(id: 304, groupId: 3, name: 'Vanilla Foam Top', priceAdjustment: 0),
      ],
      quantity: 1,
    );

    final item3 = CartItemEntity(
      uniqueId: '6-v601-mods[401,402]',
      product: const ProductEntity(
        id: 6,
        categoryId: 4,
        name: 'French Butter Croissant',
        shortDescription: 'Isigny butter, flaky honeycomb lamination',
        basePrice: 28000,
        imageUrl: AppConstants.imgFrenchCroissant,
      ),
      selectedVariant: standardVariant,
      selectedModifiers: const [
        ModifierOptionEntity(id: 401, groupId: 4, name: 'Warmed up', priceAdjustment: 0),
        ModifierOptionEntity(id: 402, groupId: 4, name: 'Pure Strawberry Jam', priceAdjustment: 0),
      ],
      quantity: 1,
    );

    state = state.copyWith(items: [item1, item2, item3]);
  }

  void addItem({
    required ProductEntity product,
    required ProductVariant variant,
    List<ModifierOptionEntity> modifiers = const [],
    int quantity = 1,
    String? notes,
  }) {
    final uniqueId = CartItemEntity.generateId(product.id, variant.id, modifiers);
    final existingIndex = state.items.indexWhere((item) => item.uniqueId == uniqueId);

    if (existingIndex != -1) {
      final existing = state.items[existingIndex];
      final updatedList = List<CartItemEntity>.from(state.items);
      updatedList[existingIndex] = existing.copyWith(quantity: existing.quantity + quantity);
      state = state.copyWith(items: updatedList);
    } else {
      final newItem = CartItemEntity(
        uniqueId: uniqueId,
        product: product,
        selectedVariant: variant,
        selectedModifiers: modifiers,
        quantity: quantity,
        notes: notes,
      );
      state = state.copyWith(items: [...state.items, newItem]);
    }
  }

  void updateQuantity(String uniqueId, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(uniqueId);
      return;
    }
    final updatedList = state.items.map((item) {
      if (item.uniqueId == uniqueId) {
        return item.copyWith(quantity: newQuantity);
      }
      return item;
    }).toList();
    state = state.copyWith(items: updatedList);
  }

  void removeItem(String uniqueId) {
    state = state.copyWith(
      items: state.items.where((item) => item.uniqueId != uniqueId).toList(),
    );
  }

  void clearCart() {
    state = state.copyWith(items: []);
  }

  void setOrderType(String type) {
    state = state.copyWith(orderType: type);
  }

  void setTableName(String table) {
    state = state.copyWith(tableName: table);
  }

  void generateNewTicket() {
    final newId = '#CR-${DateTime.now().millisecondsSinceEpoch % 10000}';
    state = state.copyWith(items: [], orderNumber: newId);
  }
}

final cartViewModelProvider =
    StateNotifierProvider<CartViewModel, CartState>((ref) {
  return CartViewModel();
});
