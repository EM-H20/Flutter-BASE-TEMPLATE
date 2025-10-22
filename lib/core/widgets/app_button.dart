import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';
import '../theme/app_radius.dart';

/// 공통 버튼 위젯 (디자인 시스템 토큰 사용)
/// 로딩 상태, 비활성화, 아이콘 지원
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.width,
  });

  final VoidCallback? onPressed;
  final String text;
  final AppButtonType type;
  final AppButtonSize size;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final isEnabled = !isDisabled && !isLoading && onPressed != null;

    return SizedBox(
      width: width,
      height: _getHeight(),
      child: _buildButton(context, isEnabled),
    );
  }

  Widget _buildButton(BuildContext context, bool isEnabled) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (type) {
      case AppButtonType.primary:
        return ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            disabledBackgroundColor: colorScheme.onSurface.withValues(
              alpha: 0.12,
            ),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: _getBorderRadius()),
            padding: _getPadding(),
          ),
          child: _buildContent(context),
        );

      case AppButtonType.secondary:
        return OutlinedButton(
          onPressed: isEnabled ? onPressed : null,
          style: OutlinedButton.styleFrom(
            foregroundColor: colorScheme.primary,
            backgroundColor: Colors.transparent,
            disabledForegroundColor: colorScheme.onSurface.withValues(
              alpha: 0.38,
            ),
            side: BorderSide(
              color: isEnabled ? colorScheme.primary : colorScheme.outline,
              width: 1,
            ),
            shape: RoundedRectangleBorder(borderRadius: _getBorderRadius()),
            padding: _getPadding(),
          ),
          child: _buildContent(context),
        );

      case AppButtonType.text:
        return TextButton(
          onPressed: isEnabled ? onPressed : null,
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.primary,
            backgroundColor: Colors.transparent,
            disabledForegroundColor: colorScheme.onSurface.withValues(
              alpha: 0.38,
            ),
            padding: _getPadding(),
          ),
          child: _buildContent(context),
        );

      case AppButtonType.danger:
        return ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.error,
            foregroundColor: colorScheme.onError,
            disabledBackgroundColor: colorScheme.onSurface.withValues(
              alpha: 0.12,
            ),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: _getBorderRadius()),
            padding: _getPadding(),
          ),
          child: _buildContent(context),
        );
    }
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      final colorScheme = Theme.of(context).colorScheme;
      return SizedBox(
        width: _getLoadingSize(),
        height: _getLoadingSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            type == AppButtonType.text || type == AppButtonType.secondary
                ? colorScheme.primary
                : colorScheme.onPrimary,
          ),
        ),
      );
    }

    // 버튼의 기본 텍스트 스타일 정의 (foregroundColor를 상속받도록 color 제외)
    final textStyle = TextStyle(
      fontFamily: 'Pretendard',
      fontSize: _getFontSize(),
      fontWeight: FontWeight.w500,
      height: 1.4,
      letterSpacing: _getLetterSpacing(),
    );

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: _getIconSize()),
          AppSpacing.horizontalSM(),
          Text(text, style: textStyle),
        ],
      );
    }

    return Text(text, style: textStyle);
  }

  /// 버튼 높이
  double _getHeight() {
    switch (size) {
      case AppButtonSize.small:
        return 36;
      case AppButtonSize.medium:
        return 44;
      case AppButtonSize.large:
        return 52;
    }
  }

  /// Border Radius (디자인 토큰 사용)
  BorderRadius _getBorderRadius() {
    return AppRadius.button;
  }

  /// 패딩 (디자인 토큰 사용)
  EdgeInsets _getPadding() {
    switch (size) {
      case AppButtonSize.small:
        return AppSpacing.buttonPaddingSmall;
      case AppButtonSize.medium:
        return AppSpacing.buttonPadding;
      case AppButtonSize.large:
        return AppSpacing.buttonPaddingLarge;
    }
  }

  /// 폰트 크기 (사이즈별)
  double _getFontSize() {
    switch (size) {
      case AppButtonSize.small:
        return 11;
      case AppButtonSize.medium:
        return 12;
      case AppButtonSize.large:
        return 14;
    }
  }

  /// Letter Spacing (사이즈별)
  double _getLetterSpacing() {
    switch (size) {
      case AppButtonSize.small:
      case AppButtonSize.medium:
        return 0.5;
      case AppButtonSize.large:
        return 0.1;
    }
  }

  /// 아이콘 크기
  double _getIconSize() {
    switch (size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 18;
      case AppButtonSize.large:
        return 20;
    }
  }

  /// 로딩 인디케이터 크기
  double _getLoadingSize() {
    switch (size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 18;
      case AppButtonSize.large:
        return 20;
    }
  }
}

/// 버튼 타입
enum AppButtonType { primary, secondary, text, danger }

/// 버튼 크기
enum AppButtonSize { small, medium, large }
