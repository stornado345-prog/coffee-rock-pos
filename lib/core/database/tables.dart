import 'package:drift/drift.dart';

@DataClassName('CategoryRow')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get displayOrder => integer().withDefault(const Constant(0))();
  TextColumn get iconName => text().withDefault(const Constant('local_cafe'))();
}

@DataClassName('ProductRow')
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  TextColumn get name => text()();
  TextColumn get shortDescription => text()();
  IntColumn get basePrice => integer()(); // Price in integer Rupiah
  TextColumn get imageUrl => text()();
  TextColumn get badge => text().nullable()();
  BoolColumn get isAvailable => boolean().withDefault(const Constant(true))();
  BoolColumn get isBestSeller => boolean().withDefault(const Constant(false))();
}

@DataClassName('ProductVariantRow')
class ProductVariants extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().references(Products, #id)();
  TextColumn get name => text()(); // e.g. "Regular", "Large"
  IntColumn get priceAdjustment => integer().withDefault(const Constant(0))();
}

@DataClassName('ModifierGroupRow')
class ModifierGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()(); // e.g. "Milk Option", "Sweetness", "Add-ons"
  BoolColumn get isRequired => boolean().withDefault(const Constant(false))();
  IntColumn get minSelect => integer().withDefault(const Constant(0))();
  IntColumn get maxSelect => integer().withDefault(const Constant(1))();
}

@DataClassName('ModifierOptionRow')
class ModifierOptions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get groupId => integer().references(ModifierGroups, #id)();
  TextColumn get name => text()(); // e.g. "Oat Milk", "50% Sweetness", "Extra Shot"
  IntColumn get priceAdjustment => integer().withDefault(const Constant(0))();
}

@DataClassName('OrderRow')
class Orders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get orderNumber => text()(); // e.g. "#CR-1048"
  TextColumn get orderType => text()(); // "Dine-in", "Takeaway"
  TextColumn get tableLabel => text()(); // "Table 04 • Regular Guest"
  TextColumn get cashierName => text()();
  TextColumn get shiftName => text()();
  IntColumn get subtotalRupiah => integer()();
  IntColumn get taxPb1Rupiah => integer()();
  IntColumn get serviceChargeRupiah => integer()();
  IntColumn get totalRupiah => integer()();
  TextColumn get status => text().withDefault(const Constant('COMPLETED'))(); // COMPLETED, VOIDED
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('OrderItemRow')
class OrderItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderId => integer().references(Orders, #id)();
  IntColumn get productId => integer()();
  TextColumn get productName => text()(); // Snapshot
  TextColumn get variantName => text().withDefault(const Constant('Standard'))();
  IntColumn get unitPriceRupiah => integer()();
  IntColumn get quantity => integer()();
  IntColumn get lineTotalRupiah => integer()();
  TextColumn get notes => text().nullable()();
}

@DataClassName('OrderItemModifierRow')
class OrderItemModifiers extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderItemId => integer().references(OrderItems, #id)();
  TextColumn get modifierName => text()(); // Snapshot
  IntColumn get priceAdjustmentRupiah => integer()();
}

@DataClassName('PaymentRow')
class Payments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderId => integer().references(Orders, #id)();
  TextColumn get paymentMethod => text()(); // "QRIS", "EDC", "CASH"
  IntColumn get amountPaidRupiah => integer()();
  IntColumn get changeDueRupiah => integer().withDefault(const Constant(0))();
  TextColumn get referenceCode => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('SUCCESS'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('SettingRow')
class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}
