import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const ForgotPasswordWidget({Key? key, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Forgot password?',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(
              200, // Adjust opacity for better visibility
            ),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
