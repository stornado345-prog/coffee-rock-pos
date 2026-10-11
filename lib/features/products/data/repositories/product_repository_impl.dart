import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  List<ProductEntity> _products = ProductLocalDataSource.getInitialProducts();
  final List<CategoryEntity> _categories = ProductLocalDataSource.getInitialCategories();

  @override
  Future<List<CategoryEntity>> getCategories() async {
    return _categories;
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    return List.unmodifiable(_products);
  }

  @override
  Future<ProductEntity?> getProductById(int id) async {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> updateProductAvailability(int id, bool isAvailable) async {
    _products = _products.map((p) {
      if (p.id == id) {
        return p.copyWith(isAvailable: isAvailable);
      }
      return p;
    }).toList();
  }
}
