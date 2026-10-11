import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffee_rock_pos/features/orders/data/repositories/order_repository_impl.dart';
import 'package:coffee_rock_pos/features/orders/domain/entities/order.dart';
import 'package:coffee_rock_pos/features/orders/domain/repositories/order_repository.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepositoryImpl();
});

class OrdersState {
  final List<OrderEntity> orders;
  final bool isLoading;
  final String statusFilter; // "ALL", "COMPLETED", "VOIDED"

  const OrdersState({
    this.orders = const [],
    this.isLoading = false,
    this.statusFilter = 'ALL',
  });

  List<OrderEntity> get filteredOrders {
    if (statusFilter == 'ALL') return orders;
    return orders.where((o) => o.status == statusFilter).toList();
  }

  OrdersState copyWith({
    List<OrderEntity>? orders,
    bool? isLoading,
    String? statusFilter,
  }) {
    return OrdersState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      statusFilter: statusFilter ?? this.statusFilter,
    );
  }
}

class OrdersViewModel extends StateNotifier<OrdersState> {
  final OrderRepository _repository;

  OrdersViewModel(this._repository) : super(const OrdersState()) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    state = state.copyWith(isLoading: true);
    final list = await _repository.getOrders();
    state = state.copyWith(orders: list, isLoading: false);
  }

  void setFilter(String filter) {
    state = state.copyWith(statusFilter: filter);
  }

  Future<void> voidOrder(int orderId) async {
    await _repository.voidOrder(orderId);
    await loadOrders();
  }
}

final ordersViewModelProvider =
    StateNotifierProvider<OrdersViewModel, OrdersState>((ref) {
  final repo = ref.watch(orderRepositoryProvider);
  return OrdersViewModel(repo);
});
