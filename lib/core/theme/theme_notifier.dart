import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'app_colors.dart';

part 'theme_notifier.g.dart';

/// 테마 모드(라이트/다크) 상태 관리 Notifier
/// 앱 전체의 테마를 제어하고, AppColors의 다크모드 상태를 동기화합니다
@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  /// 현재 다크모드 활성화 여부
  bool get isDarkMode => state == ThemeMode.dark;

  /// 라이트모드 활성화 여부
  bool get isLightMode => state == ThemeMode.light;

  /// 시스템 설정 사용 여부
  bool get isSystemMode => state == ThemeMode.system;

  /// 테마 모드 설정
  void setThemeMode(ThemeMode mode) {
    state = mode;
    _updateAppColors(mode);
  }

  /// 라이트/다크 모드 토글
  void toggleTheme() {
    switch (state) {
      case ThemeMode.light:
        setThemeMode(ThemeMode.dark);
        break;
      case ThemeMode.dark:
        setThemeMode(ThemeMode.light);
        break;
      case ThemeMode.system:
        setThemeMode(ThemeMode.light);
        break;
    }
  }

  /// 라이트 모드로 설정
  void setLightMode() {
    setThemeMode(ThemeMode.light);
  }

  /// 다크 모드로 설정
  void setDarkMode() {
    setThemeMode(ThemeMode.dark);
  }

  /// 시스템 설정 따르기
  void setSystemMode() {
    setThemeMode(ThemeMode.system);
  }

  /// BuildContext를 통해 실제 다크모드 여부 확인
  bool isDarkModeWithContext(BuildContext context) {
    if (state == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
    return state == ThemeMode.dark;
  }

  /// AppColors의 다크모드 상태 업데이트
  void _updateAppColors(ThemeMode mode) {
    if (mode == ThemeMode.dark) {
      AppColors.setDarkMode(true);
    } else if (mode == ThemeMode.light) {
      AppColors.setDarkMode(false);
    }
  }

  /// System 모드일 때 실제 다크모드 상태를 AppColors에 반영
  void syncWithSystem(BuildContext context) {
    if (state == ThemeMode.system) {
      final isDark =
          MediaQuery.of(context).platformBrightness == Brightness.dark;
      AppColors.setDarkMode(isDark);
    }
  }
}
