import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';
import '../theme/app_radius.dart';
import '../theme/app_shadow.dart';
import '../theme/app_border.dart';

/// 공통 카드 위젯 (디자인 시스템 토큰 사용)
/// 재사용 가능한 카드 컴포넌트
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.borderColor,
    this.onTap,
    this.elevation = AppCardElevation.none,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onTap;
  final AppCardElevation elevation;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final card = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? colorScheme.surface,
        borderRadius: AppRadius.card,
        border: Border.all(
          color: borderColor ?? colorScheme.outline,
          width: AppBorder.card,
        ),
        boxShadow: _getShadow(),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.card,
          child: Padding(
            padding: padding ?? EdgeInsets.all(AppSpacing.md),
            child: child,
          ),
        ),
      ),
    );

    return card;
  }

  List<BoxShadow> _getShadow() {
    switch (elevation) {
      case AppCardElevation.none:
        return AppShadow.none;
      case AppCardElevation.small:
        return AppShadow.sm;
      case AppCardElevation.medium:
        return AppShadow.md;
      case AppCardElevation.large:
        return AppShadow.lg;
    }
  }
}

/// 카드 Elevation
enum AppCardElevation {
  none,
  small,
  medium,
  large,
}

/// 리스트 아이템 카드
class AppListCard extends StatelessWidget {
  const AppListCard({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      margin: EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            AppSpacing.horizontalMD(),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (subtitle != null) ...[
                  AppSpacing.verticalXS(),
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            AppSpacing.horizontalMD(),
            trailing!,
          ],
        ],
      ),
    );
  }
}
