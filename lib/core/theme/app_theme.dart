import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';
import 'app_radius.dart';

/// 앱 전체 테마 설정
/// 모든 디자인 토큰을 통합하여 Flutter ThemeData를 생성합니다
class AppTheme {
  AppTheme._();

  // ============================================
  // Light Theme
  // ============================================

  static ThemeData get lightTheme {
    // Light 모드 활성화
    AppColors.setDarkMode(false);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Pretendard',

      // ===== Color Scheme =====
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        onSurfaceVariant: AppColors.textSecondary,
        outline: AppColors.border,
        surfaceContainerHighest: AppColors.surface,
        error: AppColors.error,
        onError: Colors.white,
      ),

      // ===== Scaffold =====
      scaffoldBackgroundColor: AppColors.background,

      // ===== AppBar =====
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyle.titleLarge,
      ),

      // ===== Card =====
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.card,
          side: BorderSide(color: AppColors.border, width: 1),
        ),
      ),

      // ===== Elevated Button =====
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.button,
          ),
          textStyle: AppTextStyle.labelLarge,
        ),
      ),

      // ===== Outlined Button =====
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.button,
          ),
          textStyle: AppTextStyle.labelLarge,
        ),
      ),

      // ===== Text Button =====
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyle.labelLarge,
        ),
      ),

      // ===== Input Field =====
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(color: AppColors.error),
        ),
        labelStyle: AppTextStyle.bodyMedium,
        hintStyle: AppTextStyle.bodyMedium.copyWith(
          color: AppColors.textTertiary,
        ),
        errorStyle: AppTextStyle.error,
      ),

      // ===== Divider =====
      dividerTheme: DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),

      // ===== Dialog =====
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.dialog,
        ),
        titleTextStyle: AppTextStyle.headlineMedium,
        contentTextStyle: AppTextStyle.bodyMedium,
      ),

      // ===== Bottom Sheet =====
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.bottomSheet,
        ),
      ),

      // ===== Chip =====
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.secondaryContainer,
        labelStyle: AppTextStyle.labelSmall,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.badge,
        ),
      ),

      // ===== Text Theme =====
      textTheme: TextTheme(
        displayLarge: AppTextStyle.displayLarge,
        displayMedium: AppTextStyle.displayMedium,
        displaySmall: AppTextStyle.displaySmall,
        headlineLarge: AppTextStyle.headlineLarge,
        headlineMedium: AppTextStyle.headlineMedium,
        headlineSmall: AppTextStyle.headlineSmall,
        titleLarge: AppTextStyle.titleLarge,
        titleMedium: AppTextStyle.titleMedium,
        titleSmall: AppTextStyle.titleSmall,
        bodyLarge: AppTextStyle.bodyLarge,
        bodyMedium: AppTextStyle.bodyMedium,
        bodySmall: AppTextStyle.bodySmall,
        labelLarge: AppTextStyle.labelLarge,
        labelMedium: AppTextStyle.labelMedium,
        labelSmall: AppTextStyle.labelSmall,
      ),
    );
  }

  // ============================================
  // Dark Theme
  // ============================================

  static ThemeData get darkTheme {
    // Dark 모드 활성화
    AppColors.setDarkMode(true);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Pretendard',

      // ===== Color Scheme =====
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        onSurfaceVariant: AppColors.textSecondary,
        outline: AppColors.border,
        surfaceContainerHighest: AppColors.surface,
        error: AppColors.error,
        onError: Colors.white,
      ),

      // ===== Scaffold =====
      scaffoldBackgroundColor: AppColors.background,

      // ===== AppBar =====
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyle.titleLarge,
      ),

      // ===== Card =====
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.card,
          side: BorderSide(color: AppColors.border, width: 1),
        ),
      ),

      // ===== Elevated Button =====
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.button,
          ),
          textStyle: AppTextStyle.labelLarge,
        ),
      ),

      // ===== Outlined Button =====
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.button,
          ),
          textStyle: AppTextStyle.labelLarge,
        ),
      ),

      // ===== Text Button =====
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyle.labelLarge,
        ),
      ),

      // ===== Input Field =====
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: BorderSide(color: AppColors.error),
        ),
        labelStyle: AppTextStyle.bodyMedium,
        hintStyle: AppTextStyle.bodyMedium.copyWith(
          color: AppColors.textTertiary,
        ),
        errorStyle: AppTextStyle.error,
      ),

      // ===== Divider =====
      dividerTheme: DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),

      // ===== Dialog =====
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.dialog,
        ),
        titleTextStyle: AppTextStyle.headlineMedium,
        contentTextStyle: AppTextStyle.bodyMedium,
      ),

      // ===== Bottom Sheet =====
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.bottomSheet,
        ),
      ),

      // ===== Chip =====
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.secondaryContainer,
        labelStyle: AppTextStyle.labelSmall,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.badge,
        ),
      ),

      // ===== Text Theme =====
      textTheme: TextTheme(
        displayLarge: AppTextStyle.displayLarge,
        displayMedium: AppTextStyle.displayMedium,
        displaySmall: AppTextStyle.displaySmall,
        headlineLarge: AppTextStyle.headlineLarge,
        headlineMedium: AppTextStyle.headlineMedium,
        headlineSmall: AppTextStyle.headlineSmall,
        titleLarge: AppTextStyle.titleLarge,
        titleMedium: AppTextStyle.titleMedium,
        titleSmall: AppTextStyle.titleSmall,
        bodyLarge: AppTextStyle.bodyLarge,
        bodyMedium: AppTextStyle.bodyMedium,
        bodySmall: AppTextStyle.bodySmall,
        labelLarge: AppTextStyle.labelLarge,
        labelMedium: AppTextStyle.labelMedium,
        labelSmall: AppTextStyle.labelSmall,
      ),
    );
  }
}
