import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Logo - automatically selects based on theme
        Image.asset(
          isDarkMode
              ? 'assets/images/logos/FanRadar_darkMode.png'
              : 'assets/images/logos/FanRadar_lightMode.png',
          width: 159,
          height: 150,
        ),

        const SizedBox(height: 16),

        Text(
          'Sign in to your account',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withAlpha(200),
          ),
        ),
      ],
    );
  }
}
