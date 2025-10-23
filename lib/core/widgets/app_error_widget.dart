import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_style.dart';
import 'app_button.dart';

/// 공통 에러 위젯 (디자인 시스템 토큰 사용)
/// 에러 메시지 표시 및 재시도 액션 지원
class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    required this.message,
    this.title = '오류가 발생했습니다',
    this.icon = Icons.error_outline,
    this.onRetry,
    this.retryText = '다시 시도',
  });

  final String title;
  final String message;
  final IconData icon;
  final VoidCallback? onRetry;
  final String retryText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64.w,
              color: AppColors.error,
            ),
            AppSpacing.verticalLG(),
            Text(
              title,
              style: AppTextStyle.headlineSmall.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.verticalSM(),
            Text(
              message,
              style: AppTextStyle.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              AppSpacing.verticalLG(),
              AppButton(
                onPressed: onRetry,
                text: retryText,
                type: AppButtonType.secondary,
                icon: Icons.refresh,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 네트워크 에러 위젯
class AppNetworkErrorWidget extends StatelessWidget {
  const AppNetworkErrorWidget({
    super.key,
    this.onRetry,
  });

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return AppErrorWidget(
      title: '네트워크 연결 오류',
      message: '인터넷 연결을 확인하고\n다시 시도해주세요',
      icon: Icons.wifi_off,
      onRetry: onRetry,
    );
  }
}

/// 서버 에러 위젯
class AppServerErrorWidget extends StatelessWidget {
  const AppServerErrorWidget({
    super.key,
    this.onRetry,
  });

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return AppErrorWidget(
      title: '서버 오류',
      message: '일시적인 오류가 발생했습니다\n잠시 후 다시 시도해주세요',
      icon: Icons.cloud_off,
      onRetry: onRetry,
    );
  }
}
