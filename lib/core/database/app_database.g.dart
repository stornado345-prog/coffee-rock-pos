// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayOrderMeta =
      const VerificationMeta('displayOrder');
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
      'display_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('local_cafe'));
  @override
  List<GeneratedColumn> get $columns => [id, name, displayOrder, iconName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('display_order')) {
      context.handle(
          _displayOrderMeta,
          displayOrder.isAcceptableOrUnknown(
              data['display_order']!, _displayOrderMeta));
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      displayOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}display_order'])!,
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class CategoryRow extends DataClass implements Insertable<CategoryRow> {
  final int id;
  final String name;
  final int displayOrder;
  final String iconName;
  const CategoryRow(
      {required this.id,
      required this.name,
      required this.displayOrder,
      required this.iconName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['display_order'] = Variable<int>(displayOrder);
    map['icon_name'] = Variable<String>(iconName);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      displayOrder: Value(displayOrder),
      iconName: Value(iconName),
    );
  }

  factory CategoryRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
      iconName: serializer.fromJson<String>(json['iconName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'displayOrder': serializer.toJson<int>(displayOrder),
      'iconName': serializer.toJson<String>(iconName),
    };
  }

  CategoryRow copyWith(
          {int? id, String? name, int? displayOrder, String? iconName}) =>
      CategoryRow(
        id: id ?? this.id,
        name: name ?? this.name,
        displayOrder: displayOrder ?? this.displayOrder,
        iconName: iconName ?? this.iconName,
      );
  CategoryRow copyWithCompanion(CategoriesCompanion data) {
    return CategoryRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('iconName: $iconName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, displayOrder, iconName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.displayOrder == this.displayOrder &&
          other.iconName == this.iconName);
}

class CategoriesCompanion extends UpdateCompanion<CategoryRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> displayOrder;
  final Value<String> iconName;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.iconName = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.displayOrder = const Value.absent(),
    this.iconName = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CategoryRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? displayOrder,
    Expression<String>? iconName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (displayOrder != null) 'display_order': displayOrder,
      if (iconName != null) 'icon_name': iconName,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? displayOrder,
      Value<String>? iconName}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      displayOrder: displayOrder ?? this.displayOrder,
      iconName: iconName ?? this.iconName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('iconName: $iconName')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products
    with TableInfo<$ProductsTable, ProductRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortDescriptionMeta =
      const VerificationMeta('shortDescription');
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
      'short_description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _basePriceMeta =
      const VerificationMeta('basePrice');
  @override
  late final GeneratedColumn<int> basePrice = GeneratedColumn<int>(
      'base_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _badgeMeta = const VerificationMeta('badge');
  @override
  late final GeneratedColumn<String> badge = GeneratedColumn<String>(
      'badge', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isAvailableMeta =
      const VerificationMeta('isAvailable');
  @override
  late final GeneratedColumn<bool> isAvailable = GeneratedColumn<bool>(
      'is_available', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_available" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _isBestSellerMeta =
      const VerificationMeta('isBestSeller');
  @override
  late final GeneratedColumn<bool> isBestSeller = GeneratedColumn<bool>(
      'is_best_seller', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_best_seller" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        categoryId,
        name,
        shortDescription,
        basePrice,
        imageUrl,
        badge,
        isAvailable,
        isBestSeller
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<ProductRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('short_description')) {
      context.handle(
          _shortDescriptionMeta,
          shortDescription.isAcceptableOrUnknown(
              data['short_description']!, _shortDescriptionMeta));
    } else if (isInserting) {
      context.missing(_shortDescriptionMeta);
    }
    if (data.containsKey('base_price')) {
      context.handle(_basePriceMeta,
          basePrice.isAcceptableOrUnknown(data['base_price']!, _basePriceMeta));
    } else if (isInserting) {
      context.missing(_basePriceMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('badge')) {
      context.handle(
          _badgeMeta, badge.isAcceptableOrUnknown(data['badge']!, _badgeMeta));
    }
    if (data.containsKey('is_available')) {
      context.handle(
          _isAvailableMeta,
          isAvailable.isAcceptableOrUnknown(
              data['is_available']!, _isAvailableMeta));
    }
    if (data.containsKey('is_best_seller')) {
      context.handle(
          _isBestSellerMeta,
          isBestSeller.isAcceptableOrUnknown(
              data['is_best_seller']!, _isBestSellerMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      shortDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}short_description'])!,
      basePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}base_price'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      badge: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}badge']),
      isAvailable: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_available'])!,
      isBestSeller: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_best_seller'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class ProductRow extends DataClass implements Insertable<ProductRow> {
  final int id;
  final int categoryId;
  final String name;
  final String shortDescription;
  final int basePrice;
  final String imageUrl;
  final String? badge;
  final bool isAvailable;
  final bool isBestSeller;
  const ProductRow(
      {required this.id,
      required this.categoryId,
      required this.name,
      required this.shortDescription,
      required this.basePrice,
      required this.imageUrl,
      this.badge,
      required this.isAvailable,
      required this.isBestSeller});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['name'] = Variable<String>(name);
    map['short_description'] = Variable<String>(shortDescription);
    map['base_price'] = Variable<int>(basePrice);
    map['image_url'] = Variable<String>(imageUrl);
    if (!nullToAbsent || badge != null) {
      map['badge'] = Variable<String>(badge);
    }
    map['is_available'] = Variable<bool>(isAvailable);
    map['is_best_seller'] = Variable<bool>(isBestSeller);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      name: Value(name),
      shortDescription: Value(shortDescription),
      basePrice: Value(basePrice),
      imageUrl: Value(imageUrl),
      badge:
          badge == null && nullToAbsent ? const Value.absent() : Value(badge),
      isAvailable: Value(isAvailable),
      isBestSeller: Value(isBestSeller),
    );
  }

  factory ProductRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductRow(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      name: serializer.fromJson<String>(json['name']),
      shortDescription: serializer.fromJson<String>(json['shortDescription']),
      basePrice: serializer.fromJson<int>(json['basePrice']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      badge: serializer.fromJson<String?>(json['badge']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
      isBestSeller: serializer.fromJson<bool>(json['isBestSeller']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'name': serializer.toJson<String>(name),
      'shortDescription': serializer.toJson<String>(shortDescription),
      'basePrice': serializer.toJson<int>(basePrice),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'badge': serializer.toJson<String?>(badge),
      'isAvailable': serializer.toJson<bool>(isAvailable),
      'isBestSeller': serializer.toJson<bool>(isBestSeller),
    };
  }

  ProductRow copyWith(
          {int? id,
          int? categoryId,
          String? name,
          String? shortDescription,
          int? basePrice,
          String? imageUrl,
          Value<String?> badge = const Value.absent(),
          bool? isAvailable,
          bool? isBestSeller}) =>
      ProductRow(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        shortDescription: shortDescription ?? this.shortDescription,
        basePrice: basePrice ?? this.basePrice,
        imageUrl: imageUrl ?? this.imageUrl,
        badge: badge.present ? badge.value : this.badge,
        isAvailable: isAvailable ?? this.isAvailable,
        isBestSeller: isBestSeller ?? this.isBestSeller,
      );
  ProductRow copyWithCompanion(ProductsCompanion data) {
    return ProductRow(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      name: data.name.present ? data.name.value : this.name,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      basePrice: data.basePrice.present ? data.basePrice.value : this.basePrice,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      badge: data.badge.present ? data.badge.value : this.badge,
      isAvailable:
          data.isAvailable.present ? data.isAvailable.value : this.isAvailable,
      isBestSeller: data.isBestSeller.present
          ? data.isBestSeller.value
          : this.isBestSeller,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductRow(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('basePrice: $basePrice, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('badge: $badge, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('isBestSeller: $isBestSeller')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, name, shortDescription,
      basePrice, imageUrl, badge, isAvailable, isBestSeller);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductRow &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.name == this.name &&
          other.shortDescription == this.shortDescription &&
          other.basePrice == this.basePrice &&
          other.imageUrl == this.imageUrl &&
          other.badge == this.badge &&
          other.isAvailable == this.isAvailable &&
          other.isBestSeller == this.isBestSeller);
}

class ProductsCompanion extends UpdateCompanion<ProductRow> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<String> name;
  final Value<String> shortDescription;
  final Value<int> basePrice;
  final Value<String> imageUrl;
  final Value<String?> badge;
  final Value<bool> isAvailable;
  final Value<bool> isBestSeller;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.badge = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.isBestSeller = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required String name,
    required String shortDescription,
    required int basePrice,
    required String imageUrl,
    this.badge = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.isBestSeller = const Value.absent(),
  })  : categoryId = Value(categoryId),
        name = Value(name),
        shortDescription = Value(shortDescription),
        basePrice = Value(basePrice),
        imageUrl = Value(imageUrl);
  static Insertable<ProductRow> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? name,
    Expression<String>? shortDescription,
    Expression<int>? basePrice,
    Expression<String>? imageUrl,
    Expression<String>? badge,
    Expression<bool>? isAvailable,
    Expression<bool>? isBestSeller,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
      if (shortDescription != null) 'short_description': shortDescription,
      if (basePrice != null) 'base_price': basePrice,
      if (imageUrl != null) 'image_url': imageUrl,
      if (badge != null) 'badge': badge,
      if (isAvailable != null) 'is_available': isAvailable,
      if (isBestSeller != null) 'is_best_seller': isBestSeller,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<int>? categoryId,
      Value<String>? name,
      Value<String>? shortDescription,
      Value<int>? basePrice,
      Value<String>? imageUrl,
      Value<String?>? badge,
      Value<bool>? isAvailable,
      Value<bool>? isBestSeller}) {
    return ProductsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      shortDescription: shortDescription ?? this.shortDescription,
      basePrice: basePrice ?? this.basePrice,
      imageUrl: imageUrl ?? this.imageUrl,
      badge: badge ?? this.badge,
      isAvailable: isAvailable ?? this.isAvailable,
      isBestSeller: isBestSeller ?? this.isBestSeller,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (basePrice.present) {
      map['base_price'] = Variable<int>(basePrice.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (badge.present) {
      map['badge'] = Variable<String>(badge.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    if (isBestSeller.present) {
      map['is_best_seller'] = Variable<bool>(isBestSeller.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('basePrice: $basePrice, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('badge: $badge, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('isBestSeller: $isBestSeller')
          ..write(')'))
        .toString();
  }
}

class $ProductVariantsTable extends ProductVariants
    with TableInfo<$ProductVariantsTable, ProductVariantRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductVariantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceAdjustmentMeta =
      const VerificationMeta('priceAdjustment');
  @override
  late final GeneratedColumn<int> priceAdjustment = GeneratedColumn<int>(
      'price_adjustment', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, productId, name, priceAdjustment];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_variants';
  @override
  VerificationContext validateIntegrity(Insertable<ProductVariantRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price_adjustment')) {
      context.handle(
          _priceAdjustmentMeta,
          priceAdjustment.isAcceptableOrUnknown(
              data['price_adjustment']!, _priceAdjustmentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductVariantRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductVariantRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      priceAdjustment: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price_adjustment'])!,
    );
  }

  @override
  $ProductVariantsTable createAlias(String alias) {
    return $ProductVariantsTable(attachedDatabase, alias);
  }
}

class ProductVariantRow extends DataClass
    implements Insertable<ProductVariantRow> {
  final int id;
  final int productId;
  final String name;
  final int priceAdjustment;
  const ProductVariantRow(
      {required this.id,
      required this.productId,
      required this.name,
      required this.priceAdjustment});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['name'] = Variable<String>(name);
    map['price_adjustment'] = Variable<int>(priceAdjustment);
    return map;
  }

  ProductVariantsCompanion toCompanion(bool nullToAbsent) {
    return ProductVariantsCompanion(
      id: Value(id),
      productId: Value(productId),
      name: Value(name),
      priceAdjustment: Value(priceAdjustment),
    );
  }

  factory ProductVariantRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductVariantRow(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      name: serializer.fromJson<String>(json['name']),
      priceAdjustment: serializer.fromJson<int>(json['priceAdjustment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'name': serializer.toJson<String>(name),
      'priceAdjustment': serializer.toJson<int>(priceAdjustment),
    };
  }

  ProductVariantRow copyWith(
          {int? id, int? productId, String? name, int? priceAdjustment}) =>
      ProductVariantRow(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        name: name ?? this.name,
        priceAdjustment: priceAdjustment ?? this.priceAdjustment,
      );
  ProductVariantRow copyWithCompanion(ProductVariantsCompanion data) {
    return ProductVariantRow(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      name: data.name.present ? data.name.value : this.name,
      priceAdjustment: data.priceAdjustment.present
          ? data.priceAdjustment.value
          : this.priceAdjustment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductVariantRow(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('priceAdjustment: $priceAdjustment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, name, priceAdjustment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductVariantRow &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.name == this.name &&
          other.priceAdjustment == this.priceAdjustment);
}

class ProductVariantsCompanion extends UpdateCompanion<ProductVariantRow> {
  final Value<int> id;
  final Value<int> productId;
  final Value<String> name;
  final Value<int> priceAdjustment;
  const ProductVariantsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.name = const Value.absent(),
    this.priceAdjustment = const Value.absent(),
  });
  ProductVariantsCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required String name,
    this.priceAdjustment = const Value.absent(),
  })  : productId = Value(productId),
        name = Value(name);
  static Insertable<ProductVariantRow> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<String>? name,
    Expression<int>? priceAdjustment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (name != null) 'name': name,
      if (priceAdjustment != null) 'price_adjustment': priceAdjustment,
    });
  }

  ProductVariantsCompanion copyWith(
      {Value<int>? id,
      Value<int>? productId,
      Value<String>? name,
      Value<int>? priceAdjustment}) {
    return ProductVariantsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      priceAdjustment: priceAdjustment ?? this.priceAdjustment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (priceAdjustment.present) {
      map['price_adjustment'] = Variable<int>(priceAdjustment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductVariantsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('priceAdjustment: $priceAdjustment')
          ..write(')'))
        .toString();
  }
}

class $ModifierGroupsTable extends ModifierGroups
    with TableInfo<$ModifierGroupsTable, ModifierGroupRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModifierGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isRequiredMeta =
      const VerificationMeta('isRequired');
  @override
  late final GeneratedColumn<bool> isRequired = GeneratedColumn<bool>(
      'is_required', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_required" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _minSelectMeta =
      const VerificationMeta('minSelect');
  @override
  late final GeneratedColumn<int> minSelect = GeneratedColumn<int>(
      'min_select', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _maxSelectMeta =
      const VerificationMeta('maxSelect');
  @override
  late final GeneratedColumn<int> maxSelect = GeneratedColumn<int>(
      'max_select', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, isRequired, minSelect, maxSelect];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'modifier_groups';
  @override
  VerificationContext validateIntegrity(Insertable<ModifierGroupRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_required')) {
      context.handle(
          _isRequiredMeta,
          isRequired.isAcceptableOrUnknown(
              data['is_required']!, _isRequiredMeta));
    }
    if (data.containsKey('min_select')) {
      context.handle(_minSelectMeta,
          minSelect.isAcceptableOrUnknown(data['min_select']!, _minSelectMeta));
    }
    if (data.containsKey('max_select')) {
      context.handle(_maxSelectMeta,
          maxSelect.isAcceptableOrUnknown(data['max_select']!, _maxSelectMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ModifierGroupRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModifierGroupRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isRequired: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_required'])!,
      minSelect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_select'])!,
      maxSelect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_select'])!,
    );
  }

  @override
  $ModifierGroupsTable createAlias(String alias) {
    return $ModifierGroupsTable(attachedDatabase, alias);
  }
}

class ModifierGroupRow extends DataClass
    implements Insertable<ModifierGroupRow> {
  final int id;
  final String name;
  final bool isRequired;
  final int minSelect;
  final int maxSelect;
  const ModifierGroupRow(
      {required this.id,
      required this.name,
      required this.isRequired,
      required this.minSelect,
      required this.maxSelect});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_required'] = Variable<bool>(isRequired);
    map['min_select'] = Variable<int>(minSelect);
    map['max_select'] = Variable<int>(maxSelect);
    return map;
  }

  ModifierGroupsCompanion toCompanion(bool nullToAbsent) {
    return ModifierGroupsCompanion(
      id: Value(id),
      name: Value(name),
      isRequired: Value(isRequired),
      minSelect: Value(minSelect),
      maxSelect: Value(maxSelect),
    );
  }

  factory ModifierGroupRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModifierGroupRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isRequired: serializer.fromJson<bool>(json['isRequired']),
      minSelect: serializer.fromJson<int>(json['minSelect']),
      maxSelect: serializer.fromJson<int>(json['maxSelect']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isRequired': serializer.toJson<bool>(isRequired),
      'minSelect': serializer.toJson<int>(minSelect),
      'maxSelect': serializer.toJson<int>(maxSelect),
    };
  }

  ModifierGroupRow copyWith(
          {int? id,
          String? name,
          bool? isRequired,
          int? minSelect,
          int? maxSelect}) =>
      ModifierGroupRow(
        id: id ?? this.id,
        name: name ?? this.name,
        isRequired: isRequired ?? this.isRequired,
        minSelect: minSelect ?? this.minSelect,
        maxSelect: maxSelect ?? this.maxSelect,
      );
  ModifierGroupRow copyWithCompanion(ModifierGroupsCompanion data) {
    return ModifierGroupRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isRequired:
          data.isRequired.present ? data.isRequired.value : this.isRequired,
      minSelect: data.minSelect.present ? data.minSelect.value : this.minSelect,
      maxSelect: data.maxSelect.present ? data.maxSelect.value : this.maxSelect,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModifierGroupRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isRequired: $isRequired, ')
          ..write('minSelect: $minSelect, ')
          ..write('maxSelect: $maxSelect')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isRequired, minSelect, maxSelect);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModifierGroupRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.isRequired == this.isRequired &&
          other.minSelect == this.minSelect &&
          other.maxSelect == this.maxSelect);
}

class ModifierGroupsCompanion extends UpdateCompanion<ModifierGroupRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isRequired;
  final Value<int> minSelect;
  final Value<int> maxSelect;
  const ModifierGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isRequired = const Value.absent(),
    this.minSelect = const Value.absent(),
    this.maxSelect = const Value.absent(),
  });
  ModifierGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.isRequired = const Value.absent(),
    this.minSelect = const Value.absent(),
    this.maxSelect = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ModifierGroupRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isRequired,
    Expression<int>? minSelect,
    Expression<int>? maxSelect,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isRequired != null) 'is_required': isRequired,
      if (minSelect != null) 'min_select': minSelect,
      if (maxSelect != null) 'max_select': maxSelect,
    });
  }

  ModifierGroupsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<bool>? isRequired,
      Value<int>? minSelect,
      Value<int>? maxSelect}) {
    return ModifierGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isRequired: isRequired ?? this.isRequired,
      minSelect: minSelect ?? this.minSelect,
      maxSelect: maxSelect ?? this.maxSelect,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isRequired.present) {
      map['is_required'] = Variable<bool>(isRequired.value);
    }
    if (minSelect.present) {
      map['min_select'] = Variable<int>(minSelect.value);
    }
    if (maxSelect.present) {
      map['max_select'] = Variable<int>(maxSelect.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModifierGroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isRequired: $isRequired, ')
          ..write('minSelect: $minSelect, ')
          ..write('maxSelect: $maxSelect')
          ..write(')'))
        .toString();
  }
}

class $ModifierOptionsTable extends ModifierOptions
    with TableInfo<$ModifierOptionsTable, ModifierOptionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModifierOptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES modifier_groups (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceAdjustmentMeta =
      const VerificationMeta('priceAdjustment');
  @override
  late final GeneratedColumn<int> priceAdjustment = GeneratedColumn<int>(
      'price_adjustment', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, groupId, name, priceAdjustment];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'modifier_options';
  @override
  VerificationContext validateIntegrity(Insertable<ModifierOptionRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price_adjustment')) {
      context.handle(
          _priceAdjustmentMeta,
          priceAdjustment.isAcceptableOrUnknown(
              data['price_adjustment']!, _priceAdjustmentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ModifierOptionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModifierOptionRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      priceAdjustment: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price_adjustment'])!,
    );
  }

  @override
  $ModifierOptionsTable createAlias(String alias) {
    return $ModifierOptionsTable(attachedDatabase, alias);
  }
}

class ModifierOptionRow extends DataClass
    implements Insertable<ModifierOptionRow> {
  final int id;
  final int groupId;
  final String name;
  final int priceAdjustment;
  const ModifierOptionRow(
      {required this.id,
      required this.groupId,
      required this.name,
      required this.priceAdjustment});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['group_id'] = Variable<int>(groupId);
    map['name'] = Variable<String>(name);
    map['price_adjustment'] = Variable<int>(priceAdjustment);
    return map;
  }

  ModifierOptionsCompanion toCompanion(bool nullToAbsent) {
    return ModifierOptionsCompanion(
      id: Value(id),
      groupId: Value(groupId),
      name: Value(name),
      priceAdjustment: Value(priceAdjustment),
    );
  }

  factory ModifierOptionRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModifierOptionRow(
      id: serializer.fromJson<int>(json['id']),
      groupId: serializer.fromJson<int>(json['groupId']),
      name: serializer.fromJson<String>(json['name']),
      priceAdjustment: serializer.fromJson<int>(json['priceAdjustment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'groupId': serializer.toJson<int>(groupId),
      'name': serializer.toJson<String>(name),
      'priceAdjustment': serializer.toJson<int>(priceAdjustment),
    };
  }

  ModifierOptionRow copyWith(
          {int? id, int? groupId, String? name, int? priceAdjustment}) =>
      ModifierOptionRow(
        id: id ?? this.id,
        groupId: groupId ?? this.groupId,
        name: name ?? this.name,
        priceAdjustment: priceAdjustment ?? this.priceAdjustment,
      );
  ModifierOptionRow copyWithCompanion(ModifierOptionsCompanion data) {
    return ModifierOptionRow(
      id: data.id.present ? data.id.value : this.id,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      name: data.name.present ? data.name.value : this.name,
      priceAdjustment: data.priceAdjustment.present
          ? data.priceAdjustment.value
          : this.priceAdjustment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModifierOptionRow(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('name: $name, ')
          ..write('priceAdjustment: $priceAdjustment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, groupId, name, priceAdjustment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModifierOptionRow &&
          other.id == this.id &&
          other.groupId == this.groupId &&
          other.name == this.name &&
          other.priceAdjustment == this.priceAdjustment);
}

class ModifierOptionsCompanion extends UpdateCompanion<ModifierOptionRow> {
  final Value<int> id;
  final Value<int> groupId;
  final Value<String> name;
  final Value<int> priceAdjustment;
  const ModifierOptionsCompanion({
    this.id = const Value.absent(),
    this.groupId = const Value.absent(),
    this.name = const Value.absent(),
    this.priceAdjustment = const Value.absent(),
  });
  ModifierOptionsCompanion.insert({
    this.id = const Value.absent(),
    required int groupId,
    required String name,
    this.priceAdjustment = const Value.absent(),
  })  : groupId = Value(groupId),
        name = Value(name);
  static Insertable<ModifierOptionRow> custom({
    Expression<int>? id,
    Expression<int>? groupId,
    Expression<String>? name,
    Expression<int>? priceAdjustment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupId != null) 'group_id': groupId,
      if (name != null) 'name': name,
      if (priceAdjustment != null) 'price_adjustment': priceAdjustment,
    });
  }

  ModifierOptionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? groupId,
      Value<String>? name,
      Value<int>? priceAdjustment}) {
    return ModifierOptionsCompanion(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
      priceAdjustment: priceAdjustment ?? this.priceAdjustment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (priceAdjustment.present) {
      map['price_adjustment'] = Variable<int>(priceAdjustment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModifierOptionsCompanion(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('name: $name, ')
          ..write('priceAdjustment: $priceAdjustment')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, OrderRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderNumberMeta =
      const VerificationMeta('orderNumber');
  @override
  late final GeneratedColumn<String> orderNumber = GeneratedColumn<String>(
      'order_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderTypeMeta =
      const VerificationMeta('orderType');
  @override
  late final GeneratedColumn<String> orderType = GeneratedColumn<String>(
      'order_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tableLabelMeta =
      const VerificationMeta('tableLabel');
  @override
  late final GeneratedColumn<String> tableLabel = GeneratedColumn<String>(
      'table_label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cashierNameMeta =
      const VerificationMeta('cashierName');
  @override
  late final GeneratedColumn<String> cashierName = GeneratedColumn<String>(
      'cashier_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shiftNameMeta =
      const VerificationMeta('shiftName');
  @override
  late final GeneratedColumn<String> shiftName = GeneratedColumn<String>(
      'shift_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subtotalRupiahMeta =
      const VerificationMeta('subtotalRupiah');
  @override
  late final GeneratedColumn<int> subtotalRupiah = GeneratedColumn<int>(
      'subtotal_rupiah', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _taxPb1RupiahMeta =
      const VerificationMeta('taxPb1Rupiah');
  @override
  late final GeneratedColumn<int> taxPb1Rupiah = GeneratedColumn<int>(
      'tax_pb1_rupiah', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _serviceChargeRupiahMeta =
      const VerificationMeta('serviceChargeRupiah');
  @override
  late final GeneratedColumn<int> serviceChargeRupiah = GeneratedColumn<int>(
      'service_charge_rupiah', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalRupiahMeta =
      const VerificationMeta('totalRupiah');
  @override
  late final GeneratedColumn<int> totalRupiah = GeneratedColumn<int>(
      'total_rupiah', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('COMPLETED'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        orderNumber,
        orderType,
        tableLabel,
        cashierName,
        shiftName,
        subtotalRupiah,
        taxPb1Rupiah,
        serviceChargeRupiah,
        totalRupiah,
        status,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<OrderRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_number')) {
      context.handle(
          _orderNumberMeta,
          orderNumber.isAcceptableOrUnknown(
              data['order_number']!, _orderNumberMeta));
    } else if (isInserting) {
      context.missing(_orderNumberMeta);
    }
    if (data.containsKey('order_type')) {
      context.handle(_orderTypeMeta,
          orderType.isAcceptableOrUnknown(data['order_type']!, _orderTypeMeta));
    } else if (isInserting) {
      context.missing(_orderTypeMeta);
    }
    if (data.containsKey('table_label')) {
      context.handle(
          _tableLabelMeta,
          tableLabel.isAcceptableOrUnknown(
              data['table_label']!, _tableLabelMeta));
    } else if (isInserting) {
      context.missing(_tableLabelMeta);
    }
    if (data.containsKey('cashier_name')) {
      context.handle(
          _cashierNameMeta,
          cashierName.isAcceptableOrUnknown(
              data['cashier_name']!, _cashierNameMeta));
    } else if (isInserting) {
      context.missing(_cashierNameMeta);
    }
    if (data.containsKey('shift_name')) {
      context.handle(_shiftNameMeta,
          shiftName.isAcceptableOrUnknown(data['shift_name']!, _shiftNameMeta));
    } else if (isInserting) {
      context.missing(_shiftNameMeta);
    }
    if (data.containsKey('subtotal_rupiah')) {
      context.handle(
          _subtotalRupiahMeta,
          subtotalRupiah.isAcceptableOrUnknown(
              data['subtotal_rupiah']!, _subtotalRupiahMeta));
    } else if (isInserting) {
      context.missing(_subtotalRupiahMeta);
    }
    if (data.containsKey('tax_pb1_rupiah')) {
      context.handle(
          _taxPb1RupiahMeta,
          taxPb1Rupiah.isAcceptableOrUnknown(
              data['tax_pb1_rupiah']!, _taxPb1RupiahMeta));
    } else if (isInserting) {
      context.missing(_taxPb1RupiahMeta);
    }
    if (data.containsKey('service_charge_rupiah')) {
      context.handle(
          _serviceChargeRupiahMeta,
          serviceChargeRupiah.isAcceptableOrUnknown(
              data['service_charge_rupiah']!, _serviceChargeRupiahMeta));
    } else if (isInserting) {
      context.missing(_serviceChargeRupiahMeta);
    }
    if (data.containsKey('total_rupiah')) {
      context.handle(
          _totalRupiahMeta,
          totalRupiah.isAcceptableOrUnknown(
              data['total_rupiah']!, _totalRupiahMeta));
    } else if (isInserting) {
      context.missing(_totalRupiahMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      orderNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_number'])!,
      orderType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_type'])!,
      tableLabel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}table_label'])!,
      cashierName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cashier_name'])!,
      shiftName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shift_name'])!,
      subtotalRupiah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subtotal_rupiah'])!,
      taxPb1Rupiah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tax_pb1_rupiah'])!,
      serviceChargeRupiah: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}service_charge_rupiah'])!,
      totalRupiah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_rupiah'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class OrderRow extends DataClass implements Insertable<OrderRow> {
  final int id;
  final String orderNumber;
  final String orderType;
  final String tableLabel;
  final String cashierName;
  final String shiftName;
  final int subtotalRupiah;
  final int taxPb1Rupiah;
  final int serviceChargeRupiah;
  final int totalRupiah;
  final String status;
  final DateTime createdAt;
  const OrderRow(
      {required this.id,
      required this.orderNumber,
      required this.orderType,
      required this.tableLabel,
      required this.cashierName,
      required this.shiftName,
      required this.subtotalRupiah,
      required this.taxPb1Rupiah,
      required this.serviceChargeRupiah,
      required this.totalRupiah,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_number'] = Variable<String>(orderNumber);
    map['order_type'] = Variable<String>(orderType);
    map['table_label'] = Variable<String>(tableLabel);
    map['cashier_name'] = Variable<String>(cashierName);
    map['shift_name'] = Variable<String>(shiftName);
    map['subtotal_rupiah'] = Variable<int>(subtotalRupiah);
    map['tax_pb1_rupiah'] = Variable<int>(taxPb1Rupiah);
    map['service_charge_rupiah'] = Variable<int>(serviceChargeRupiah);
    map['total_rupiah'] = Variable<int>(totalRupiah);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      orderNumber: Value(orderNumber),
      orderType: Value(orderType),
      tableLabel: Value(tableLabel),
      cashierName: Value(cashierName),
      shiftName: Value(shiftName),
      subtotalRupiah: Value(subtotalRupiah),
      taxPb1Rupiah: Value(taxPb1Rupiah),
      serviceChargeRupiah: Value(serviceChargeRupiah),
      totalRupiah: Value(totalRupiah),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory OrderRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderRow(
      id: serializer.fromJson<int>(json['id']),
      orderNumber: serializer.fromJson<String>(json['orderNumber']),
      orderType: serializer.fromJson<String>(json['orderType']),
      tableLabel: serializer.fromJson<String>(json['tableLabel']),
      cashierName: serializer.fromJson<String>(json['cashierName']),
      shiftName: serializer.fromJson<String>(json['shiftName']),
      subtotalRupiah: serializer.fromJson<int>(json['subtotalRupiah']),
      taxPb1Rupiah: serializer.fromJson<int>(json['taxPb1Rupiah']),
      serviceChargeRupiah:
          serializer.fromJson<int>(json['serviceChargeRupiah']),
      totalRupiah: serializer.fromJson<int>(json['totalRupiah']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderNumber': serializer.toJson<String>(orderNumber),
      'orderType': serializer.toJson<String>(orderType),
      'tableLabel': serializer.toJson<String>(tableLabel),
      'cashierName': serializer.toJson<String>(cashierName),
      'shiftName': serializer.toJson<String>(shiftName),
      'subtotalRupiah': serializer.toJson<int>(subtotalRupiah),
      'taxPb1Rupiah': serializer.toJson<int>(taxPb1Rupiah),
      'serviceChargeRupiah': serializer.toJson<int>(serviceChargeRupiah),
      'totalRupiah': serializer.toJson<int>(totalRupiah),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  OrderRow copyWith(
          {int? id,
          String? orderNumber,
          String? orderType,
          String? tableLabel,
          String? cashierName,
          String? shiftName,
          int? subtotalRupiah,
          int? taxPb1Rupiah,
          int? serviceChargeRupiah,
          int? totalRupiah,
          String? status,
          DateTime? createdAt}) =>
      OrderRow(
        id: id ?? this.id,
        orderNumber: orderNumber ?? this.orderNumber,
        orderType: orderType ?? this.orderType,
        tableLabel: tableLabel ?? this.tableLabel,
        cashierName: cashierName ?? this.cashierName,
        shiftName: shiftName ?? this.shiftName,
        subtotalRupiah: subtotalRupiah ?? this.subtotalRupiah,
        taxPb1Rupiah: taxPb1Rupiah ?? this.taxPb1Rupiah,
        serviceChargeRupiah: serviceChargeRupiah ?? this.serviceChargeRupiah,
        totalRupiah: totalRupiah ?? this.totalRupiah,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  OrderRow copyWithCompanion(OrdersCompanion data) {
    return OrderRow(
      id: data.id.present ? data.id.value : this.id,
      orderNumber:
          data.orderNumber.present ? data.orderNumber.value : this.orderNumber,
      orderType: data.orderType.present ? data.orderType.value : this.orderType,
      tableLabel:
          data.tableLabel.present ? data.tableLabel.value : this.tableLabel,
      cashierName:
          data.cashierName.present ? data.cashierName.value : this.cashierName,
      shiftName: data.shiftName.present ? data.shiftName.value : this.shiftName,
      subtotalRupiah: data.subtotalRupiah.present
          ? data.subtotalRupiah.value
          : this.subtotalRupiah,
      taxPb1Rupiah: data.taxPb1Rupiah.present
          ? data.taxPb1Rupiah.value
          : this.taxPb1Rupiah,
      serviceChargeRupiah: data.serviceChargeRupiah.present
          ? data.serviceChargeRupiah.value
          : this.serviceChargeRupiah,
      totalRupiah:
          data.totalRupiah.present ? data.totalRupiah.value : this.totalRupiah,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderRow(')
          ..write('id: $id, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('orderType: $orderType, ')
          ..write('tableLabel: $tableLabel, ')
          ..write('cashierName: $cashierName, ')
          ..write('shiftName: $shiftName, ')
          ..write('subtotalRupiah: $subtotalRupiah, ')
          ..write('taxPb1Rupiah: $taxPb1Rupiah, ')
          ..write('serviceChargeRupiah: $serviceChargeRupiah, ')
          ..write('totalRupiah: $totalRupiah, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      orderNumber,
      orderType,
      tableLabel,
      cashierName,
      shiftName,
      subtotalRupiah,
      taxPb1Rupiah,
      serviceChargeRupiah,
      totalRupiah,
      status,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderRow &&
          other.id == this.id &&
          other.orderNumber == this.orderNumber &&
          other.orderType == this.orderType &&
          other.tableLabel == this.tableLabel &&
          other.cashierName == this.cashierName &&
          other.shiftName == this.shiftName &&
          other.subtotalRupiah == this.subtotalRupiah &&
          other.taxPb1Rupiah == this.taxPb1Rupiah &&
          other.serviceChargeRupiah == this.serviceChargeRupiah &&
          other.totalRupiah == this.totalRupiah &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class OrdersCompanion extends UpdateCompanion<OrderRow> {
  final Value<int> id;
  final Value<String> orderNumber;
  final Value<String> orderType;
  final Value<String> tableLabel;
  final Value<String> cashierName;
  final Value<String> shiftName;
  final Value<int> subtotalRupiah;
  final Value<int> taxPb1Rupiah;
  final Value<int> serviceChargeRupiah;
  final Value<int> totalRupiah;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.orderNumber = const Value.absent(),
    this.orderType = const Value.absent(),
    this.tableLabel = const Value.absent(),
    this.cashierName = const Value.absent(),
    this.shiftName = const Value.absent(),
    this.subtotalRupiah = const Value.absent(),
    this.taxPb1Rupiah = const Value.absent(),
    this.serviceChargeRupiah = const Value.absent(),
    this.totalRupiah = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required String orderNumber,
    required String orderType,
    required String tableLabel,
    required String cashierName,
    required String shiftName,
    required int subtotalRupiah,
    required int taxPb1Rupiah,
    required int serviceChargeRupiah,
    required int totalRupiah,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : orderNumber = Value(orderNumber),
        orderType = Value(orderType),
        tableLabel = Value(tableLabel),
        cashierName = Value(cashierName),
        shiftName = Value(shiftName),
        subtotalRupiah = Value(subtotalRupiah),
        taxPb1Rupiah = Value(taxPb1Rupiah),
        serviceChargeRupiah = Value(serviceChargeRupiah),
        totalRupiah = Value(totalRupiah);
  static Insertable<OrderRow> custom({
    Expression<int>? id,
    Expression<String>? orderNumber,
    Expression<String>? orderType,
    Expression<String>? tableLabel,
    Expression<String>? cashierName,
    Expression<String>? shiftName,
    Expression<int>? subtotalRupiah,
    Expression<int>? taxPb1Rupiah,
    Expression<int>? serviceChargeRupiah,
    Expression<int>? totalRupiah,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderNumber != null) 'order_number': orderNumber,
      if (orderType != null) 'order_type': orderType,
      if (tableLabel != null) 'table_label': tableLabel,
      if (cashierName != null) 'cashier_name': cashierName,
      if (shiftName != null) 'shift_name': shiftName,
      if (subtotalRupiah != null) 'subtotal_rupiah': subtotalRupiah,
      if (taxPb1Rupiah != null) 'tax_pb1_rupiah': taxPb1Rupiah,
      if (serviceChargeRupiah != null)
        'service_charge_rupiah': serviceChargeRupiah,
      if (totalRupiah != null) 'total_rupiah': totalRupiah,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OrdersCompanion copyWith(
      {Value<int>? id,
      Value<String>? orderNumber,
      Value<String>? orderType,
      Value<String>? tableLabel,
      Value<String>? cashierName,
      Value<String>? shiftName,
      Value<int>? subtotalRupiah,
      Value<int>? taxPb1Rupiah,
      Value<int>? serviceChargeRupiah,
      Value<int>? totalRupiah,
      Value<String>? status,
      Value<DateTime>? createdAt}) {
    return OrdersCompanion(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      orderType: orderType ?? this.orderType,
      tableLabel: tableLabel ?? this.tableLabel,
      cashierName: cashierName ?? this.cashierName,
      shiftName: shiftName ?? this.shiftName,
      subtotalRupiah: subtotalRupiah ?? this.subtotalRupiah,
      taxPb1Rupiah: taxPb1Rupiah ?? this.taxPb1Rupiah,
      serviceChargeRupiah: serviceChargeRupiah ?? this.serviceChargeRupiah,
      totalRupiah: totalRupiah ?? this.totalRupiah,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderNumber.present) {
      map['order_number'] = Variable<String>(orderNumber.value);
    }
    if (orderType.present) {
      map['order_type'] = Variable<String>(orderType.value);
    }
    if (tableLabel.present) {
      map['table_label'] = Variable<String>(tableLabel.value);
    }
    if (cashierName.present) {
      map['cashier_name'] = Variable<String>(cashierName.value);
    }
    if (shiftName.present) {
      map['shift_name'] = Variable<String>(shiftName.value);
    }
    if (subtotalRupiah.present) {
      map['subtotal_rupiah'] = Variable<int>(subtotalRupiah.value);
    }
    if (taxPb1Rupiah.present) {
      map['tax_pb1_rupiah'] = Variable<int>(taxPb1Rupiah.value);
    }
    if (serviceChargeRupiah.present) {
      map['service_charge_rupiah'] = Variable<int>(serviceChargeRupiah.value);
    }
    if (totalRupiah.present) {
      map['total_rupiah'] = Variable<int>(totalRupiah.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('orderType: $orderType, ')
          ..write('tableLabel: $tableLabel, ')
          ..write('cashierName: $cashierName, ')
          ..write('shiftName: $shiftName, ')
          ..write('subtotalRupiah: $subtotalRupiah, ')
          ..write('taxPb1Rupiah: $taxPb1Rupiah, ')
          ..write('serviceChargeRupiah: $serviceChargeRupiah, ')
          ..write('totalRupiah: $totalRupiah, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $OrderItemsTable extends OrderItems
    with TableInfo<$OrderItemsTable, OrderItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES orders (id)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _variantNameMeta =
      const VerificationMeta('variantName');
  @override
  late final GeneratedColumn<String> variantName = GeneratedColumn<String>(
      'variant_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Standard'));
  static const VerificationMeta _unitPriceRupiahMeta =
      const VerificationMeta('unitPriceRupiah');
  @override
  late final GeneratedColumn<int> unitPriceRupiah = GeneratedColumn<int>(
      'unit_price_rupiah', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lineTotalRupiahMeta =
      const VerificationMeta('lineTotalRupiah');
  @override
  late final GeneratedColumn<int> lineTotalRupiah = GeneratedColumn<int>(
      'line_total_rupiah', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        orderId,
        productId,
        productName,
        variantName,
        unitPriceRupiah,
        quantity,
        lineTotalRupiah,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_items';
  @override
  VerificationContext validateIntegrity(Insertable<OrderItemRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('variant_name')) {
      context.handle(
          _variantNameMeta,
          variantName.isAcceptableOrUnknown(
              data['variant_name']!, _variantNameMeta));
    }
    if (data.containsKey('unit_price_rupiah')) {
      context.handle(
          _unitPriceRupiahMeta,
          unitPriceRupiah.isAcceptableOrUnknown(
              data['unit_price_rupiah']!, _unitPriceRupiahMeta));
    } else if (isInserting) {
      context.missing(_unitPriceRupiahMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('line_total_rupiah')) {
      context.handle(
          _lineTotalRupiahMeta,
          lineTotalRupiah.isAcceptableOrUnknown(
              data['line_total_rupiah']!, _lineTotalRupiahMeta));
    } else if (isInserting) {
      context.missing(_lineTotalRupiahMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      variantName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}variant_name'])!,
      unitPriceRupiah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_price_rupiah'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      lineTotalRupiah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}line_total_rupiah'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $OrderItemsTable createAlias(String alias) {
    return $OrderItemsTable(attachedDatabase, alias);
  }
}

class OrderItemRow extends DataClass implements Insertable<OrderItemRow> {
  final int id;
  final int orderId;
  final int productId;
  final String productName;
  final String variantName;
  final int unitPriceRupiah;
  final int quantity;
  final int lineTotalRupiah;
  final String? notes;
  const OrderItemRow(
      {required this.id,
      required this.orderId,
      required this.productId,
      required this.productName,
      required this.variantName,
      required this.unitPriceRupiah,
      required this.quantity,
      required this.lineTotalRupiah,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['product_id'] = Variable<int>(productId);
    map['product_name'] = Variable<String>(productName);
    map['variant_name'] = Variable<String>(variantName);
    map['unit_price_rupiah'] = Variable<int>(unitPriceRupiah);
    map['quantity'] = Variable<int>(quantity);
    map['line_total_rupiah'] = Variable<int>(lineTotalRupiah);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  OrderItemsCompanion toCompanion(bool nullToAbsent) {
    return OrderItemsCompanion(
      id: Value(id),
      orderId: Value(orderId),
      productId: Value(productId),
      productName: Value(productName),
      variantName: Value(variantName),
      unitPriceRupiah: Value(unitPriceRupiah),
      quantity: Value(quantity),
      lineTotalRupiah: Value(lineTotalRupiah),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory OrderItemRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemRow(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      productId: serializer.fromJson<int>(json['productId']),
      productName: serializer.fromJson<String>(json['productName']),
      variantName: serializer.fromJson<String>(json['variantName']),
      unitPriceRupiah: serializer.fromJson<int>(json['unitPriceRupiah']),
      quantity: serializer.fromJson<int>(json['quantity']),
      lineTotalRupiah: serializer.fromJson<int>(json['lineTotalRupiah']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'productId': serializer.toJson<int>(productId),
      'productName': serializer.toJson<String>(productName),
      'variantName': serializer.toJson<String>(variantName),
      'unitPriceRupiah': serializer.toJson<int>(unitPriceRupiah),
      'quantity': serializer.toJson<int>(quantity),
      'lineTotalRupiah': serializer.toJson<int>(lineTotalRupiah),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  OrderItemRow copyWith(
          {int? id,
          int? orderId,
          int? productId,
          String? productName,
          String? variantName,
          int? unitPriceRupiah,
          int? quantity,
          int? lineTotalRupiah,
          Value<String?> notes = const Value.absent()}) =>
      OrderItemRow(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        variantName: variantName ?? this.variantName,
        unitPriceRupiah: unitPriceRupiah ?? this.unitPriceRupiah,
        quantity: quantity ?? this.quantity,
        lineTotalRupiah: lineTotalRupiah ?? this.lineTotalRupiah,
        notes: notes.present ? notes.value : this.notes,
      );
  OrderItemRow copyWithCompanion(OrderItemsCompanion data) {
    return OrderItemRow(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      variantName:
          data.variantName.present ? data.variantName.value : this.variantName,
      unitPriceRupiah: data.unitPriceRupiah.present
          ? data.unitPriceRupiah.value
          : this.unitPriceRupiah,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      lineTotalRupiah: data.lineTotalRupiah.present
          ? data.lineTotalRupiah.value
          : this.lineTotalRupiah,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemRow(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('variantName: $variantName, ')
          ..write('unitPriceRupiah: $unitPriceRupiah, ')
          ..write('quantity: $quantity, ')
          ..write('lineTotalRupiah: $lineTotalRupiah, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, orderId, productId, productName,
      variantName, unitPriceRupiah, quantity, lineTotalRupiah, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemRow &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.productId == this.productId &&
          other.productName == this.productName &&
          other.variantName == this.variantName &&
          other.unitPriceRupiah == this.unitPriceRupiah &&
          other.quantity == this.quantity &&
          other.lineTotalRupiah == this.lineTotalRupiah &&
          other.notes == this.notes);
}

class OrderItemsCompanion extends UpdateCompanion<OrderItemRow> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<int> productId;
  final Value<String> productName;
  final Value<String> variantName;
  final Value<int> unitPriceRupiah;
  final Value<int> quantity;
  final Value<int> lineTotalRupiah;
  final Value<String?> notes;
  const OrderItemsCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productName = const Value.absent(),
    this.variantName = const Value.absent(),
    this.unitPriceRupiah = const Value.absent(),
    this.quantity = const Value.absent(),
    this.lineTotalRupiah = const Value.absent(),
    this.notes = const Value.absent(),
  });
  OrderItemsCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required int productId,
    required String productName,
    this.variantName = const Value.absent(),
    required int unitPriceRupiah,
    required int quantity,
    required int lineTotalRupiah,
    this.notes = const Value.absent(),
  })  : orderId = Value(orderId),
        productId = Value(productId),
        productName = Value(productName),
        unitPriceRupiah = Value(unitPriceRupiah),
        quantity = Value(quantity),
        lineTotalRupiah = Value(lineTotalRupiah);
  static Insertable<OrderItemRow> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<int>? productId,
    Expression<String>? productName,
    Expression<String>? variantName,
    Expression<int>? unitPriceRupiah,
    Expression<int>? quantity,
    Expression<int>? lineTotalRupiah,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (productId != null) 'product_id': productId,
      if (productName != null) 'product_name': productName,
      if (variantName != null) 'variant_name': variantName,
      if (unitPriceRupiah != null) 'unit_price_rupiah': unitPriceRupiah,
      if (quantity != null) 'quantity': quantity,
      if (lineTotalRupiah != null) 'line_total_rupiah': lineTotalRupiah,
      if (notes != null) 'notes': notes,
    });
  }

  OrderItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? orderId,
      Value<int>? productId,
      Value<String>? productName,
      Value<String>? variantName,
      Value<int>? unitPriceRupiah,
      Value<int>? quantity,
      Value<int>? lineTotalRupiah,
      Value<String?>? notes}) {
    return OrderItemsCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      variantName: variantName ?? this.variantName,
      unitPriceRupiah: unitPriceRupiah ?? this.unitPriceRupiah,
      quantity: quantity ?? this.quantity,
      lineTotalRupiah: lineTotalRupiah ?? this.lineTotalRupiah,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (variantName.present) {
      map['variant_name'] = Variable<String>(variantName.value);
    }
    if (unitPriceRupiah.present) {
      map['unit_price_rupiah'] = Variable<int>(unitPriceRupiah.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (lineTotalRupiah.present) {
      map['line_total_rupiah'] = Variable<int>(lineTotalRupiah.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemsCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('variantName: $variantName, ')
          ..write('unitPriceRupiah: $unitPriceRupiah, ')
          ..write('quantity: $quantity, ')
          ..write('lineTotalRupiah: $lineTotalRupiah, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $OrderItemModifiersTable extends OrderItemModifiers
    with TableInfo<$OrderItemModifiersTable, OrderItemModifierRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemModifiersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderItemIdMeta =
      const VerificationMeta('orderItemId');
  @override
  late final GeneratedColumn<int> orderItemId = GeneratedColumn<int>(
      'order_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES order_items (id)'));
  static const VerificationMeta _modifierNameMeta =
      const VerificationMeta('modifierName');
  @override
  late final GeneratedColumn<String> modifierName = GeneratedColumn<String>(
      'modifier_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceAdjustmentRupiahMeta =
      const VerificationMeta('priceAdjustmentRupiah');
  @override
  late final GeneratedColumn<int> priceAdjustmentRupiah = GeneratedColumn<int>(
      'price_adjustment_rupiah', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, orderItemId, modifierName, priceAdjustmentRupiah];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_item_modifiers';
  @override
  VerificationContext validateIntegrity(
      Insertable<OrderItemModifierRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_item_id')) {
      context.handle(
          _orderItemIdMeta,
          orderItemId.isAcceptableOrUnknown(
              data['order_item_id']!, _orderItemIdMeta));
    } else if (isInserting) {
      context.missing(_orderItemIdMeta);
    }
    if (data.containsKey('modifier_name')) {
      context.handle(
          _modifierNameMeta,
          modifierName.isAcceptableOrUnknown(
              data['modifier_name']!, _modifierNameMeta));
    } else if (isInserting) {
      context.missing(_modifierNameMeta);
    }
    if (data.containsKey('price_adjustment_rupiah')) {
      context.handle(
          _priceAdjustmentRupiahMeta,
          priceAdjustmentRupiah.isAcceptableOrUnknown(
              data['price_adjustment_rupiah']!, _priceAdjustmentRupiahMeta));
    } else if (isInserting) {
      context.missing(_priceAdjustmentRupiahMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItemModifierRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemModifierRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      orderItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_item_id'])!,
      modifierName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modifier_name'])!,
      priceAdjustmentRupiah: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}price_adjustment_rupiah'])!,
    );
  }

  @override
  $OrderItemModifiersTable createAlias(String alias) {
    return $OrderItemModifiersTable(attachedDatabase, alias);
  }
}

class OrderItemModifierRow extends DataClass
    implements Insertable<OrderItemModifierRow> {
  final int id;
  final int orderItemId;
  final String modifierName;
  final int priceAdjustmentRupiah;
  const OrderItemModifierRow(
      {required this.id,
      required this.orderItemId,
      required this.modifierName,
      required this.priceAdjustmentRupiah});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_item_id'] = Variable<int>(orderItemId);
    map['modifier_name'] = Variable<String>(modifierName);
    map['price_adjustment_rupiah'] = Variable<int>(priceAdjustmentRupiah);
    return map;
  }

  OrderItemModifiersCompanion toCompanion(bool nullToAbsent) {
    return OrderItemModifiersCompanion(
      id: Value(id),
      orderItemId: Value(orderItemId),
      modifierName: Value(modifierName),
      priceAdjustmentRupiah: Value(priceAdjustmentRupiah),
    );
  }

  factory OrderItemModifierRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemModifierRow(
      id: serializer.fromJson<int>(json['id']),
      orderItemId: serializer.fromJson<int>(json['orderItemId']),
      modifierName: serializer.fromJson<String>(json['modifierName']),
      priceAdjustmentRupiah:
          serializer.fromJson<int>(json['priceAdjustmentRupiah']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderItemId': serializer.toJson<int>(orderItemId),
      'modifierName': serializer.toJson<String>(modifierName),
      'priceAdjustmentRupiah': serializer.toJson<int>(priceAdjustmentRupiah),
    };
  }

  OrderItemModifierRow copyWith(
          {int? id,
          int? orderItemId,
          String? modifierName,
          int? priceAdjustmentRupiah}) =>
      OrderItemModifierRow(
        id: id ?? this.id,
        orderItemId: orderItemId ?? this.orderItemId,
        modifierName: modifierName ?? this.modifierName,
        priceAdjustmentRupiah:
            priceAdjustmentRupiah ?? this.priceAdjustmentRupiah,
      );
  OrderItemModifierRow copyWithCompanion(OrderItemModifiersCompanion data) {
    return OrderItemModifierRow(
      id: data.id.present ? data.id.value : this.id,
      orderItemId:
          data.orderItemId.present ? data.orderItemId.value : this.orderItemId,
      modifierName: data.modifierName.present
          ? data.modifierName.value
          : this.modifierName,
      priceAdjustmentRupiah: data.priceAdjustmentRupiah.present
          ? data.priceAdjustmentRupiah.value
          : this.priceAdjustmentRupiah,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemModifierRow(')
          ..write('id: $id, ')
          ..write('orderItemId: $orderItemId, ')
          ..write('modifierName: $modifierName, ')
          ..write('priceAdjustmentRupiah: $priceAdjustmentRupiah')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, orderItemId, modifierName, priceAdjustmentRupiah);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemModifierRow &&
          other.id == this.id &&
          other.orderItemId == this.orderItemId &&
          other.modifierName == this.modifierName &&
          other.priceAdjustmentRupiah == this.priceAdjustmentRupiah);
}

class OrderItemModifiersCompanion
    extends UpdateCompanion<OrderItemModifierRow> {
  final Value<int> id;
  final Value<int> orderItemId;
  final Value<String> modifierName;
  final Value<int> priceAdjustmentRupiah;
  const OrderItemModifiersCompanion({
    this.id = const Value.absent(),
    this.orderItemId = const Value.absent(),
    this.modifierName = const Value.absent(),
    this.priceAdjustmentRupiah = const Value.absent(),
  });
  OrderItemModifiersCompanion.insert({
    this.id = const Value.absent(),
    required int orderItemId,
    required String modifierName,
    required int priceAdjustmentRupiah,
  })  : orderItemId = Value(orderItemId),
        modifierName = Value(modifierName),
        priceAdjustmentRupiah = Value(priceAdjustmentRupiah);
  static Insertable<OrderItemModifierRow> custom({
    Expression<int>? id,
    Expression<int>? orderItemId,
    Expression<String>? modifierName,
    Expression<int>? priceAdjustmentRupiah,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderItemId != null) 'order_item_id': orderItemId,
      if (modifierName != null) 'modifier_name': modifierName,
      if (priceAdjustmentRupiah != null)
        'price_adjustment_rupiah': priceAdjustmentRupiah,
    });
  }

  OrderItemModifiersCompanion copyWith(
      {Value<int>? id,
      Value<int>? orderItemId,
      Value<String>? modifierName,
      Value<int>? priceAdjustmentRupiah}) {
    return OrderItemModifiersCompanion(
      id: id ?? this.id,
      orderItemId: orderItemId ?? this.orderItemId,
      modifierName: modifierName ?? this.modifierName,
      priceAdjustmentRupiah:
          priceAdjustmentRupiah ?? this.priceAdjustmentRupiah,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderItemId.present) {
      map['order_item_id'] = Variable<int>(orderItemId.value);
    }
    if (modifierName.present) {
      map['modifier_name'] = Variable<String>(modifierName.value);
    }
    if (priceAdjustmentRupiah.present) {
      map['price_adjustment_rupiah'] =
          Variable<int>(priceAdjustmentRupiah.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemModifiersCompanion(')
          ..write('id: $id, ')
          ..write('orderItemId: $orderItemId, ')
          ..write('modifierName: $modifierName, ')
          ..write('priceAdjustmentRupiah: $priceAdjustmentRupiah')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments
    with TableInfo<$PaymentsTable, PaymentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES orders (id)'));
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountPaidRupiahMeta =
      const VerificationMeta('amountPaidRupiah');
  @override
  late final GeneratedColumn<int> amountPaidRupiah = GeneratedColumn<int>(
      'amount_paid_rupiah', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _changeDueRupiahMeta =
      const VerificationMeta('changeDueRupiah');
  @override
  late final GeneratedColumn<int> changeDueRupiah = GeneratedColumn<int>(
      'change_due_rupiah', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _referenceCodeMeta =
      const VerificationMeta('referenceCode');
  @override
  late final GeneratedColumn<String> referenceCode = GeneratedColumn<String>(
      'reference_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('SUCCESS'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        orderId,
        paymentMethod,
        amountPaidRupiah,
        changeDueRupiah,
        referenceCode,
        status,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(Insertable<PaymentRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('amount_paid_rupiah')) {
      context.handle(
          _amountPaidRupiahMeta,
          amountPaidRupiah.isAcceptableOrUnknown(
              data['amount_paid_rupiah']!, _amountPaidRupiahMeta));
    } else if (isInserting) {
      context.missing(_amountPaidRupiahMeta);
    }
    if (data.containsKey('change_due_rupiah')) {
      context.handle(
          _changeDueRupiahMeta,
          changeDueRupiah.isAcceptableOrUnknown(
              data['change_due_rupiah']!, _changeDueRupiahMeta));
    }
    if (data.containsKey('reference_code')) {
      context.handle(
          _referenceCodeMeta,
          referenceCode.isAcceptableOrUnknown(
              data['reference_code']!, _referenceCodeMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      amountPaidRupiah: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}amount_paid_rupiah'])!,
      changeDueRupiah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}change_due_rupiah'])!,
      referenceCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference_code']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class PaymentRow extends DataClass implements Insertable<PaymentRow> {
  final int id;
  final int orderId;
  final String paymentMethod;
  final int amountPaidRupiah;
  final int changeDueRupiah;
  final String? referenceCode;
  final String status;
  final DateTime createdAt;
  const PaymentRow(
      {required this.id,
      required this.orderId,
      required this.paymentMethod,
      required this.amountPaidRupiah,
      required this.changeDueRupiah,
      this.referenceCode,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['amount_paid_rupiah'] = Variable<int>(amountPaidRupiah);
    map['change_due_rupiah'] = Variable<int>(changeDueRupiah);
    if (!nullToAbsent || referenceCode != null) {
      map['reference_code'] = Variable<String>(referenceCode);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      orderId: Value(orderId),
      paymentMethod: Value(paymentMethod),
      amountPaidRupiah: Value(amountPaidRupiah),
      changeDueRupiah: Value(changeDueRupiah),
      referenceCode: referenceCode == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceCode),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory PaymentRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentRow(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      amountPaidRupiah: serializer.fromJson<int>(json['amountPaidRupiah']),
      changeDueRupiah: serializer.fromJson<int>(json['changeDueRupiah']),
      referenceCode: serializer.fromJson<String?>(json['referenceCode']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'amountPaidRupiah': serializer.toJson<int>(amountPaidRupiah),
      'changeDueRupiah': serializer.toJson<int>(changeDueRupiah),
      'referenceCode': serializer.toJson<String?>(referenceCode),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PaymentRow copyWith(
          {int? id,
          int? orderId,
          String? paymentMethod,
          int? amountPaidRupiah,
          int? changeDueRupiah,
          Value<String?> referenceCode = const Value.absent(),
          String? status,
          DateTime? createdAt}) =>
      PaymentRow(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        amountPaidRupiah: amountPaidRupiah ?? this.amountPaidRupiah,
        changeDueRupiah: changeDueRupiah ?? this.changeDueRupiah,
        referenceCode:
            referenceCode.present ? referenceCode.value : this.referenceCode,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  PaymentRow copyWithCompanion(PaymentsCompanion data) {
    return PaymentRow(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      amountPaidRupiah: data.amountPaidRupiah.present
          ? data.amountPaidRupiah.value
          : this.amountPaidRupiah,
      changeDueRupiah: data.changeDueRupiah.present
          ? data.changeDueRupiah.value
          : this.changeDueRupiah,
      referenceCode: data.referenceCode.present
          ? data.referenceCode.value
          : this.referenceCode,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentRow(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('amountPaidRupiah: $amountPaidRupiah, ')
          ..write('changeDueRupiah: $changeDueRupiah, ')
          ..write('referenceCode: $referenceCode, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, orderId, paymentMethod, amountPaidRupiah,
      changeDueRupiah, referenceCode, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentRow &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.paymentMethod == this.paymentMethod &&
          other.amountPaidRupiah == this.amountPaidRupiah &&
          other.changeDueRupiah == this.changeDueRupiah &&
          other.referenceCode == this.referenceCode &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class PaymentsCompanion extends UpdateCompanion<PaymentRow> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<String> paymentMethod;
  final Value<int> amountPaidRupiah;
  final Value<int> changeDueRupiah;
  final Value<String?> referenceCode;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.amountPaidRupiah = const Value.absent(),
    this.changeDueRupiah = const Value.absent(),
    this.referenceCode = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required String paymentMethod,
    required int amountPaidRupiah,
    this.changeDueRupiah = const Value.absent(),
    this.referenceCode = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : orderId = Value(orderId),
        paymentMethod = Value(paymentMethod),
        amountPaidRupiah = Value(amountPaidRupiah);
  static Insertable<PaymentRow> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<String>? paymentMethod,
    Expression<int>? amountPaidRupiah,
    Expression<int>? changeDueRupiah,
    Expression<String>? referenceCode,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (amountPaidRupiah != null) 'amount_paid_rupiah': amountPaidRupiah,
      if (changeDueRupiah != null) 'change_due_rupiah': changeDueRupiah,
      if (referenceCode != null) 'reference_code': referenceCode,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PaymentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? orderId,
      Value<String>? paymentMethod,
      Value<int>? amountPaidRupiah,
      Value<int>? changeDueRupiah,
      Value<String?>? referenceCode,
      Value<String>? status,
      Value<DateTime>? createdAt}) {
    return PaymentsCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      amountPaidRupiah: amountPaidRupiah ?? this.amountPaidRupiah,
      changeDueRupiah: changeDueRupiah ?? this.changeDueRupiah,
      referenceCode: referenceCode ?? this.referenceCode,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (amountPaidRupiah.present) {
      map['amount_paid_rupiah'] = Variable<int>(amountPaidRupiah.value);
    }
    if (changeDueRupiah.present) {
      map['change_due_rupiah'] = Variable<int>(changeDueRupiah.value);
    }
    if (referenceCode.present) {
      map['reference_code'] = Variable<String>(referenceCode.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('amountPaidRupiah: $amountPaidRupiah, ')
          ..write('changeDueRupiah: $changeDueRupiah, ')
          ..write('referenceCode: $referenceCode, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<SettingRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SettingRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingRow(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class SettingRow extends DataClass implements Insertable<SettingRow> {
  final String key;
  final String value;
  const SettingRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      key: Value(key),
      value: Value(value),
    );
  }

  factory SettingRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SettingRow copyWith({String? key, String? value}) => SettingRow(
        key: key ?? this.key,
        value: value ?? this.value,
      );
  SettingRow copyWithCompanion(SettingsCompanion data) {
    return SettingRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingRow &&
          other.key == this.key &&
          other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<SettingRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<SettingRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith(
      {Value<String>? key, Value<String>? value, Value<int>? rowid}) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ProductVariantsTable productVariants =
      $ProductVariantsTable(this);
  late final $ModifierGroupsTable modifierGroups = $ModifierGroupsTable(this);
  late final $ModifierOptionsTable modifierOptions =
      $ModifierOptionsTable(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $OrderItemsTable orderItems = $OrderItemsTable(this);
  late final $OrderItemModifiersTable orderItemModifiers =
      $OrderItemModifiersTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        categories,
        products,
        productVariants,
        modifierGroups,
        modifierOptions,
        orders,
        orderItems,
        orderItemModifiers,
        payments,
        settings
      ];
}

typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String name,
  Value<int> displayOrder,
  Value<String> iconName,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> displayOrder,
  Value<String> iconName,
});

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, CategoryRow> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductsTable, List<ProductRow>>
      _productsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.products,
              aliasName: 'categories__id__products__category_id');

  $$ProductsTableProcessedTableManager get productsRefs {
    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_productsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  Expression<bool> productsRefs(
      Expression<bool> Function($$ProductsTableFilterComposer f) f) {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  Expression<T> productsRefs<T extends Object>(
      Expression<T> Function($$ProductsTableAnnotationComposer a) f) {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    CategoryRow,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (CategoryRow, $$CategoriesTableReferences),
    CategoryRow,
    PrefetchHooks Function({bool productsRefs})> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> displayOrder = const Value.absent(),
            Value<String> iconName = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            displayOrder: displayOrder,
            iconName: iconName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<int> displayOrder = const Value.absent(),
            Value<String> iconName = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            displayOrder: displayOrder,
            iconName: iconName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$CategoriesTable, CategoryRow>(table),
                    $$CategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productsRefs) db.products],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsRefs)
                    await $_getPrefetchedData<CategoryRow, $CategoriesTable,
                            ProductRow>(
                        currentTable: table,
                        referencedTable:
                            $$CategoriesTableReferences._productsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesTableReferences(db, table, p0)
                                .productsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    CategoryRow,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (CategoryRow, $$CategoriesTableReferences),
    CategoryRow,
    PrefetchHooks Function({bool productsRefs})>;
typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  Value<int> id,
  required int categoryId,
  required String name,
  required String shortDescription,
  required int basePrice,
  required String imageUrl,
  Value<String?> badge,
  Value<bool> isAvailable,
  Value<bool> isBestSeller,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<int> id,
  Value<int> categoryId,
  Value<String> name,
  Value<String> shortDescription,
  Value<int> basePrice,
  Value<String> imageUrl,
  Value<String?> badge,
  Value<bool> isAvailable,
  Value<bool> isBestSeller,
});

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, ProductRow> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias('products__category_id__categories__id');

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager($_db, $_db.categories)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ProductVariantsTable, List<ProductVariantRow>>
      _productVariantsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.productVariants,
              aliasName: 'products__id__product_variants__product_id');

  $$ProductVariantsTableProcessedTableManager get productVariantsRefs {
    final manager =
        $$ProductVariantsTableTableManager($_db, $_db.productVariants)
            .filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_productVariantsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get basePrice => $composableBuilder(
      column: $table.basePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get badge => $composableBuilder(
      column: $table.badge, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAvailable => $composableBuilder(
      column: $table.isAvailable, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBestSeller => $composableBuilder(
      column: $table.isBestSeller, builder: (column) => ColumnFilters(column));

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> productVariantsRefs(
      Expression<bool> Function($$ProductVariantsTableFilterComposer f) f) {
    final $$ProductVariantsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productVariants,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductVariantsTableFilterComposer(
              $db: $db,
              $table: $db.productVariants,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get basePrice => $composableBuilder(
      column: $table.basePrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get badge => $composableBuilder(
      column: $table.badge, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAvailable => $composableBuilder(
      column: $table.isAvailable, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBestSeller => $composableBuilder(
      column: $table.isBestSeller,
      builder: (column) => ColumnOrderings(column));

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription, builder: (column) => column);

  GeneratedColumn<int> get basePrice =>
      $composableBuilder(column: $table.basePrice, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get badge =>
      $composableBuilder(column: $table.badge, builder: (column) => column);

  GeneratedColumn<bool> get isAvailable => $composableBuilder(
      column: $table.isAvailable, builder: (column) => column);

  GeneratedColumn<bool> get isBestSeller => $composableBuilder(
      column: $table.isBestSeller, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> productVariantsRefs<T extends Object>(
      Expression<T> Function($$ProductVariantsTableAnnotationComposer a) f) {
    final $$ProductVariantsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productVariants,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductVariantsTableAnnotationComposer(
              $db: $db,
              $table: $db.productVariants,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTable,
    ProductRow,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (ProductRow, $$ProductsTableReferences),
    ProductRow,
    PrefetchHooks Function({bool categoryId, bool productVariantsRefs})> {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> shortDescription = const Value.absent(),
            Value<int> basePrice = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String?> badge = const Value.absent(),
            Value<bool> isAvailable = const Value.absent(),
            Value<bool> isBestSeller = const Value.absent(),
          }) =>
              ProductsCompanion(
            id: id,
            categoryId: categoryId,
            name: name,
            shortDescription: shortDescription,
            basePrice: basePrice,
            imageUrl: imageUrl,
            badge: badge,
            isAvailable: isAvailable,
            isBestSeller: isBestSeller,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int categoryId,
            required String name,
            required String shortDescription,
            required int basePrice,
            required String imageUrl,
            Value<String?> badge = const Value.absent(),
            Value<bool> isAvailable = const Value.absent(),
            Value<bool> isBestSeller = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            id: id,
            categoryId: categoryId,
            name: name,
            shortDescription: shortDescription,
            basePrice: basePrice,
            imageUrl: imageUrl,
            badge: badge,
            isAvailable: isAvailable,
            isBestSeller: isBestSeller,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$ProductsTable, ProductRow>(table),
                    $$ProductsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {categoryId = false, productVariantsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productVariantsRefs) db.productVariants
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$ProductsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$ProductsTableReferences._categoryIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productVariantsRefs)
                    await $_getPrefetchedData<ProductRow, $ProductsTable,
                            ProductVariantRow>(
                        currentTable: table,
                        referencedTable: $$ProductsTableReferences
                            ._productVariantsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableReferences(db, table, p0)
                                .productVariantsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsTable,
    ProductRow,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (ProductRow, $$ProductsTableReferences),
    ProductRow,
    PrefetchHooks Function({bool categoryId, bool productVariantsRefs})>;
typedef $$ProductVariantsTableCreateCompanionBuilder = ProductVariantsCompanion
    Function({
  Value<int> id,
  required int productId,
  required String name,
  Value<int> priceAdjustment,
});
typedef $$ProductVariantsTableUpdateCompanionBuilder = ProductVariantsCompanion
    Function({
  Value<int> id,
  Value<int> productId,
  Value<String> name,
  Value<int> priceAdjustment,
});

final class $$ProductVariantsTableReferences extends BaseReferences<
    _$AppDatabase, $ProductVariantsTable, ProductVariantRow> {
  $$ProductVariantsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('product_variants__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ProductVariantsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductVariantsTable> {
  $$ProductVariantsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get priceAdjustment => $composableBuilder(
      column: $table.priceAdjustment,
      builder: (column) => ColumnFilters(column));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductVariantsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductVariantsTable> {
  $$ProductVariantsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get priceAdjustment => $composableBuilder(
      column: $table.priceAdjustment,
      builder: (column) => ColumnOrderings(column));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableOrderingComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductVariantsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductVariantsTable> {
  $$ProductVariantsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get priceAdjustment => $composableBuilder(
      column: $table.priceAdjustment, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductVariantsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductVariantsTable,
    ProductVariantRow,
    $$ProductVariantsTableFilterComposer,
    $$ProductVariantsTableOrderingComposer,
    $$ProductVariantsTableAnnotationComposer,
    $$ProductVariantsTableCreateCompanionBuilder,
    $$ProductVariantsTableUpdateCompanionBuilder,
    (ProductVariantRow, $$ProductVariantsTableReferences),
    ProductVariantRow,
    PrefetchHooks Function({bool productId})> {
  $$ProductVariantsTableTableManager(
      _$AppDatabase db, $ProductVariantsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductVariantsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductVariantsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductVariantsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> priceAdjustment = const Value.absent(),
          }) =>
              ProductVariantsCompanion(
            id: id,
            productId: productId,
            name: name,
            priceAdjustment: priceAdjustment,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int productId,
            required String name,
            Value<int> priceAdjustment = const Value.absent(),
          }) =>
              ProductVariantsCompanion.insert(
            id: id,
            productId: productId,
            name: name,
            priceAdjustment: priceAdjustment,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$ProductVariantsTable, ProductVariantRow>(
                        table),
                    $$ProductVariantsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$ProductVariantsTableReferences._productIdTable(db),
                    referencedColumn:
                        $$ProductVariantsTableReferences._productIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ProductVariantsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductVariantsTable,
    ProductVariantRow,
    $$ProductVariantsTableFilterComposer,
    $$ProductVariantsTableOrderingComposer,
    $$ProductVariantsTableAnnotationComposer,
    $$ProductVariantsTableCreateCompanionBuilder,
    $$ProductVariantsTableUpdateCompanionBuilder,
    (ProductVariantRow, $$ProductVariantsTableReferences),
    ProductVariantRow,
    PrefetchHooks Function({bool productId})>;
typedef $$ModifierGroupsTableCreateCompanionBuilder = ModifierGroupsCompanion
    Function({
  Value<int> id,
  required String name,
  Value<bool> isRequired,
  Value<int> minSelect,
  Value<int> maxSelect,
});
typedef $$ModifierGroupsTableUpdateCompanionBuilder = ModifierGroupsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<bool> isRequired,
  Value<int> minSelect,
  Value<int> maxSelect,
});

final class $$ModifierGroupsTableReferences extends BaseReferences<
    _$AppDatabase, $ModifierGroupsTable, ModifierGroupRow> {
  $$ModifierGroupsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ModifierOptionsTable, List<ModifierOptionRow>>
      _modifierOptionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.modifierOptions,
              aliasName: 'modifier_groups__id__modifier_options__group_id');

  $$ModifierOptionsTableProcessedTableManager get modifierOptionsRefs {
    final manager =
        $$ModifierOptionsTableTableManager($_db, $_db.modifierOptions)
            .filter((f) => f.groupId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_modifierOptionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ModifierGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $ModifierGroupsTable> {
  $$ModifierGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRequired => $composableBuilder(
      column: $table.isRequired, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minSelect => $composableBuilder(
      column: $table.minSelect, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxSelect => $composableBuilder(
      column: $table.maxSelect, builder: (column) => ColumnFilters(column));

  Expression<bool> modifierOptionsRefs(
      Expression<bool> Function($$ModifierOptionsTableFilterComposer f) f) {
    final $$ModifierOptionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.modifierOptions,
        getReferencedColumn: (t) => t.groupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModifierOptionsTableFilterComposer(
              $db: $db,
              $table: $db.modifierOptions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ModifierGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $ModifierGroupsTable> {
  $$ModifierGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRequired => $composableBuilder(
      column: $table.isRequired, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minSelect => $composableBuilder(
      column: $table.minSelect, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxSelect => $composableBuilder(
      column: $table.maxSelect, builder: (column) => ColumnOrderings(column));
}

class $$ModifierGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ModifierGroupsTable> {
  $$ModifierGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isRequired => $composableBuilder(
      column: $table.isRequired, builder: (column) => column);

  GeneratedColumn<int> get minSelect =>
      $composableBuilder(column: $table.minSelect, builder: (column) => column);

  GeneratedColumn<int> get maxSelect =>
      $composableBuilder(column: $table.maxSelect, builder: (column) => column);

  Expression<T> modifierOptionsRefs<T extends Object>(
      Expression<T> Function($$ModifierOptionsTableAnnotationComposer a) f) {
    final $$ModifierOptionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.modifierOptions,
        getReferencedColumn: (t) => t.groupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModifierOptionsTableAnnotationComposer(
              $db: $db,
              $table: $db.modifierOptions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ModifierGroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ModifierGroupsTable,
    ModifierGroupRow,
    $$ModifierGroupsTableFilterComposer,
    $$ModifierGroupsTableOrderingComposer,
    $$ModifierGroupsTableAnnotationComposer,
    $$ModifierGroupsTableCreateCompanionBuilder,
    $$ModifierGroupsTableUpdateCompanionBuilder,
    (ModifierGroupRow, $$ModifierGroupsTableReferences),
    ModifierGroupRow,
    PrefetchHooks Function({bool modifierOptionsRefs})> {
  $$ModifierGroupsTableTableManager(
      _$AppDatabase db, $ModifierGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModifierGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModifierGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModifierGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isRequired = const Value.absent(),
            Value<int> minSelect = const Value.absent(),
            Value<int> maxSelect = const Value.absent(),
          }) =>
              ModifierGroupsCompanion(
            id: id,
            name: name,
            isRequired: isRequired,
            minSelect: minSelect,
            maxSelect: maxSelect,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<bool> isRequired = const Value.absent(),
            Value<int> minSelect = const Value.absent(),
            Value<int> maxSelect = const Value.absent(),
          }) =>
              ModifierGroupsCompanion.insert(
            id: id,
            name: name,
            isRequired: isRequired,
            minSelect: minSelect,
            maxSelect: maxSelect,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$ModifierGroupsTable, ModifierGroupRow>(table),
                    $$ModifierGroupsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({modifierOptionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (modifierOptionsRefs) db.modifierOptions
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (modifierOptionsRefs)
                    await $_getPrefetchedData<ModifierGroupRow,
                            $ModifierGroupsTable, ModifierOptionRow>(
                        currentTable: table,
                        referencedTable: $$ModifierGroupsTableReferences
                            ._modifierOptionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ModifierGroupsTableReferences(db, table, p0)
                                .modifierOptionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.groupId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ModifierGroupsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ModifierGroupsTable,
    ModifierGroupRow,
    $$ModifierGroupsTableFilterComposer,
    $$ModifierGroupsTableOrderingComposer,
    $$ModifierGroupsTableAnnotationComposer,
    $$ModifierGroupsTableCreateCompanionBuilder,
    $$ModifierGroupsTableUpdateCompanionBuilder,
    (ModifierGroupRow, $$ModifierGroupsTableReferences),
    ModifierGroupRow,
    PrefetchHooks Function({bool modifierOptionsRefs})>;
typedef $$ModifierOptionsTableCreateCompanionBuilder = ModifierOptionsCompanion
    Function({
  Value<int> id,
  required int groupId,
  required String name,
  Value<int> priceAdjustment,
});
typedef $$ModifierOptionsTableUpdateCompanionBuilder = ModifierOptionsCompanion
    Function({
  Value<int> id,
  Value<int> groupId,
  Value<String> name,
  Value<int> priceAdjustment,
});

final class $$ModifierOptionsTableReferences extends BaseReferences<
    _$AppDatabase, $ModifierOptionsTable, ModifierOptionRow> {
  $$ModifierOptionsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ModifierGroupsTable _groupIdTable(_$AppDatabase db) =>
      db.modifierGroups
          .createAlias('modifier_options__group_id__modifier_groups__id');

  $$ModifierGroupsTableProcessedTableManager get groupId {
    final $_column = $_itemColumn<int>('group_id')!;

    final manager = $$ModifierGroupsTableTableManager($_db, $_db.modifierGroups)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ModifierOptionsTableFilterComposer
    extends Composer<_$AppDatabase, $ModifierOptionsTable> {
  $$ModifierOptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get priceAdjustment => $composableBuilder(
      column: $table.priceAdjustment,
      builder: (column) => ColumnFilters(column));

  $$ModifierGroupsTableFilterComposer get groupId {
    final $$ModifierGroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $db.modifierGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModifierGroupsTableFilterComposer(
              $db: $db,
              $table: $db.modifierGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ModifierOptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ModifierOptionsTable> {
  $$ModifierOptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get priceAdjustment => $composableBuilder(
      column: $table.priceAdjustment,
      builder: (column) => ColumnOrderings(column));

  $$ModifierGroupsTableOrderingComposer get groupId {
    final $$ModifierGroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $db.modifierGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModifierGroupsTableOrderingComposer(
              $db: $db,
              $table: $db.modifierGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ModifierOptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ModifierOptionsTable> {
  $$ModifierOptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get priceAdjustment => $composableBuilder(
      column: $table.priceAdjustment, builder: (column) => column);

  $$ModifierGroupsTableAnnotationComposer get groupId {
    final $$ModifierGroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $db.modifierGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ModifierGroupsTableAnnotationComposer(
              $db: $db,
              $table: $db.modifierGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ModifierOptionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ModifierOptionsTable,
    ModifierOptionRow,
    $$ModifierOptionsTableFilterComposer,
    $$ModifierOptionsTableOrderingComposer,
    $$ModifierOptionsTableAnnotationComposer,
    $$ModifierOptionsTableCreateCompanionBuilder,
    $$ModifierOptionsTableUpdateCompanionBuilder,
    (ModifierOptionRow, $$ModifierOptionsTableReferences),
    ModifierOptionRow,
    PrefetchHooks Function({bool groupId})> {
  $$ModifierOptionsTableTableManager(
      _$AppDatabase db, $ModifierOptionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModifierOptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModifierOptionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModifierOptionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> groupId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> priceAdjustment = const Value.absent(),
          }) =>
              ModifierOptionsCompanion(
            id: id,
            groupId: groupId,
            name: name,
            priceAdjustment: priceAdjustment,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int groupId,
            required String name,
            Value<int> priceAdjustment = const Value.absent(),
          }) =>
              ModifierOptionsCompanion.insert(
            id: id,
            groupId: groupId,
            name: name,
            priceAdjustment: priceAdjustment,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$ModifierOptionsTable, ModifierOptionRow>(
                        table),
                    $$ModifierOptionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({groupId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (groupId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groupId,
                    referencedTable:
                        $$ModifierOptionsTableReferences._groupIdTable(db),
                    referencedColumn:
                        $$ModifierOptionsTableReferences._groupIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ModifierOptionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ModifierOptionsTable,
    ModifierOptionRow,
    $$ModifierOptionsTableFilterComposer,
    $$ModifierOptionsTableOrderingComposer,
    $$ModifierOptionsTableAnnotationComposer,
    $$ModifierOptionsTableCreateCompanionBuilder,
    $$ModifierOptionsTableUpdateCompanionBuilder,
    (ModifierOptionRow, $$ModifierOptionsTableReferences),
    ModifierOptionRow,
    PrefetchHooks Function({bool groupId})>;
typedef $$OrdersTableCreateCompanionBuilder = OrdersCompanion Function({
  Value<int> id,
  required String orderNumber,
  required String orderType,
  required String tableLabel,
  required String cashierName,
  required String shiftName,
  required int subtotalRupiah,
  required int taxPb1Rupiah,
  required int serviceChargeRupiah,
  required int totalRupiah,
  Value<String> status,
  Value<DateTime> createdAt,
});
typedef $$OrdersTableUpdateCompanionBuilder = OrdersCompanion Function({
  Value<int> id,
  Value<String> orderNumber,
  Value<String> orderType,
  Value<String> tableLabel,
  Value<String> cashierName,
  Value<String> shiftName,
  Value<int> subtotalRupiah,
  Value<int> taxPb1Rupiah,
  Value<int> serviceChargeRupiah,
  Value<int> totalRupiah,
  Value<String> status,
  Value<DateTime> createdAt,
});

final class $$OrdersTableReferences
    extends BaseReferences<_$AppDatabase, $OrdersTable, OrderRow> {
  $$OrdersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OrderItemsTable, List<OrderItemRow>>
      _orderItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.orderItems,
              aliasName: 'orders__id__order_items__order_id');

  $$OrderItemsTableProcessedTableManager get orderItemsRefs {
    final manager = $$OrderItemsTableTableManager($_db, $_db.orderItems)
        .filter((f) => f.orderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_orderItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PaymentsTable, List<PaymentRow>>
      _paymentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.payments,
              aliasName: 'orders__id__payments__order_id');

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager($_db, $_db.payments)
        .filter((f) => f.orderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$OrdersTableFilterComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderType => $composableBuilder(
      column: $table.orderType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tableLabel => $composableBuilder(
      column: $table.tableLabel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cashierName => $composableBuilder(
      column: $table.cashierName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shiftName => $composableBuilder(
      column: $table.shiftName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subtotalRupiah => $composableBuilder(
      column: $table.subtotalRupiah,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get taxPb1Rupiah => $composableBuilder(
      column: $table.taxPb1Rupiah, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get serviceChargeRupiah => $composableBuilder(
      column: $table.serviceChargeRupiah,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalRupiah => $composableBuilder(
      column: $table.totalRupiah, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> orderItemsRefs(
      Expression<bool> Function($$OrderItemsTableFilterComposer f) f) {
    final $$OrderItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.orderItems,
        getReferencedColumn: (t) => t.orderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderItemsTableFilterComposer(
              $db: $db,
              $table: $db.orderItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> paymentsRefs(
      Expression<bool> Function($$PaymentsTableFilterComposer f) f) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.payments,
        getReferencedColumn: (t) => t.orderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaymentsTableFilterComposer(
              $db: $db,
              $table: $db.payments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderType => $composableBuilder(
      column: $table.orderType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tableLabel => $composableBuilder(
      column: $table.tableLabel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cashierName => $composableBuilder(
      column: $table.cashierName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shiftName => $composableBuilder(
      column: $table.shiftName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subtotalRupiah => $composableBuilder(
      column: $table.subtotalRupiah,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get taxPb1Rupiah => $composableBuilder(
      column: $table.taxPb1Rupiah,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get serviceChargeRupiah => $composableBuilder(
      column: $table.serviceChargeRupiah,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalRupiah => $composableBuilder(
      column: $table.totalRupiah, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$OrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => column);

  GeneratedColumn<String> get orderType =>
      $composableBuilder(column: $table.orderType, builder: (column) => column);

  GeneratedColumn<String> get tableLabel => $composableBuilder(
      column: $table.tableLabel, builder: (column) => column);

  GeneratedColumn<String> get cashierName => $composableBuilder(
      column: $table.cashierName, builder: (column) => column);

  GeneratedColumn<String> get shiftName =>
      $composableBuilder(column: $table.shiftName, builder: (column) => column);

  GeneratedColumn<int> get subtotalRupiah => $composableBuilder(
      column: $table.subtotalRupiah, builder: (column) => column);

  GeneratedColumn<int> get taxPb1Rupiah => $composableBuilder(
      column: $table.taxPb1Rupiah, builder: (column) => column);

  GeneratedColumn<int> get serviceChargeRupiah => $composableBuilder(
      column: $table.serviceChargeRupiah, builder: (column) => column);

  GeneratedColumn<int> get totalRupiah => $composableBuilder(
      column: $table.totalRupiah, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> orderItemsRefs<T extends Object>(
      Expression<T> Function($$OrderItemsTableAnnotationComposer a) f) {
    final $$OrderItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.orderItems,
        getReferencedColumn: (t) => t.orderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.orderItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> paymentsRefs<T extends Object>(
      Expression<T> Function($$PaymentsTableAnnotationComposer a) f) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.payments,
        getReferencedColumn: (t) => t.orderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaymentsTableAnnotationComposer(
              $db: $db,
              $table: $db.payments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OrdersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrdersTable,
    OrderRow,
    $$OrdersTableFilterComposer,
    $$OrdersTableOrderingComposer,
    $$OrdersTableAnnotationComposer,
    $$OrdersTableCreateCompanionBuilder,
    $$OrdersTableUpdateCompanionBuilder,
    (OrderRow, $$OrdersTableReferences),
    OrderRow,
    PrefetchHooks Function({bool orderItemsRefs, bool paymentsRefs})> {
  $$OrdersTableTableManager(_$AppDatabase db, $OrdersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> orderNumber = const Value.absent(),
            Value<String> orderType = const Value.absent(),
            Value<String> tableLabel = const Value.absent(),
            Value<String> cashierName = const Value.absent(),
            Value<String> shiftName = const Value.absent(),
            Value<int> subtotalRupiah = const Value.absent(),
            Value<int> taxPb1Rupiah = const Value.absent(),
            Value<int> serviceChargeRupiah = const Value.absent(),
            Value<int> totalRupiah = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              OrdersCompanion(
            id: id,
            orderNumber: orderNumber,
            orderType: orderType,
            tableLabel: tableLabel,
            cashierName: cashierName,
            shiftName: shiftName,
            subtotalRupiah: subtotalRupiah,
            taxPb1Rupiah: taxPb1Rupiah,
            serviceChargeRupiah: serviceChargeRupiah,
            totalRupiah: totalRupiah,
            status: status,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String orderNumber,
            required String orderType,
            required String tableLabel,
            required String cashierName,
            required String shiftName,
            required int subtotalRupiah,
            required int taxPb1Rupiah,
            required int serviceChargeRupiah,
            required int totalRupiah,
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              OrdersCompanion.insert(
            id: id,
            orderNumber: orderNumber,
            orderType: orderType,
            tableLabel: tableLabel,
            cashierName: cashierName,
            shiftName: shiftName,
            subtotalRupiah: subtotalRupiah,
            taxPb1Rupiah: taxPb1Rupiah,
            serviceChargeRupiah: serviceChargeRupiah,
            totalRupiah: totalRupiah,
            status: status,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$OrdersTable, OrderRow>(table),
                    $$OrdersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {orderItemsRefs = false, paymentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (orderItemsRefs) db.orderItems,
                if (paymentsRefs) db.payments
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (orderItemsRefs)
                    await $_getPrefetchedData<OrderRow, $OrdersTable,
                            OrderItemRow>(
                        currentTable: table,
                        referencedTable:
                            $$OrdersTableReferences._orderItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OrdersTableReferences(db, table, p0)
                                .orderItemsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.orderId == item.id),
                        typedResults: items),
                  if (paymentsRefs)
                    await $_getPrefetchedData<OrderRow, $OrdersTable,
                            PaymentRow>(
                        currentTable: table,
                        referencedTable:
                            $$OrdersTableReferences._paymentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OrdersTableReferences(db, table, p0).paymentsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.orderId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$OrdersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OrdersTable,
    OrderRow,
    $$OrdersTableFilterComposer,
    $$OrdersTableOrderingComposer,
    $$OrdersTableAnnotationComposer,
    $$OrdersTableCreateCompanionBuilder,
    $$OrdersTableUpdateCompanionBuilder,
    (OrderRow, $$OrdersTableReferences),
    OrderRow,
    PrefetchHooks Function({bool orderItemsRefs, bool paymentsRefs})>;
typedef $$OrderItemsTableCreateCompanionBuilder = OrderItemsCompanion Function({
  Value<int> id,
  required int orderId,
  required int productId,
  required String productName,
  Value<String> variantName,
  required int unitPriceRupiah,
  required int quantity,
  required int lineTotalRupiah,
  Value<String?> notes,
});
typedef $$OrderItemsTableUpdateCompanionBuilder = OrderItemsCompanion Function({
  Value<int> id,
  Value<int> orderId,
  Value<int> productId,
  Value<String> productName,
  Value<String> variantName,
  Value<int> unitPriceRupiah,
  Value<int> quantity,
  Value<int> lineTotalRupiah,
  Value<String?> notes,
});

final class $$OrderItemsTableReferences
    extends BaseReferences<_$AppDatabase, $OrderItemsTable, OrderItemRow> {
  $$OrderItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $OrdersTable _orderIdTable(_$AppDatabase db) =>
      db.orders.createAlias('order_items__order_id__orders__id');

  $$OrdersTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<int>('order_id')!;

    final manager = $$OrdersTableTableManager($_db, $_db.orders)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$OrderItemModifiersTable,
      List<OrderItemModifierRow>> _orderItemModifiersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.orderItemModifiers,
          aliasName: 'order_items__id__order_item_modifiers__order_item_id');

  $$OrderItemModifiersTableProcessedTableManager get orderItemModifiersRefs {
    final manager = $$OrderItemModifiersTableTableManager(
            $_db, $_db.orderItemModifiers)
        .filter((f) => f.orderItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_orderItemModifiersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$OrderItemsTableFilterComposer
    extends Composer<_$AppDatabase, $OrderItemsTable> {
  $$OrderItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get variantName => $composableBuilder(
      column: $table.variantName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unitPriceRupiah => $composableBuilder(
      column: $table.unitPriceRupiah,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lineTotalRupiah => $composableBuilder(
      column: $table.lineTotalRupiah,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$OrdersTableFilterComposer get orderId {
    final $$OrdersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.orders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrdersTableFilterComposer(
              $db: $db,
              $table: $db.orders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> orderItemModifiersRefs(
      Expression<bool> Function($$OrderItemModifiersTableFilterComposer f) f) {
    final $$OrderItemModifiersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.orderItemModifiers,
        getReferencedColumn: (t) => t.orderItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderItemModifiersTableFilterComposer(
              $db: $db,
              $table: $db.orderItemModifiers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OrderItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderItemsTable> {
  $$OrderItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get variantName => $composableBuilder(
      column: $table.variantName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unitPriceRupiah => $composableBuilder(
      column: $table.unitPriceRupiah,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lineTotalRupiah => $composableBuilder(
      column: $table.lineTotalRupiah,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$OrdersTableOrderingComposer get orderId {
    final $$OrdersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.orders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrdersTableOrderingComposer(
              $db: $db,
              $table: $db.orders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OrderItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderItemsTable> {
  $$OrderItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => column);

  GeneratedColumn<String> get variantName => $composableBuilder(
      column: $table.variantName, builder: (column) => column);

  GeneratedColumn<int> get unitPriceRupiah => $composableBuilder(
      column: $table.unitPriceRupiah, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get lineTotalRupiah => $composableBuilder(
      column: $table.lineTotalRupiah, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$OrdersTableAnnotationComposer get orderId {
    final $$OrdersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.orders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrdersTableAnnotationComposer(
              $db: $db,
              $table: $db.orders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> orderItemModifiersRefs<T extends Object>(
      Expression<T> Function($$OrderItemModifiersTableAnnotationComposer a) f) {
    final $$OrderItemModifiersTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.orderItemModifiers,
            getReferencedColumn: (t) => t.orderItemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$OrderItemModifiersTableAnnotationComposer(
                  $db: $db,
                  $table: $db.orderItemModifiers,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$OrderItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrderItemsTable,
    OrderItemRow,
    $$OrderItemsTableFilterComposer,
    $$OrderItemsTableOrderingComposer,
    $$OrderItemsTableAnnotationComposer,
    $$OrderItemsTableCreateCompanionBuilder,
    $$OrderItemsTableUpdateCompanionBuilder,
    (OrderItemRow, $$OrderItemsTableReferences),
    OrderItemRow,
    PrefetchHooks Function({bool orderId, bool orderItemModifiersRefs})> {
  $$OrderItemsTableTableManager(_$AppDatabase db, $OrderItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> orderId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<String> variantName = const Value.absent(),
            Value<int> unitPriceRupiah = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> lineTotalRupiah = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              OrderItemsCompanion(
            id: id,
            orderId: orderId,
            productId: productId,
            productName: productName,
            variantName: variantName,
            unitPriceRupiah: unitPriceRupiah,
            quantity: quantity,
            lineTotalRupiah: lineTotalRupiah,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int orderId,
            required int productId,
            required String productName,
            Value<String> variantName = const Value.absent(),
            required int unitPriceRupiah,
            required int quantity,
            required int lineTotalRupiah,
            Value<String?> notes = const Value.absent(),
          }) =>
              OrderItemsCompanion.insert(
            id: id,
            orderId: orderId,
            productId: productId,
            productName: productName,
            variantName: variantName,
            unitPriceRupiah: unitPriceRupiah,
            quantity: quantity,
            lineTotalRupiah: lineTotalRupiah,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$OrderItemsTable, OrderItemRow>(table),
                    $$OrderItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {orderId = false, orderItemModifiersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (orderItemModifiersRefs) db.orderItemModifiers
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (orderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.orderId,
                    referencedTable:
                        $$OrderItemsTableReferences._orderIdTable(db),
                    referencedColumn:
                        $$OrderItemsTableReferences._orderIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (orderItemModifiersRefs)
                    await $_getPrefetchedData<OrderItemRow, $OrderItemsTable,
                            OrderItemModifierRow>(
                        currentTable: table,
                        referencedTable: $$OrderItemsTableReferences
                            ._orderItemModifiersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OrderItemsTableReferences(db, table, p0)
                                .orderItemModifiersRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.orderItemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$OrderItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OrderItemsTable,
    OrderItemRow,
    $$OrderItemsTableFilterComposer,
    $$OrderItemsTableOrderingComposer,
    $$OrderItemsTableAnnotationComposer,
    $$OrderItemsTableCreateCompanionBuilder,
    $$OrderItemsTableUpdateCompanionBuilder,
    (OrderItemRow, $$OrderItemsTableReferences),
    OrderItemRow,
    PrefetchHooks Function({bool orderId, bool orderItemModifiersRefs})>;
typedef $$OrderItemModifiersTableCreateCompanionBuilder
    = OrderItemModifiersCompanion Function({
  Value<int> id,
  required int orderItemId,
  required String modifierName,
  required int priceAdjustmentRupiah,
});
typedef $$OrderItemModifiersTableUpdateCompanionBuilder
    = OrderItemModifiersCompanion Function({
  Value<int> id,
  Value<int> orderItemId,
  Value<String> modifierName,
  Value<int> priceAdjustmentRupiah,
});

final class $$OrderItemModifiersTableReferences extends BaseReferences<
    _$AppDatabase, $OrderItemModifiersTable, OrderItemModifierRow> {
  $$OrderItemModifiersTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $OrderItemsTable _orderItemIdTable(_$AppDatabase db) => db.orderItems
      .createAlias('order_item_modifiers__order_item_id__order_items__id');

  $$OrderItemsTableProcessedTableManager get orderItemId {
    final $_column = $_itemColumn<int>('order_item_id')!;

    final manager = $$OrderItemsTableTableManager($_db, $_db.orderItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$OrderItemModifiersTableFilterComposer
    extends Composer<_$AppDatabase, $OrderItemModifiersTable> {
  $$OrderItemModifiersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get modifierName => $composableBuilder(
      column: $table.modifierName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get priceAdjustmentRupiah => $composableBuilder(
      column: $table.priceAdjustmentRupiah,
      builder: (column) => ColumnFilters(column));

  $$OrderItemsTableFilterComposer get orderItemId {
    final $$OrderItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderItemId,
        referencedTable: $db.orderItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderItemsTableFilterComposer(
              $db: $db,
              $table: $db.orderItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OrderItemModifiersTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderItemModifiersTable> {
  $$OrderItemModifiersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get modifierName => $composableBuilder(
      column: $table.modifierName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get priceAdjustmentRupiah => $composableBuilder(
      column: $table.priceAdjustmentRupiah,
      builder: (column) => ColumnOrderings(column));

  $$OrderItemsTableOrderingComposer get orderItemId {
    final $$OrderItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderItemId,
        referencedTable: $db.orderItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderItemsTableOrderingComposer(
              $db: $db,
              $table: $db.orderItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OrderItemModifiersTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderItemModifiersTable> {
  $$OrderItemModifiersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get modifierName => $composableBuilder(
      column: $table.modifierName, builder: (column) => column);

  GeneratedColumn<int> get priceAdjustmentRupiah => $composableBuilder(
      column: $table.priceAdjustmentRupiah, builder: (column) => column);

  $$OrderItemsTableAnnotationComposer get orderItemId {
    final $$OrderItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderItemId,
        referencedTable: $db.orderItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.orderItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OrderItemModifiersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrderItemModifiersTable,
    OrderItemModifierRow,
    $$OrderItemModifiersTableFilterComposer,
    $$OrderItemModifiersTableOrderingComposer,
    $$OrderItemModifiersTableAnnotationComposer,
    $$OrderItemModifiersTableCreateCompanionBuilder,
    $$OrderItemModifiersTableUpdateCompanionBuilder,
    (OrderItemModifierRow, $$OrderItemModifiersTableReferences),
    OrderItemModifierRow,
    PrefetchHooks Function({bool orderItemId})> {
  $$OrderItemModifiersTableTableManager(
      _$AppDatabase db, $OrderItemModifiersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderItemModifiersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderItemModifiersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderItemModifiersTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> orderItemId = const Value.absent(),
            Value<String> modifierName = const Value.absent(),
            Value<int> priceAdjustmentRupiah = const Value.absent(),
          }) =>
              OrderItemModifiersCompanion(
            id: id,
            orderItemId: orderItemId,
            modifierName: modifierName,
            priceAdjustmentRupiah: priceAdjustmentRupiah,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int orderItemId,
            required String modifierName,
            required int priceAdjustmentRupiah,
          }) =>
              OrderItemModifiersCompanion.insert(
            id: id,
            orderItemId: orderItemId,
            modifierName: modifierName,
            priceAdjustmentRupiah: priceAdjustmentRupiah,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$OrderItemModifiersTable, OrderItemModifierRow>(
                        table),
                    $$OrderItemModifiersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({orderItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (orderItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.orderItemId,
                    referencedTable: $$OrderItemModifiersTableReferences
                        ._orderItemIdTable(db),
                    referencedColumn: $$OrderItemModifiersTableReferences
                        ._orderItemIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$OrderItemModifiersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OrderItemModifiersTable,
    OrderItemModifierRow,
    $$OrderItemModifiersTableFilterComposer,
    $$OrderItemModifiersTableOrderingComposer,
    $$OrderItemModifiersTableAnnotationComposer,
    $$OrderItemModifiersTableCreateCompanionBuilder,
    $$OrderItemModifiersTableUpdateCompanionBuilder,
    (OrderItemModifierRow, $$OrderItemModifiersTableReferences),
    OrderItemModifierRow,
    PrefetchHooks Function({bool orderItemId})>;
typedef $$PaymentsTableCreateCompanionBuilder = PaymentsCompanion Function({
  Value<int> id,
  required int orderId,
  required String paymentMethod,
  required int amountPaidRupiah,
  Value<int> changeDueRupiah,
  Value<String?> referenceCode,
  Value<String> status,
  Value<DateTime> createdAt,
});
typedef $$PaymentsTableUpdateCompanionBuilder = PaymentsCompanion Function({
  Value<int> id,
  Value<int> orderId,
  Value<String> paymentMethod,
  Value<int> amountPaidRupiah,
  Value<int> changeDueRupiah,
  Value<String?> referenceCode,
  Value<String> status,
  Value<DateTime> createdAt,
});

final class $$PaymentsTableReferences
    extends BaseReferences<_$AppDatabase, $PaymentsTable, PaymentRow> {
  $$PaymentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $OrdersTable _orderIdTable(_$AppDatabase db) =>
      db.orders.createAlias('payments__order_id__orders__id');

  $$OrdersTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<int>('order_id')!;

    final manager = $$OrdersTableTableManager($_db, $_db.orders)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amountPaidRupiah => $composableBuilder(
      column: $table.amountPaidRupiah,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get changeDueRupiah => $composableBuilder(
      column: $table.changeDueRupiah,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceCode => $composableBuilder(
      column: $table.referenceCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$OrdersTableFilterComposer get orderId {
    final $$OrdersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.orders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrdersTableFilterComposer(
              $db: $db,
              $table: $db.orders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amountPaidRupiah => $composableBuilder(
      column: $table.amountPaidRupiah,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get changeDueRupiah => $composableBuilder(
      column: $table.changeDueRupiah,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceCode => $composableBuilder(
      column: $table.referenceCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$OrdersTableOrderingComposer get orderId {
    final $$OrdersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.orders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrdersTableOrderingComposer(
              $db: $db,
              $table: $db.orders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<int> get amountPaidRupiah => $composableBuilder(
      column: $table.amountPaidRupiah, builder: (column) => column);

  GeneratedColumn<int> get changeDueRupiah => $composableBuilder(
      column: $table.changeDueRupiah, builder: (column) => column);

  GeneratedColumn<String> get referenceCode => $composableBuilder(
      column: $table.referenceCode, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$OrdersTableAnnotationComposer get orderId {
    final $$OrdersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.orders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrdersTableAnnotationComposer(
              $db: $db,
              $table: $db.orders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PaymentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PaymentsTable,
    PaymentRow,
    $$PaymentsTableFilterComposer,
    $$PaymentsTableOrderingComposer,
    $$PaymentsTableAnnotationComposer,
    $$PaymentsTableCreateCompanionBuilder,
    $$PaymentsTableUpdateCompanionBuilder,
    (PaymentRow, $$PaymentsTableReferences),
    PaymentRow,
    PrefetchHooks Function({bool orderId})> {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> orderId = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<int> amountPaidRupiah = const Value.absent(),
            Value<int> changeDueRupiah = const Value.absent(),
            Value<String?> referenceCode = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PaymentsCompanion(
            id: id,
            orderId: orderId,
            paymentMethod: paymentMethod,
            amountPaidRupiah: amountPaidRupiah,
            changeDueRupiah: changeDueRupiah,
            referenceCode: referenceCode,
            status: status,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int orderId,
            required String paymentMethod,
            required int amountPaidRupiah,
            Value<int> changeDueRupiah = const Value.absent(),
            Value<String?> referenceCode = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PaymentsCompanion.insert(
            id: id,
            orderId: orderId,
            paymentMethod: paymentMethod,
            amountPaidRupiah: amountPaidRupiah,
            changeDueRupiah: changeDueRupiah,
            referenceCode: referenceCode,
            status: status,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$PaymentsTable, PaymentRow>(table),
                    $$PaymentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({orderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (orderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.orderId,
                    referencedTable:
                        $$PaymentsTableReferences._orderIdTable(db),
                    referencedColumn:
                        $$PaymentsTableReferences._orderIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PaymentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PaymentsTable,
    PaymentRow,
    $$PaymentsTableFilterComposer,
    $$PaymentsTableOrderingComposer,
    $$PaymentsTableAnnotationComposer,
    $$PaymentsTableCreateCompanionBuilder,
    $$PaymentsTableUpdateCompanionBuilder,
    (PaymentRow, $$PaymentsTableReferences),
    PaymentRow,
    PrefetchHooks Function({bool orderId})>;
typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsTable,
    SettingRow,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (SettingRow, BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>),
    SettingRow,
    PrefetchHooks Function()> {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion(
            key: key,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion.insert(
            key: key,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$SettingsTable, SettingRow>(table),
                    BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SettingsTable,
    SettingRow,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (SettingRow, BaseReferences<_$AppDatabase, $SettingsTable, SettingRow>),
    SettingRow,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$ProductVariantsTableTableManager get productVariants =>
      $$ProductVariantsTableTableManager(_db, _db.productVariants);
  $$ModifierGroupsTableTableManager get modifierGroups =>
      $$ModifierGroupsTableTableManager(_db, _db.modifierGroups);
  $$ModifierOptionsTableTableManager get modifierOptions =>
      $$ModifierOptionsTableTableManager(_db, _db.modifierOptions);
  $$OrdersTableTableManager get orders =>
      $$OrdersTableTableManager(_db, _db.orders);
  $$OrderItemsTableTableManager get orderItems =>
      $$OrderItemsTableTableManager(_db, _db.orderItems);
  $$OrderItemModifiersTableTableManager get orderItemModifiers =>
      $$OrderItemModifiersTableTableManager(_db, _db.orderItemModifiers);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
