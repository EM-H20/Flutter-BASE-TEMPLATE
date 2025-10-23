import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 앱 전체에서 사용하는 간격(Spacing) 토큰 시스템
/// Tailwind CSS 스타일의 간격 체계를 따릅니다 (4px 기준)
/// ScreenUtil을 사용하여 반응형 간격을 제공합니다
class AppSpacing {
  AppSpacing._();

  // ============================================
  // 기본 간격 토큰 (Tailwind-style) - 반응형
  // ============================================

  /// 4px - 최소 간격 (반응형)
  static double get xs => 4.w;

  /// 8px - 작은 간격 (아이템 간 최소 여백, 반응형)
  static double get sm => 8.w;

  /// 16px - 중간 간격 (기본 여백, 반응형)
  static double get md => 16.w;

  /// 24px - 큰 간격 (섹션 간 여백, 반응형)
  static double get lg => 24.w;

  /// 32px - 아주 큰 간격 (반응형)
  static double get xl => 32.w;

  /// 48px - 매우 큰 간격 (반응형)
  static double get xxl => 48.w;

  /// 64px - 초대형 간격 (반응형)
  static double get xxxl => 64.w;

  // ============================================
  // Semantic 간격 (용도별 권장 간격) - 반응형
  // ============================================

  /// 화면 전체의 기본 패딩 (16px, 반응형)
  static double get screenPadding => md;

  /// 화면 가로 패딩 (16px, 반응형)
  static double get screenHorizontal => md;

  /// 화면 세로 패딩 (16px, 반응형)
  static double get screenVertical => md;

  /// 카드 내부 패딩 (16px, 반응형)
  static double get cardPadding => md;

  /// 리스트 아이템 간 간격 (8px, 반응형)
  static double get listItemSpacing => sm;

  /// 섹션 간 간격 (24px, 반응형)
  static double get sectionSpacing => lg;

  /// 버튼 내부 패딩 (가로: 16px, 세로: 12px, 반응형)
  static EdgeInsets get buttonPadding => EdgeInsets.symmetric(
    horizontal: md,
    vertical: 12.h,
  );

  /// 작은 버튼 내부 패딩 (가로: 12px, 세로: 8px, 반응형)
  static EdgeInsets get buttonPaddingSmall => EdgeInsets.symmetric(
    horizontal: 12.w,
    vertical: sm,
  );

  /// 큰 버튼 내부 패딩 (가로: 24px, 세로: 16px, 반응형)
  static EdgeInsets get buttonPaddingLarge => EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  /// Input Field 내부 패딩 (가로: 16px, 세로: 12px, 반응형)
  static EdgeInsets get inputPadding => EdgeInsets.symmetric(
    horizontal: md,
    vertical: 12.h,
  );

  /// 다이얼로그 패딩 (24px, 반응형)
  static EdgeInsets get dialogPadding => EdgeInsets.all(lg);

  /// Bottom Sheet 패딩 (24px, 반응형)
  static EdgeInsets get bottomSheetPadding => EdgeInsets.all(lg);

  // ============================================
  // EdgeInsets 헬퍼 (자주 사용하는 패턴) - 반응형
  // ============================================

  /// 모든 방향에 동일한 간격 적용 (반응형)
  static EdgeInsets all(double value) => EdgeInsets.all(value.w);

  /// 가로/세로 간격 적용 (반응형)
  static EdgeInsets symmetric({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      EdgeInsets.symmetric(
        horizontal: horizontal.w,
        vertical: vertical.h,
      );

  /// 개별 방향 간격 적용 (반응형)
  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: left.w,
        top: top.h,
        right: right.w,
        bottom: bottom.h,
      );

  // ============================================
  // SizedBox 헬퍼 (간격 위젯) - 반응형
  // ============================================

  /// 수평 간격 위젯 (반응형)
  static SizedBox horizontalXS() => SizedBox(width: xs);
  static SizedBox horizontalSM() => SizedBox(width: sm);
  static SizedBox horizontalMD() => SizedBox(width: md);
  static SizedBox horizontalLG() => SizedBox(width: lg);
  static SizedBox horizontalXL() => SizedBox(width: xl);
  static SizedBox horizontalXXL() => SizedBox(width: xxl);

  /// 수직 간격 위젯 (반응형)
  static SizedBox verticalXS() => SizedBox(height: xs);
  static SizedBox verticalSM() => SizedBox(height: sm);
  static SizedBox verticalMD() => SizedBox(height: md);
  static SizedBox verticalLG() => SizedBox(height: lg);
  static SizedBox verticalXL() => SizedBox(height: xl);
  static SizedBox verticalXXL() => SizedBox(height: xxl);

  /// 커스텀 수평 간격 (반응형)
  static SizedBox horizontalCustom(double width) => SizedBox(width: width.w);

  /// 커스텀 수직 간격 (반응형)
  static SizedBox verticalCustom(double height) => SizedBox(height: height.h);
}
