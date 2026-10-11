class ModifierOptionEntity {
  final int id;
  final int groupId;
  final String name;
  final int priceAdjustment; // In Rupiah (e.g. +8000 for Oat Milk)

  const ModifierOptionEntity({
    required this.id,
    required this.groupId,
    required this.name,
    this.priceAdjustment = 0,
  });
}

class ModifierGroupEntity {
  final int id;
  final String name;
  final bool isRequired;
  final int minSelect;
  final int maxSelect;
  final List<ModifierOptionEntity> options;

  const ModifierGroupEntity({
    required this.id,
    required this.name,
    this.isRequired = false,
    this.minSelect = 0,
    this.maxSelect = 1,
    required this.options,
  });
}
