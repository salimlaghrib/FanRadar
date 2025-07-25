import 'package:flutter/material.dart';

class TermsCheckboxWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const TermsCheckboxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) => onChanged(newValue ?? false),
          activeColor: const Color(0xFF4285F4),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(!value),
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  children: [
                    const TextSpan(text: "I've read and agreed to "),
                    const TextSpan(
                      text: "User Agreement",
                      style: TextStyle(
                        color: Color(0xFF4285F4),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(text: " and "),
                    const TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: Color(0xFF4285F4),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}