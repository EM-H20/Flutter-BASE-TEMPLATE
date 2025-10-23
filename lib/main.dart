import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_notifier.dart';
import 'core/router/app_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    final router = ref.watch(appRouterProvider);

    // 시스템 모드일 때 AppColors 동기화
    if (themeNotifier.isSystemMode) {
      themeNotifier.syncWithSystem(context);
    }

    return ScreenUtilInit(
      // 디자인 기준 사이즈 (일반적으로 iPhone 14 Pro 기준)
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Base Template',
          debugShowCheckedModeBanner: false,

          // 디자인 시스템 테마 적용
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,

          // go_router 통합
          routerConfig: router,
        );
      },
    );
  }
}
