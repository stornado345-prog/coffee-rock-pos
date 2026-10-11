import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/common/widgets/sidebar.dart';
import '../features/common/widgets/top_bar.dart';
import '../features/products/presentation/pages/pos_page.dart';
import '../features/orders/presentation/pages/orders_page.dart';
import '../features/products/presentation/pages/menu_management_page.dart';
import '../features/inventory/presentation/pages/inventory_page.dart';
import '../features/reports/presentation/pages/reports_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/pos',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        final currentRoute = state.matchedLocation;

        return Scaffold(
          body: Row(
            children: [
              // Left Fixed Sidebar (approx 190 logical pixels)
              PosSidebar(
                activeRoute: currentRoute,
                onNavigate: (route) => context.go(route),
              ),

              // Main Canvas
              Expanded(
                child: Column(
                  children: [
                    // Top Bar (Cashier & Shift info)
                    PosTopBar(
                      onLockTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Screen locked for Alex M.'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),

                    // Active Screen
                    Expanded(child: child),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/pos',
          builder: (context, state) => const PosPage(),
        ),
        GoRoute(
          path: '/orders',
          builder: (context, state) => const OrdersPage(),
        ),
        GoRoute(
          path: '/menu',
          builder: (context, state) => const MenuManagementPage(),
        ),
        GoRoute(
          path: '/inventory',
          builder: (context, state) => const InventoryPage(),
        ),
        GoRoute(
          path: '/reports',
          builder: (context, state) => const ReportsPage(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
      ],
    ),
  ],
);
