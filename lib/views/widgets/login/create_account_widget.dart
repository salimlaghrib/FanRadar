import 'package:flutter/material.dart';

class CreateAccountWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateAccountWidget({Key? key, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Create Account',
            style: TextStyle(
              color: Color(0xFF4285F4),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
