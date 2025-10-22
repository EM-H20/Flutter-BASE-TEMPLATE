import 'package:flutter/material.dart';

/// 앱 전체에서 사용하는 간격(Spacing) 토큰 시스템
/// Tailwind CSS 스타일의 간격 체계를 따릅니다 (4px 기준)
class AppSpacing {
  AppSpacing._();

  // ============================================
  // 기본 간격 토큰 (Tailwind-style)
  // ============================================

  /// 4px - 최소 간격
  static const double xs = 4.0;

  /// 8px - 작은 간격 (아이템 간 최소 여백)
  static const double sm = 8.0;

  /// 16px - 중간 간격 (기본 여백)
  static const double md = 16.0;

  /// 24px - 큰 간격 (섹션 간 여백)
  static const double lg = 24.0;

  /// 32px - 아주 큰 간격
  static const double xl = 32.0;

  /// 48px - 매우 큰 간격
  static const double xxl = 48.0;

  /// 64px - 초대형 간격
  static const double xxxl = 64.0;

  // ============================================
  // Semantic 간격 (용도별 권장 간격)
  // ============================================

  /// 화면 전체의 기본 패딩 (16px)
  static const double screenPadding = md;

  /// 화면 가로 패딩 (16px)
  static const double screenHorizontal = md;

  /// 화면 세로 패딩 (16px)
  static const double screenVertical = md;

  /// 카드 내부 패딩 (16px)
  static const double cardPadding = md;

  /// 리스트 아이템 간 간격 (8px)
  static const double listItemSpacing = sm;

  /// 섹션 간 간격 (24px)
  static const double sectionSpacing = lg;

  /// 버튼 내부 패딩 (가로: 16px, 세로: 12px)
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: 12.0,
  );

  /// 작은 버튼 내부 패딩 (가로: 12px, 세로: 8px)
  static const EdgeInsets buttonPaddingSmall = EdgeInsets.symmetric(
    horizontal: 12.0,
    vertical: sm,
  );

  /// 큰 버튼 내부 패딩 (가로: 24px, 세로: 16px)
  static const EdgeInsets buttonPaddingLarge = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  /// Input Field 내부 패딩 (가로: 16px, 세로: 12px)
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: 12.0,
  );

  /// 다이얼로그 패딩 (24px)
  static const EdgeInsets dialogPadding = EdgeInsets.all(lg);

  /// Bottom Sheet 패딩 (24px)
  static const EdgeInsets bottomSheetPadding = EdgeInsets.all(lg);

  // ============================================
  // EdgeInsets 헬퍼 (자주 사용하는 패턴)
  // ============================================

  /// 모든 방향에 동일한 간격 적용
  static EdgeInsets all(double value) => EdgeInsets.all(value);

  /// 가로/세로 간격 적용
  static EdgeInsets symmetric({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      );

  /// 개별 방향 간격 적용
  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      );

  // ============================================
  // SizedBox 헬퍼 (간격 위젯)
  // ============================================

  /// 수평 간격 위젯
  static SizedBox horizontalXS() => const SizedBox(width: xs);
  static SizedBox horizontalSM() => const SizedBox(width: sm);
  static SizedBox horizontalMD() => const SizedBox(width: md);
  static SizedBox horizontalLG() => const SizedBox(width: lg);
  static SizedBox horizontalXL() => const SizedBox(width: xl);
  static SizedBox horizontalXXL() => const SizedBox(width: xxl);

  /// 수직 간격 위젯
  static SizedBox verticalXS() => const SizedBox(height: xs);
  static SizedBox verticalSM() => const SizedBox(height: sm);
  static SizedBox verticalMD() => const SizedBox(height: md);
  static SizedBox verticalLG() => const SizedBox(height: lg);
  static SizedBox verticalXL() => const SizedBox(height: xl);
  static SizedBox verticalXXL() => const SizedBox(height: xxl);

  /// 커스텀 수평 간격
  static SizedBox horizontalCustom(double width) => SizedBox(width: width);

  /// 커스텀 수직 간격
  static SizedBox verticalCustom(double height) => SizedBox(height: height);
}
