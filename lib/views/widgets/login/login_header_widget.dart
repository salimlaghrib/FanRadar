import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        // Logo
        Image.asset("assets/images/FanRadar.png", width: 150),

        const SizedBox(height: 16), // Added spacing

        Text(
          'Sign in to your account',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withAlpha(
              200, // Adjust opacity for better visibility
            ), // Using onSurface with opacity
          ),
        ),
      ],
    );
  }
}
