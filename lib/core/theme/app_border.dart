import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 앱 전체에서 사용하는 Border Width 토큰 시스템
/// 일관된 테두리 두께를 제공합니다
/// ScreenUtil을 사용하여 반응형 border width를 제공합니다
class AppBorder {
  AppBorder._();

  // ============================================
  // 기본 Border Width 값 - 반응형
  // ============================================

  /// 0px - 테두리 없음 (반응형)
  static double get none => 0.w;

  /// 1px - 얇은 테두리 (기본 테두리, 반응형)
  static double get thin => 1.w;

  /// 2px - 두꺼운 테두리 (강조 테두리, 반응형)
  static double get thick => 2.w;

  /// 3px - 매우 두꺼운 테두리 (반응형)
  static double get extraThick => 3.w;

  /// 4px - 초두꺼운 테두리 (반응형)
  static double get ultraThick => 4.w;

  // ============================================
  // Semantic Border Width (컴포넌트별 권장) - 반응형
  // ============================================

  /// 기본 테두리 (1px, 반응형)
  static double get defaultWidth => thin;

  /// 버튼 테두리 (1px, 반응형)
  static double get button => thin;

  /// 카드 테두리 (1px, 반응형)
  static double get card => thin;

  /// 입력 필드 기본 테두리 (1px, 반응형)
  static double get input => thin;

  /// 입력 필드 포커스 테두리 (2px, 반응형)
  static double get inputFocused => thick;

  /// Divider 두께 (1px, 반응형)
  static double get divider => thin;

  /// CircularProgressIndicator stroke width (2px, 반응형)
  static double get progressIndicator => thick;

  // ============================================
  // BorderSide 헬퍼 - 반응형
  // ============================================

  /// 얇은 테두리 BorderSide 생성 (1px, 반응형)
  static BorderSide thinSide({required Color color}) => BorderSide(
        color: color,
        width: thin,
      );

  /// 두꺼운 테두리 BorderSide 생성 (2px, 반응형)
  static BorderSide thickSide({required Color color}) => BorderSide(
        color: color,
        width: thick,
      );

  /// 기본 테두리 BorderSide 생성 (1px, 반응형)
  static BorderSide defaultSide({required Color color}) => BorderSide(
        color: color,
        width: defaultWidth,
      );
}
