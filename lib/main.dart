import 'package:fanradar/core/routes/app_routes.dart';
import 'package:fanradar/core/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FanRadar',
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
      theme: ThemeData(
        colorScheme: AppTheme.lightColorScheme,
        useMaterial3: true,
      ),

      darkTheme: ThemeData(
        colorScheme: AppTheme.darkColorScheme,
        useMaterial3: true,
      ),
    );
  }
}
