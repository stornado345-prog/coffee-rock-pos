import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../data/repositories/product_repository_impl.dart';

// Repository Provider
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl();
});

// Category State
class ProductsState {
  final List<CategoryEntity> categories;
  final List<ProductEntity> products;
  final int selectedCategoryId;
  final String searchQuery;
  final bool isLoading;

  const ProductsState({
    this.categories = const [],
    this.products = const [],
    this.selectedCategoryId = 0, // 0 = All
    this.searchQuery = '',
    this.isLoading = false,
  });

  List<ProductEntity> get filteredProducts {
    return products.where((product) {
      final matchesCategory = selectedCategoryId == 0 || product.categoryId == selectedCategoryId;
      final matchesSearch = searchQuery.isEmpty ||
          product.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          product.shortDescription.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  ProductsState copyWith({
    List<CategoryEntity>? categories,
    List<ProductEntity>? products,
    int? selectedCategoryId,
    String? searchQuery,
    bool? isLoading,
  }) {
    return ProductsState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      searchQuery: searchQuery ?? this.searchQuery,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class ProductsViewModel extends StateNotifier<ProductsState> {
  final ProductRepository _repository;

  ProductsViewModel(this._repository) : super(const ProductsState()) {
    loadData();
  }

  Future<void> loadData() async {
    state = state.copyWith(isLoading: true);
    final categories = await _repository.getCategories();
    final products = await _repository.getProducts();
    state = state.copyWith(
      categories: categories,
      products: products,
      isLoading: false,
    );
  }

  void selectCategory(int categoryId) {
    state = state.copyWith(selectedCategoryId: categoryId);
  }

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  Future<void> toggleAvailability(int productId, bool isAvailable) async {
    await _repository.updateProductAvailability(productId, isAvailable);
    await loadData();
  }
}

final productsViewModelProvider =
    StateNotifierProvider<ProductsViewModel, ProductsState>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return ProductsViewModel(repo);
});
