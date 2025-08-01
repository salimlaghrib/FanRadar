/* import 'package:fanradar/views/screens/home_screen.dart';
 */
import 'package:fanradar/views/screens/main_screen.dart';
import 'package:fanradar/views/screens/auth/on_boarding.dart';
import 'package:fanradar/views/screens/auth/register_screen.dart';
import 'package:get/get.dart';

import '../../views/screens/auth/login_screen.dart';
import '../../views/screens/splash_screen.dart';
// import '../../views/screens/register_screen.dart';
// import '../../views/screens/forgot_password_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String main = '/main';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String onBoarding = '/onboarding';

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(name: main, page: () => MainScreen()),
    GetPage(name: onBoarding, page: () => const LoginSignupWidget()),

    // GetPage(
    //   name: home,
    //   page: () => const HomeScreen(),
    // ),
    // GetPage(
    //   name: register,
    //   page: () => const RegisterScreen(),
    // ),
    // GetPage(
    //   name: forgotPassword,
    //   page: () => const ForgotPasswordScreen(),
    // ),
  ];
}
