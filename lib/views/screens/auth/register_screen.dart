import 'package:fanradar/services/auth_service.dart';
import 'package:fanradar/views/widgets/login/create_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../../widgets/login/custom_button_widget.dart';
import '../../widgets/login/custom_text_field_widget.dart';
import '../../widgets/login/forgot_password_widget.dart';
import '../../widgets/login/login_header_widget.dart';
import '../../widgets/login/social_login_widget.dart';
import '../../widgets/login/terms_checkbox_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authService = AuthService();

  bool _isPasswordVisible = false;
  bool _isLoading = false;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Header with logo
                    const LoginHeaderWidget(),
                    const SizedBox(height: 32),

                    // Email field
                    CustomTextFieldWidget(
                      label: 'Email Address',
                      hintText: 'Enter your email address',
                      prefixIcon: Icons.email_outlined,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 16),

                    // Password field
                    CustomTextFieldWidget(
                      label: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icons.lock_outlined,
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 16),

                    // Confirm Password field
                    CustomTextFieldWidget(
                      label: 'Confirm Password',
                      hintText: 'Confirm your password',
                      prefixIcon: Icons.lock_outlined,
                      controller: _confirmPasswordController,
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        final passwordError = _validatePassword(value);
                        if (passwordError != null) return passwordError;
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),

                    // Forgot password
                    ForgotPasswordWidget(onPressed: _handleForgotPassword),
                    const SizedBox(height: 16),

                    // Terms checkbox
                    TermsCheckboxWidget(
                      value: _agreeToTerms,
                      onChanged: _toggleTermsAgreement,
                    ),
                    const SizedBox(height: 24),

                    // Sign Up button
                    CustomButtonWidget(
                      text: 'Sign Up',
                      onPressed: _agreeToTerms ? _handleSignIn : null,
                      isLoading: _isLoading,
                      backgroundColor: colorScheme.primary,
                      textColor: colorScheme.onPrimary,
                    ),
                    const SizedBox(height: 24),

                    // Social login
                    SocialLoginWidget(
                      onGooglePressed: _handleGoogleSignIn,
                      onFacebookPressed: _handleFacebookSignIn,
                    ),
                    const SizedBox(height: 24),

                    // Login redirect
                    CreateAccountWidget(
                      onPressed: _handleLogin,
                      title: "Already have an account?",
                      title2: "Back to Sign in",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Validation methods
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Event handlers
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleTermsAgreement(bool value) {
    setState(() {
      _agreeToTerms = value;
    });
  }

  void _handleForgotPassword() {
    Navigator.pushNamed(context, AppRoutes.forgotPassword);
  }

  void _handleLogin() {
    Get.toNamed(AppRoutes.login);
  }

  void _handleSignIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final result = await _authService.login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

        if (mounted) {
          if (result['success']) {
            _showMessage(result['message'], Colors.green);
            Navigator.pushReplacementNamed(context, AppRoutes.main);
          } else {
            _showMessage(result['message'], Colors.red);
          }
        }
      } catch (e) {
        if (mounted) {
          _showMessage('An error occurred. Please try again.', Colors.red);
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  void _handleGoogleSignIn() async {
    try {
      // Implement Google Sign In integration here
      // Example with google_sign_in package
      _showMessage('Google Sign In feature coming soon!', Colors.blue);
    } catch (e) {
      _showMessage('Google Sign In failed', Colors.red);
    }
  }

  void _handleFacebookSignIn() async {
    try {
      // Implement Facebook Sign In integration here
      // Example with flutter_facebook_auth package
      _showMessage('Facebook Sign In feature coming soon!', Colors.blue);
    } catch (e) {
      _showMessage('Facebook Sign In failed', Colors.red);
    }
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
