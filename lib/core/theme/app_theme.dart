import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  /* static const Color primaryColor = Color(0xFF0372ff);
  static const Color secondaryColor = Color(0xFF2367b1);
  static const Color tertiareColor = Color(0xFF79c2be);
  static const Color accent1 = Color(0xFFffca08);
  static const Color accent2 = Color(0xFFec781d);
  static const Color alert = Color(0xFFe63946);
  static const Color successColor = Color.fromARGB(0, 12, 241, 62); */

  // Enhanced Light Color Scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    // Primary colors
    primary: Color(0xFF0062D6), // Slightly deeper blue for better contrast
    primaryContainer: Color(0xFFD6E3FF), // Container variant
    onPrimary: Color(0xFFFFFFFF),
    onPrimaryContainer: Color(0xFF001C3C),

    // Secondary colors
    secondary: Color(0xFF1A5BB1), // More vibrant than original
    secondaryContainer: Color(0xFFD6E3FF), // Matches Material 3 standards
    onSecondary: Color(0xFFFFFFFF),
    onSecondaryContainer: Color(0xFF001C3C),

    // Tertiary colors
    tertiary: Color(0xFF2D6D6B), // Better contrast ratio
    tertiaryContainer: Color(0xFFB0E8E6),
    onTertiary: Color(0xFFFFFFFF),
    onTertiaryContainer: Color(0xFF00201F),

    // Error/success colors
    error: Color(0xFFBA1B1B), // Standard error color
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410003),

    // Surface/background colors
    surface: Color(0xFFF8FAFD), // Slightly cooler white
    onSurface: Color(0xFF1A1C1E),
    surfaceVariant: Color(0xFFE0E2EC),
    onSurfaceVariant: Color(0xFF43474E),

    // Container colors
    surfaceDim: Color(0xFFD8DADD),
    surfaceBright: Color(0xFFF8FAFD),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF2F4F8),
    surfaceContainer: Color(0xFFECEEF2),
    surfaceContainerHigh: Color(0xFFE6E8EC),
    surfaceContainerHighest: Color(0xFFE0E2E6),

    // Other colors
    outline: Color(0xFF74777F),
    outlineVariant: Color(0xFFC4C6D0),
    shadow: Color(0x42000000), // 26% opacity black
    scrim: Color(0x7F000000), // 50% opacity black
    inverseSurface: Color(0xFF2E3033),
    onInverseSurface: Color(0xFFF1F0F4),
  );

  // Enhanced Dark Color Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    // Primary colors
    primary: Color.fromARGB(255, 49, 118, 203), // Brighter for dark mode
    primaryContainer: Color(0xFF004A9F), // Darker container
    onPrimary: Color.fromARGB(255, 236, 237, 238),
    onPrimaryContainer: Color(0xFFD6E3FF),

    // Secondary colors
    secondary: Color(0xFFA7C8FF), // Matches primary in dark mode
    secondaryContainer: Color(0xFF004A9F),
    onSecondary: Color(0xFF003063),
    onSecondaryContainer: Color(0xFFD6E3FF),

    // Tertiary colors
    tertiary: Color(0xFFB0E8E6), // Brighter for dark mode
    tertiaryContainer: Color(0xFF004F4E),
    onTertiary: Color(0xFF003736),
    onTertiaryContainer: Color(0xFFB0E8E6),

    // Error/success colors
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000B),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),

    // Surface/background colors
    surface: Color(0xFF15191e), // True dark surface
    onSurface: Color(0xFFE2E2E6),
    surfaceVariant: Color(0xFF43474E),
    onSurfaceVariant: Color(0xFFC4C6D0),

    // Container colors
    surfaceDim: Color(0xFF121416),
    surfaceBright: Color(0xFF383A3F),
    surfaceContainerLowest: Color(0xFF0D0E11),
    surfaceContainerLow: Color(0xFF1A1C1E),
    surfaceContainer: Color(0xFF1E2023),
    surfaceContainerHigh: Color(0xFF292A2D),
    surfaceContainerHighest: Color(0xFF333538),

    // Other colors
    outline: Color(0xFF8E9099),
    outlineVariant: Color(0xFF43474E),
    shadow: Color(0x42000000),
    scrim: Color(0x7F000000),
    inverseSurface: Color(0xFFE2E2E6),
    onInverseSurface: Color(0xFF2E3033),
  );

  // Text Theme
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16.0),
    bodyMedium: TextStyle(fontSize: 14.0),
    bodySmall: TextStyle(fontSize: 12.0, color: Colors.grey),
  );

  // Button Theme
  static const ButtonThemeData buttonTheme = ButtonThemeData(
    buttonColor: Color(0xFF0372FF),
    textTheme: ButtonTextTheme.primary,
  );

  // Icon Theme
  static const IconThemeData iconTheme = IconThemeData(
    color: Color(0xFF0372FF),
  );
}
