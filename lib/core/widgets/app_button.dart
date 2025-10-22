import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_radius.dart';
import '../theme/app_text_style.dart';

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
    switch (type) {
      case AppButtonType.primary:
        return ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.onPrimary,
            disabledBackgroundColor: AppColors.textDisabled,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius(),
            ),
            padding: _getPadding(),
          ),
          child: _buildContent(context),
        );

      case AppButtonType.secondary:
        return OutlinedButton(
          onPressed: isEnabled ? onPressed : null,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            disabledForegroundColor: AppColors.textDisabled,
            side: BorderSide(
              color: isEnabled ? AppColors.primary : AppColors.border,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius(),
            ),
            padding: _getPadding(),
          ),
          child: _buildContent(context),
        );

      case AppButtonType.text:
        return TextButton(
          onPressed: isEnabled ? onPressed : null,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            disabledForegroundColor: AppColors.textDisabled,
            padding: _getPadding(),
          ),
          child: _buildContent(context),
        );

      case AppButtonType.danger:
        return ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error,
            foregroundColor: Colors.white,
            disabledBackgroundColor: AppColors.textDisabled,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius(),
            ),
            padding: _getPadding(),
          ),
          child: _buildContent(context),
        );
    }
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: _getLoadingSize(),
        height: _getLoadingSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            type == AppButtonType.text || type == AppButtonType.secondary
                ? AppColors.primary
                : AppColors.onPrimary,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: _getIconSize()),
          AppSpacing.horizontalSM(),
          Text(text, style: _getTextStyle(context)),
        ],
      );
    }

    return Text(text, style: _getTextStyle(context));
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

  /// 텍스트 스타일 (디자인 토큰 사용)
  TextStyle _getTextStyle(BuildContext context) {
    switch (size) {
      case AppButtonSize.small:
        return AppTextStyle.labelSmall;
      case AppButtonSize.medium:
        return AppTextStyle.labelMedium;
      case AppButtonSize.large:
        return AppTextStyle.labelLarge;
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
enum AppButtonType {
  primary,
  secondary,
  text,
  danger,
}

/// 버튼 크기
enum AppButtonSize {
  small,
  medium,
  large,
}
