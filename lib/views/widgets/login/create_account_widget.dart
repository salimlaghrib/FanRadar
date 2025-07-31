import 'package:flutter/material.dart';

class CreateAccountWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String title2;
  const CreateAccountWidget({
    super.key,
    required this.onPressed,
    required this.title,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        TextButton(
          onPressed: onPressed,
          child: Text(
            title2,
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
