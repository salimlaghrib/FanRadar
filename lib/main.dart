import 'package:fanradar/core/routes/app_routes.dart';

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
      title: 'Mon App',
      initialRoute: AppRoutes.main,
      getPages: AppRoutes.routes,
      
    );
  }
}
