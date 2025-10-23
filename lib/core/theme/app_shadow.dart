import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 앱 전체에서 사용하는 Shadow 토큰 시스템
/// 일관된 그림자 효과를 제공합니다 (Elevation 기반)
/// ScreenUtil을 사용하여 반응형 shadow를 제공합니다
class AppShadow {
  AppShadow._();

  // ============================================
  // Shadow 레벨별 정의 (Material Design 3 기반)
  // ============================================

  /// Level 0 - 그림자 없음
  static List<BoxShadow> get none => [];

  /// Level 1 - 미세한 그림자 (카드, 버튼, 반응형)
  /// Elevation: 1-2dp
  static List<BoxShadow> get sm => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 2.r,
          offset: Offset(0, 1.h),
        ),
      ];

  /// Level 2 - 일반 그림자 (드롭다운, 툴팁, 반응형)
  /// Elevation: 4-6dp
  static List<BoxShadow> get md => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 4.r,
          offset: Offset(0, 2.h),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 8.r,
          offset: Offset(0, 4.h),
        ),
      ];

  /// Level 3 - 강한 그림자 (다이얼로그, 모달, 반응형)
  /// Elevation: 8-12dp
  static List<BoxShadow> get lg => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.10),
          blurRadius: 8.r,
          offset: Offset(0, 4.h),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 16.r,
          offset: Offset(0, 8.h),
        ),
      ];

  /// Level 4 - 매우 강한 그림자 (사이드 메뉴, 네비게이션, 반응형)
  /// Elevation: 16-24dp
  static List<BoxShadow> get xl => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.12),
          blurRadius: 16.r,
          offset: Offset(0, 8.h),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 24.r,
          offset: Offset(0, 12.h),
        ),
      ];

  /// Level 5 - 초강력 그림자 (플로팅 요소, 반응형)
  /// Elevation: 24dp+
  static List<BoxShadow> get xxl => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.15),
          blurRadius: 24.r,
          offset: Offset(0, 12.h),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.10),
          blurRadius: 32.r,
          offset: Offset(0, 16.h),
        ),
      ];

  // ============================================
  // 다크모드용 Shadow (더 진한 그림자)
  // ============================================

  /// 다크모드 - 작은 그림자 (반응형)
  static List<BoxShadow> get smDark => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.20),
          blurRadius: 2.r,
          offset: Offset(0, 1.h),
        ),
      ];

  /// 다크모드 - 일반 그림자 (반응형)
  static List<BoxShadow> get mdDark => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.30),
          blurRadius: 4.r,
          offset: Offset(0, 2.h),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.20),
          blurRadius: 8.r,
          offset: Offset(0, 4.h),
        ),
      ];

  /// 다크모드 - 강한 그림자 (반응형)
  static List<BoxShadow> get lgDark => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.40),
          blurRadius: 8.r,
          offset: Offset(0, 4.h),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.30),
          blurRadius: 16.r,
          offset: Offset(0, 8.h),
        ),
      ];

  // ============================================
  // Semantic Shadow (컴포넌트별 권장)
  // ============================================

  /// 카드 기본 그림자
  static List<BoxShadow> get card => sm;

  /// 버튼 기본 그림자
  static List<BoxShadow> get button => sm;

  /// 플로팅 액션 버튼 그림자
  static List<BoxShadow> get floatingButton => md;

  /// 드롭다운 메뉴 그림자
  static List<BoxShadow> get dropdown => md;

  /// 다이얼로그 그림자
  static List<BoxShadow> get dialog => lg;

  /// 바텀시트 그림자
  static List<BoxShadow> get bottomSheet => lg;

  /// 네비게이션 바 그림자
  static List<BoxShadow> get navigationBar => md;

  /// 앱바 그림자
  static List<BoxShadow> get appBar => sm;

  // ============================================
  // 특수 효과 Shadow
  // ============================================

  /// 내부 그림자 효과 (Inset Shadow - 가상 구현, 반응형)
  /// 실제 inset shadow는 Container의 inner decoration으로 구현 필요
  static List<BoxShadow> get inset => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 4.r,
          offset: Offset(0, 2.h),
          spreadRadius: -2.r,
        ),
      ];

  /// Glow 효과 (발광 효과, 반응형)
  static List<BoxShadow> glow(Color color) => [
        BoxShadow(
          color: color.withValues(alpha: 0.4),
          blurRadius: 12.r,
          spreadRadius: 2.r,
        ),
        BoxShadow(
          color: color.withValues(alpha: 0.2),
          blurRadius: 24.r,
          spreadRadius: 4.r,
        ),
      ];

  /// 색상 있는 그림자 (Colored Shadow, 반응형)
  static List<BoxShadow> colored(Color color) => [
        BoxShadow(
          color: color.withValues(alpha: 0.3),
          blurRadius: 8.r,
          offset: Offset(0, 4.h),
        ),
      ];
}
