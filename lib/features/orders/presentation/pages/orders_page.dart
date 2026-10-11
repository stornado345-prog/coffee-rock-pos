import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffee_rock_pos/features/checkout/presentation/widgets/receipt_dialog.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../viewmodels/orders_viewmodel.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersState = ref.watch(ordersViewModelProvider);
    final ordersNotifier = ref.read(ordersViewModelProvider.notifier);

    return Container(
      color: AppColors.canvas,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header & Filter Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order History & Transactions',
                    style: AppTypography.headlineLarge.copyWith(
                      color: AppColors.espressoBrown,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Real-time transaction log and historical snapshots',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildFilterTab(
                    ref: ref,
                    label: 'All Orders',
                    value: 'ALL',
                    isSelected: ordersState.statusFilter == 'ALL',
                  ),
                  const SizedBox(width: 8),
                  _buildFilterTab(
                    ref: ref,
                    label: 'Completed',
                    value: 'COMPLETED',
                    isSelected: ordersState.statusFilter == 'COMPLETED',
                  ),
                  const SizedBox(width: 8),
                  _buildFilterTab(
                    ref: ref,
                    label: 'Voided',
                    value: 'VOIDED',
                    isSelected: ordersState.statusFilter == 'VOIDED',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Orders List
          Expanded(
            child: ordersState.filteredOrders.isEmpty
                ? Center(
                    child: Text(
                      'No orders found',
                      style: AppTypography.headlineSmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: ordersState.filteredOrders.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final order = ordersState.filteredOrders[index];
                      final isVoided = order.status == 'VOIDED';

                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.beige),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: isVoided
                                    ? AppColors.errorContainer
                                    : AppColors.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                isVoided
                                    ? Icons.cancel_outlined
                                    : Icons.receipt_long,
                                color: isVoided
                                    ? AppColors.error
                                    : AppColors.espressoBrown,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        order.orderNumber,
                                        style:
                                            AppTypography.headlineSmall.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.espressoBrown,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: isVoided
                                              ? AppColors.error
                                              : AppColors.secondary,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          order.status,
                                          style: AppTypography.labelSmall.copyWith(
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${order.orderType} • ${order.tableName} • Kasir: ${order.cashierName}',
                                    style: AppTypography.bodySmall.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    order.items
                                        .map((i) => '${i.quantity}x ${i.productName}')
                                        .join(', '),
                                    style: AppTypography.bodySmall.copyWith(
                                      color: AppColors.outline,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  CurrencyFormatter.format(order.totalRupiah),
                                  style: AppTypography.numericCurrency.copyWith(
                                    fontSize: 18,
                                    color: AppColors.espressoBrown,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  order.paymentMethod ?? 'PAID',
                                  style: AppTypography.labelSmall.copyWith(
                                    color: AppColors.caramel,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              tooltip: 'View Receipt',
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => ReceiptDialog(order: order),
                                );
                              },
                              icon: const Icon(Icons.print_outlined),
                              color: AppColors.espressoBrown,
                            ),
                            if (!isVoided)
                              IconButton(
                                tooltip: 'Void Order',
                                onPressed: () {
                                  ordersNotifier.voidOrder(order.id);
                                },
                                icon: const Icon(Icons.delete_outline),
                                color: AppColors.error,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTab({
    required WidgetRef ref,
    required String label,
    required String value,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () {
        ref.read(ordersViewModelProvider.notifier).setFilter(value);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.espressoBrown : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.espressoBrown : AppColors.beige,
          ),
        ),
        child: Text(
          label,
          style: AppTypography.labelMedium.copyWith(
            color: isSelected ? AppColors.white : AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
