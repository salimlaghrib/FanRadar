import 'package:fanradar/core/routes/app_routes.dart';
import 'package:fanradar/views/screens/splash_screen.dart';
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
      initialRoute: AppRoutes.splash,
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
        // GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
        // Ajoute plus tard :
        // GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
        // GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),
      ],
    );
  }
}
