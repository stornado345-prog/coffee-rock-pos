import '../entities/category.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<ProductEntity>> getProducts();
  Future<ProductEntity?> getProductById(int id);
  Future<void> updateProductAvailability(int id, bool isAvailable);
}
