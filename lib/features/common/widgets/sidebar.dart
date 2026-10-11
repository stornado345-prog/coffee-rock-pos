import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class PosSidebar extends StatelessWidget {
  final String activeRoute;
  final ValueChanged<String> onNavigate;

  const PosSidebar({
    super.key,
    required this.activeRoute,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      decoration: const BoxDecoration(
        color: AppColors.primaryDark,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Brand Logo Section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            child: Column(
              children: [
                Image.network(
                  AppConstants.brandLogoUrl,
                  height: 38,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.coffee, color: AppColors.caramel, size: 28),
                      const SizedBox(width: 8),
                      Text(
                        'COFFEE ROCK',
                        style: AppTypography.labelLarge.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Nav Destinations
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                _buildNavItem(
                  route: '/pos',
                  label: 'POS',
                  icon: Icons.point_of_sale_outlined,
                  activeIcon: Icons.point_of_sale,
                ),
                const SizedBox(height: 4),
                _buildNavItem(
                  route: '/orders',
                  label: 'Orders',
                  icon: Icons.receipt_long_outlined,
                  activeIcon: Icons.receipt_long,
                ),
                const SizedBox(height: 4),
                _buildNavItem(
                  route: '/menu',
                  label: 'Menu',
                  icon: Icons.restaurant_menu_outlined,
                  activeIcon: Icons.restaurant_menu,
                ),
                const SizedBox(height: 4),
                _buildNavItem(
                  route: '/inventory',
                  label: 'Inventory',
                  icon: Icons.inventory_2_outlined,
                  activeIcon: Icons.inventory_2,
                ),
                const SizedBox(height: 4),
                _buildNavItem(
                  route: '/reports',
                  label: 'Reports',
                  icon: Icons.bar_chart_outlined,
                  activeIcon: Icons.bar_chart,
                ),
                const SizedBox(height: 4),
                _buildNavItem(
                  route: '/settings',
                  label: 'Settings',
                  icon: Icons.settings_outlined,
                  activeIcon: Icons.settings,
                ),
              ],
            ),
          ),

          // Footer Status Badge (Online • Station 01)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.darkCoffee.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.caramel,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'ONLINE',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.warmCream,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    AppConstants.defaultStation,
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.warmCream.withOpacity(0.8),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String route,
    required String label,
    required IconData icon,
    required IconData activeIcon,
  }) {
    final isActive = activeRoute == route;

    return InkWell(
      onTap: () => onNavigate(route),
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? AppColors.espressoBrown : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              isActive ? activeIcon : icon,
              size: 20,
              color: isActive ? AppColors.white : AppColors.warmCream.withOpacity(0.7),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: AppTypography.labelLarge.copyWith(
                color: isActive ? AppColors.white : AppColors.warmCream.withOpacity(0.7),
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
