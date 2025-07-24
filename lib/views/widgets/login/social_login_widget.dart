import 'package:fanradar/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SocialLoginWidget extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;

  const SocialLoginWidget({
    Key? key,
    required this.onGooglePressed,
    required this.onFacebookPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Divider
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey[300])),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'other way to sign in',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ),
            Expanded(child: Divider(color: Colors.grey[300])),
          ],
        ),
        const SizedBox(height: 24),

        // Social buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialButton(
              image: "assets/icon/google.png",
              color: Colors.red,
              onPressed: onGooglePressed,
            ),
            const SizedBox(width: 20),
            _SocialButton(
              image: "assets/icon/facebook.png",
              color: AppTheme.primaryColor,
              onPressed: onFacebookPressed,
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String image;
  final Color color;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.image,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,

      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
