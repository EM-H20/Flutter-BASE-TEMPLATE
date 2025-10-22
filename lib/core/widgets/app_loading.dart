import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_radius.dart';

/// 공통 로딩 위젯 (디자인 시스템 토큰 사용)
/// Shimmer 효과 및 다양한 로딩 타입 지원
class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    this.type = AppLoadingType.circular,
    this.size = AppLoadingSize.medium,
    this.color,
  });

  final AppLoadingType type;
  final AppLoadingSize size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppLoadingType.circular:
        return _buildCircular();
      case AppLoadingType.linear:
        return _buildLinear();
      case AppLoadingType.shimmer:
        return _buildShimmer();
    }
  }

  /// 원형 로딩 인디케이터
  Widget _buildCircular() {
    return Center(
      child: SizedBox(
        width: _getSize(),
        height: _getSize(),
        child: CircularProgressIndicator(
          strokeWidth: _getStrokeWidth(),
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? AppColors.primary,
          ),
        ),
      ),
    );
  }

  /// 선형 로딩 인디케이터
  Widget _buildLinear() {
    return LinearProgressIndicator(
      backgroundColor: AppColors.divider,
      valueColor: AlwaysStoppedAnimation<Color>(
        color ?? AppColors.primary,
      ),
    );
  }

  /// Shimmer 로딩 효과
  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.divider,
      highlightColor: AppColors.surface,
      child: Container(
        width: double.infinity,
        height: _getSize(),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.card,
        ),
      ),
    );
  }

  double _getSize() {
    switch (size) {
      case AppLoadingSize.small:
        return 24;
      case AppLoadingSize.medium:
        return 40;
      case AppLoadingSize.large:
        return 56;
    }
  }

  double _getStrokeWidth() {
    switch (size) {
      case AppLoadingSize.small:
        return 2;
      case AppLoadingSize.medium:
        return 3;
      case AppLoadingSize.large:
        return 4;
    }
  }
}

/// 로딩 타입
enum AppLoadingType {
  circular,
  linear,
  shimmer,
}

/// 로딩 크기
enum AppLoadingSize {
  small,
  medium,
  large,
}

/// Shimmer 리스트 아이템 (재사용 가능)
class AppShimmerListItem extends StatelessWidget {
  const AppShimmerListItem({
    super.key,
    this.height = 80,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.divider,
      highlightColor: AppColors.surface,
      child: Container(
        height: height,
        margin: EdgeInsets.only(bottom: AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.card,
        ),
      ),
    );
  }
}

/// Shimmer 카드 (재사용 가능)
class AppShimmerCard extends StatelessWidget {
  const AppShimmerCard({
    super.key,
    this.width,
    this.height = 200,
  });

  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.divider,
      highlightColor: AppColors.surface,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.card,
        ),
      ),
    );
  }
}
