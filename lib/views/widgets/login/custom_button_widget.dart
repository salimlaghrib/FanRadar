import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      height: 48, // Material 3 standard button height
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style:
            ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: textColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ), // M3 standard border radius
              ),
              disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
              disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              textStyle: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              // Add splash and highlight colors
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ).copyWith(
              // Overlay color for pressed state
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.onPrimary.withOpacity(0.12);
                }
                return null;
              }),
            ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? colorScheme.onPrimary,
                  ),
                ),
              )
            : Text(
                text,
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: textColor ?? colorScheme.onPrimary,
                ),
              ),
      ),
    );
  }
}
