import 'package:flutter/material.dart';

/// 앱 전체에서 사용하는 색상 토큰 시스템
/// Light/Dark 테마를 자동으로 지원하며, Semantic naming을 사용합니다
class AppColors {
  AppColors._();

  // ============================================
  // Light Theme Colors
  // ============================================

  // Primary Colors (브랜드 메인 컬러)
  static const Color _primaryLight = Color(0xFF2563EB); // Blue 600
  static const Color _primaryContainerLight = Color(0xFFDCEDFF);
  static const Color _onPrimaryLight = Color(0xFFFFFFFF);

  // Secondary Colors (보조 컬러)
  static const Color _secondaryLight = Color(0xFF64748B); // Slate 500
  static const Color _secondaryContainerLight = Color(0xFFF1F5F9);
  static const Color _onSecondaryLight = Color(0xFFFFFFFF);

  // Status Colors (상태 표시 컬러)
  static const Color _successLight = Color(0xFF10B981); // Green 500
  static const Color _errorLight = Color(0xFFEF4444); // Red 500
  static const Color _warningLight = Color(0xFFF59E0B); // Orange 500
  static const Color _infoLight = Color(0xFF06B6D4); // Cyan 500

  // Surface Colors (배경 및 표면)
  static const Color _backgroundLight = Color(0xFFFAFAFA);
  static const Color _surfaceLight = Color(0xFFFFFFFF);
  static const Color _cardLight = Color(0xFFFFFFFF);

  // Text Colors (텍스트)
  static const Color _textPrimaryLight = Color(0xFF0F172A); // Slate 900
  static const Color _textSecondaryLight = Color(0xFF475569); // Slate 600
  static const Color _textTertiaryLight = Color(0xFF94A3B8); // Slate 400
  static const Color _textDisabledLight = Color(0xFFCBD5E1); // Slate 300

  // Border & Divider (경계선 및 구분선)
  static const Color _borderLight = Color(0xFFE2E8F0); // Slate 200
  static const Color _dividerLight = Color(0xFFF1F5F9); // Slate 100

  // ============================================
  // Dark Theme Colors
  // ============================================

  // Primary Colors
  static const Color _primaryDark = Color(0xFF3B82F6); // Blue 500
  static const Color _primaryContainerDark = Color(0xFF1E3A8A);
  static const Color _onPrimaryDark = Color(0xFFFFFFFF);

  // Secondary Colors
  static const Color _secondaryDark = Color(0xFF94A3B8); // Slate 400
  static const Color _secondaryContainerDark = Color(0xFF334155);
  static const Color _onSecondaryDark = Color(0xFFFFFFFF);

  // Status Colors
  static const Color _successDark = Color(0xFF34D399); // Green 400
  static const Color _errorDark = Color(0xFFF87171); // Red 400
  static const Color _warningDark = Color(0xFFFBBF24); // Orange 400
  static const Color _infoDark = Color(0xFF22D3EE); // Cyan 400

  // Surface Colors
  static const Color _backgroundDark = Color(0xFF0F172A); // Slate 900
  static const Color _surfaceDark = Color(0xFF1E293B); // Slate 800
  static const Color _cardDark = Color(0xFF334155); // Slate 700

  // Text Colors
  static const Color _textPrimaryDark = Color(0xFFF8FAFC); // Slate 50
  static const Color _textSecondaryDark = Color(0xFFCBD5E1); // Slate 300
  static const Color _textTertiaryDark = Color(0xFF64748B); // Slate 500
  static const Color _textDisabledDark = Color(0xFF475569); // Slate 600

  // Border & Divider
  static const Color _borderDark = Color(0xFF334155); // Slate 700
  static const Color _dividerDark = Color(0xFF1E293B); // Slate 800

  // ============================================
  // Theme Mode 감지 (ThemeProvider에서 업데이트됨)
  // ============================================
  static bool _isDarkMode = false;

  /// 현재 다크모드 여부를 설정합니다
  static void setDarkMode(bool isDark) {
    _isDarkMode = isDark;
  }

  // ============================================
  // Public Getters (자동으로 Light/Dark 전환)
  // ============================================

  /// 브랜드 메인 컬러
  static Color get primary => _isDarkMode ? _primaryDark : _primaryLight;
  static Color get primaryContainer =>
      _isDarkMode ? _primaryContainerDark : _primaryContainerLight;
  static Color get onPrimary => _isDarkMode ? _onPrimaryDark : _onPrimaryLight;

  /// 보조 컬러
  static Color get secondary => _isDarkMode ? _secondaryDark : _secondaryLight;
  static Color get secondaryContainer =>
      _isDarkMode ? _secondaryContainerDark : _secondaryContainerLight;
  static Color get onSecondary =>
      _isDarkMode ? _onSecondaryDark : _onSecondaryLight;

  /// 상태 표시 컬러
  static Color get success => _isDarkMode ? _successDark : _successLight;
  static Color get error => _isDarkMode ? _errorDark : _errorLight;
  static Color get warning => _isDarkMode ? _warningDark : _warningLight;
  static Color get info => _isDarkMode ? _infoDark : _infoLight;

  /// 배경 및 표면 컬러
  static Color get background =>
      _isDarkMode ? _backgroundDark : _backgroundLight;
  static Color get surface => _isDarkMode ? _surfaceDark : _surfaceLight;
  static Color get card => _isDarkMode ? _cardDark : _cardLight;

  /// 텍스트 컬러
  static Color get textPrimary =>
      _isDarkMode ? _textPrimaryDark : _textPrimaryLight;
  static Color get textSecondary =>
      _isDarkMode ? _textSecondaryDark : _textSecondaryLight;
  static Color get textTertiary =>
      _isDarkMode ? _textTertiaryDark : _textTertiaryLight;
  static Color get textDisabled =>
      _isDarkMode ? _textDisabledDark : _textDisabledLight;

  /// 경계선 및 구분선
  static Color get border => _isDarkMode ? _borderDark : _borderLight;
  static Color get divider => _isDarkMode ? _dividerDark : _dividerLight;

  // ============================================
  // Status Color Variants (투명도 조절)
  // ============================================

  /// Success 컬러의 투명도 변형
  static Color get successLight => success.withValues(alpha: 0.1);
  static Color get successMedium => success.withValues(alpha: 0.3);

  /// Error 컬러의 투명도 변형
  static Color get errorLight => error.withValues(alpha: 0.1);
  static Color get errorMedium => error.withValues(alpha: 0.3);

  /// Warning 컬러의 투명도 변형
  static Color get warningLight => warning.withValues(alpha: 0.1);
  static Color get warningMedium => warning.withValues(alpha: 0.3);

  /// Info 컬러의 투명도 변형
  static Color get infoLight => info.withValues(alpha: 0.1);
  static Color get infoMedium => info.withValues(alpha: 0.3);
}
