import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

/// 앱 전체에서 사용하는 Typography 시스템
/// Material Design 3 스타일을 따르며, Pretendard 폰트를 사용합니다
/// ScreenUtil을 사용하여 반응형 폰트 크기를 제공합니다
class AppTextStyle {
  AppTextStyle._();

  /// 기본 폰트 패밀리
  static const String _fontFamily = 'Pretendard';

  // ============================================
  // Display Styles (큰 제목 - 화면 제목, 히어로 텍스트)
  // ============================================

  /// Display Large - 57px (Bold, 반응형)
  /// 사용: 랜딩 페이지, 히어로 섹션
  static TextStyle get displayLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 57.sp,
        fontWeight: FontWeight.w700, // Bold
        height: 1.2,
        letterSpacing: -0.25.sp,
        color: AppColors.textPrimary,
      );

  /// Display Medium - 45px (Bold, 반응형)
  /// 사용: 주요 화면 타이틀
  static TextStyle get displayMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 45.sp,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: AppColors.textPrimary,
      );

  /// Display Small - 36px (SemiBold, 반응형)
  /// 사용: 섹션 대제목
  static TextStyle get displaySmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 36.sp,
        fontWeight: FontWeight.w600, // SemiBold
        height: 1.3,
        color: AppColors.textPrimary,
      );

  // ============================================
  // Headline Styles (헤드라인 - 주요 콘텐츠 제목)
  // ============================================

  /// Headline Large - 32px (SemiBold, 반응형)
  /// 사용: 페이지 메인 제목
  static TextStyle get headlineLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: AppColors.textPrimary,
      );

  /// Headline Medium - 28px (SemiBold, 반응형)
  /// 사용: 카드 제목, 다이얼로그 제목
  static TextStyle get headlineMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: AppColors.textPrimary,
      );

  /// Headline Small - 24px (SemiBold, 반응형)
  /// 사용: 섹션 제목
  static TextStyle get headlineSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: AppColors.textPrimary,
      );

  // ============================================
  // Title Styles (타이틀 - 컴포넌트 제목)
  // ============================================

  /// Title Large - 22px (Medium, 반응형)
  /// 사용: 앱바 타이틀, 리스트 헤더
  static TextStyle get titleLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22.sp,
        fontWeight: FontWeight.w500, // Medium
        height: 1.5,
        color: AppColors.textPrimary,
      );

  /// Title Medium - 16px (Medium, 반응형)
  /// 사용: 카드 타이틀, 리스트 아이템 제목
  static TextStyle get titleMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        height: 1.5,
        letterSpacing: 0.15.sp,
        color: AppColors.textPrimary,
      );

  /// Title Small - 14px (Medium, 반응형)
  /// 사용: 작은 카드 타이틀, 서브 헤더
  static TextStyle get titleSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 1.5,
        letterSpacing: 0.1.sp,
        color: AppColors.textPrimary,
      );

  // ============================================
  // Body Styles (본문 텍스트)
  // ============================================

  /// Body Large - 16px (Regular, 반응형)
  /// 사용: 주요 본문 텍스트
  static TextStyle get bodyLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400, // Regular
        height: 1.6,
        letterSpacing: 0.5.sp,
        color: AppColors.textPrimary,
      );

  /// Body Medium - 14px (Regular, 반응형)
  /// 사용: 기본 본문 텍스트
  static TextStyle get bodyMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0.25.sp,
        color: AppColors.textPrimary,
      );

  /// Body Small - 12px (Regular, 반응형)
  /// 사용: 보조 본문, 설명 텍스트
  static TextStyle get bodySmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.4.sp,
        color: AppColors.textSecondary,
      );

  // ============================================
  // Label Styles (라벨 - 버튼, 탭, 태그)
  // ============================================

  /// Label Large - 14px (Medium, 반응형)
  /// 사용: 큰 버튼 텍스트
  static TextStyle get labelLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.1.sp,
        color: AppColors.textPrimary,
      );

  /// Label Medium - 12px (Medium, 반응형)
  /// 사용: 일반 버튼, 탭 텍스트
  static TextStyle get labelMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.5.sp,
        color: AppColors.textPrimary,
      );

  /// Label Small - 11px (Medium, 반응형)
  /// 사용: 작은 버튼, 태그, 배지
  static TextStyle get labelSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.5.sp,
        color: AppColors.textPrimary,
      );

  // ============================================
  // Semantic Text Styles (용도별 특수 스타일)
  // ============================================

  /// 캡션 텍스트 (작은 설명, 메타 정보, 반응형)
  static TextStyle get caption => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColors.textSecondary,
      );

  /// Overline 텍스트 (상단 라벨, 카테고리, 반응형)
  static TextStyle get overline => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        height: 1.6,
        letterSpacing: 1.5.sp,
        color: AppColors.textTertiary,
      );

  /// 링크 텍스트 (반응형)
  static TextStyle get link => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 1.5,
        decoration: TextDecoration.underline,
        color: AppColors.primary,
      );

  /// 에러 메시지 텍스트 (반응형)
  static TextStyle get error => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColors.error,
      );

  /// 성공 메시지 텍스트 (반응형)
  static TextStyle get success => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColors.success,
      );

  /// 경고 메시지 텍스트 (반응형)
  static TextStyle get warning => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColors.warning,
      );

  // ============================================
  // Weight Variants (굵기 변형)
  // ============================================

  /// Thin (100)
  static FontWeight get thin => FontWeight.w100;

  /// ExtraLight (200)
  static FontWeight get extraLight => FontWeight.w200;

  /// Light (300)
  static FontWeight get light => FontWeight.w300;

  /// Regular (400)
  static FontWeight get regular => FontWeight.w400;

  /// Medium (500)
  static FontWeight get medium => FontWeight.w500;

  /// SemiBold (600)
  static FontWeight get semiBold => FontWeight.w600;

  /// Bold (700)
  static FontWeight get bold => FontWeight.w700;

  /// ExtraBold (800)
  static FontWeight get extraBold => FontWeight.w800;

  /// Black (900)
  static FontWeight get black => FontWeight.w900;
}
