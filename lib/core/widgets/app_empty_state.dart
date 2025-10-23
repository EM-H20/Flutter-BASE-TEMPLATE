import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_style.dart';
import 'app_button.dart';

/// 공통 빈 상태 위젯 (디자인 시스템 토큰 사용)
/// 데이터가 없을 때 표시하는 화면
class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    required this.message,
    this.title = '데이터가 없습니다',
    this.icon = Icons.inbox_outlined,
    this.actionText,
    this.onAction,
  });

  final String title;
  final String message;
  final IconData icon;
  final String? actionText;
  final VoidCallback? onAction;

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
              size: 80.w,
              color: AppColors.textTertiary,
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
            if (actionText != null && onAction != null) ...[
              AppSpacing.verticalLG(),
              AppButton(
                onPressed: onAction,
                text: actionText!,
                type: AppButtonType.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 검색 결과 없음 위젯
class AppNoSearchResults extends StatelessWidget {
  const AppNoSearchResults({
    super.key,
    this.searchQuery,
  });

  final String? searchQuery;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      title: '검색 결과가 없습니다',
      message: searchQuery != null
          ? '"$searchQuery"에 대한 검색 결과가 없습니다'
          : '검색 결과가 없습니다',
      icon: Icons.search_off,
    );
  }
}

/// 리스트 비어있음 위젯
class AppEmptyList extends StatelessWidget {
  const AppEmptyList({
    super.key,
    required this.message,
    this.onRefresh,
  });

  final String message;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      title: '목록이 비어있습니다',
      message: message,
      icon: Icons.list_alt,
      actionText: onRefresh != null ? '새로고침' : null,
      onAction: onRefresh,
    );
  }
}
