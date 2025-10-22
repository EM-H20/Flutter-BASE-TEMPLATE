import 'package:flutter/material.dart';

/// 앱 전체에서 사용하는 Border Radius 토큰 시스템
/// 일관된 모서리 둥글기를 제공합니다
class AppRadius {
  AppRadius._();

  // ============================================
  // 기본 Radius 값
  // ============================================

  /// 0px - 둥글지 않음 (직각)
  static const double none = 0.0;

  /// 4px - 최소 둥글기
  static const double xs = 4.0;

  /// 8px - 작은 둥글기 (버튼, 태그)
  static const double sm = 8.0;

  /// 12px - 중간 둥글기 (카드, 입력 필드)
  static const double md = 12.0;

  /// 16px - 큰 둥글기 (다이얼로그, 바텀시트)
  static const double lg = 16.0;

  /// 24px - 아주 큰 둥글기
  static const double xl = 24.0;

  /// 999px - 완전한 원형 (pill 형태)
  static const double full = 999.0;

  // ============================================
  // BorderRadius 헬퍼
  // ============================================

  /// 모든 모서리에 동일한 radius 적용
  static BorderRadius circular(double radius) => BorderRadius.circular(radius);

  /// 모든 모서리에 XS radius (4px)
  static BorderRadius get allXS => BorderRadius.circular(xs);

  /// 모든 모서리에 SM radius (8px)
  static BorderRadius get allSM => BorderRadius.circular(sm);

  /// 모든 모서리에 MD radius (12px)
  static BorderRadius get allMD => BorderRadius.circular(md);

  /// 모든 모서리에 LG radius (16px)
  static BorderRadius get allLG => BorderRadius.circular(lg);

  /// 모든 모서리에 XL radius (24px)
  static BorderRadius get allXL => BorderRadius.circular(xl);

  /// 완전한 원형 (pill)
  static BorderRadius get allFull => BorderRadius.circular(full);

  // ============================================
  // 특정 모서리만 적용
  // ============================================

  /// 위쪽 모서리만 둥글게 (바텀시트 상단)
  static BorderRadius topSM() => const BorderRadius.only(
        topLeft: Radius.circular(sm),
        topRight: Radius.circular(sm),
      );

  static BorderRadius topMD() => const BorderRadius.only(
        topLeft: Radius.circular(md),
        topRight: Radius.circular(md),
      );

  static BorderRadius topLG() => const BorderRadius.only(
        topLeft: Radius.circular(lg),
        topRight: Radius.circular(lg),
      );

  static BorderRadius topXL() => const BorderRadius.only(
        topLeft: Radius.circular(xl),
        topRight: Radius.circular(xl),
      );

  /// 아래쪽 모서리만 둥글게
  static BorderRadius bottomSM() => const BorderRadius.only(
        bottomLeft: Radius.circular(sm),
        bottomRight: Radius.circular(sm),
      );

  static BorderRadius bottomMD() => const BorderRadius.only(
        bottomLeft: Radius.circular(md),
        bottomRight: Radius.circular(md),
      );

  static BorderRadius bottomLG() => const BorderRadius.only(
        bottomLeft: Radius.circular(lg),
        bottomRight: Radius.circular(lg),
      );

  static BorderRadius bottomXL() => const BorderRadius.only(
        bottomLeft: Radius.circular(xl),
        bottomRight: Radius.circular(xl),
      );

  /// 왼쪽 모서리만 둥글게
  static BorderRadius leftSM() => const BorderRadius.only(
        topLeft: Radius.circular(sm),
        bottomLeft: Radius.circular(sm),
      );

  static BorderRadius leftMD() => const BorderRadius.only(
        topLeft: Radius.circular(md),
        bottomLeft: Radius.circular(md),
      );

  static BorderRadius leftLG() => const BorderRadius.only(
        topLeft: Radius.circular(lg),
        bottomLeft: Radius.circular(lg),
      );

  /// 오른쪽 모서리만 둥글게
  static BorderRadius rightSM() => const BorderRadius.only(
        topRight: Radius.circular(sm),
        bottomRight: Radius.circular(sm),
      );

  static BorderRadius rightMD() => const BorderRadius.only(
        topRight: Radius.circular(md),
        bottomRight: Radius.circular(md),
      );

  static BorderRadius rightLG() => const BorderRadius.only(
        topRight: Radius.circular(lg),
        bottomRight: Radius.circular(lg),
      );

  // ============================================
  // Semantic Radius (컴포넌트별 권장)
  // ============================================

  /// 버튼 기본 radius (8px)
  static BorderRadius get button => allSM;

  /// 카드 기본 radius (12px)
  static BorderRadius get card => allMD;

  /// 입력 필드 기본 radius (8px)
  static BorderRadius get input => allSM;

  /// 다이얼로그 기본 radius (16px)
  static BorderRadius get dialog => allLG;

  /// 바텀시트 기본 radius (위쪽만 16px)
  static BorderRadius get bottomSheet => topLG();

  /// 이미지/아바타 기본 radius (8px)
  static BorderRadius get image => allSM;

  /// 태그/배지 기본 radius (완전 원형)
  static BorderRadius get badge => allFull;
}
