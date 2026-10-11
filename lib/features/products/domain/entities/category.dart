class CategoryEntity {
  final int id;
  final String name;
  final int displayOrder;
  final int itemCount;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.displayOrder,
    this.itemCount = 0,
  });
}
