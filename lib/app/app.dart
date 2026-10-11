import 'package:flutter/material.dart';
import '../core/constants/constants.dart';
import '../core/theme/app_theme.dart';
import 'router.dart';

class CoffeeRockPosApp extends StatelessWidget {
  const CoffeeRockPosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
