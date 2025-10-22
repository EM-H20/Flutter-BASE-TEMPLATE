import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../screens/splash_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/profile_screen.dart';
import '../../screens/main_shell.dart';
import 'route_names.dart';

part 'app_router.g.dart';

/// go_router Provider
/// Riverpod을 통해 라우터 인스턴스를 관리
@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: true,
    routes: [
      // ============================================
      // Splash 화면 (바텀 네비게이션 없음)
      // ============================================
      GoRoute(
        path: RouteNames.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // ============================================
      // Main Shell (바텀 네비게이션 포함)
      // ============================================
      ShellRoute(
        builder: (context, state, child) => MainShell(
          state: state,
          child: child,
        ),
        routes: [
          // Home 화면
          GoRoute(
            path: RouteNames.home,
            name: 'home',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const HomeScreen(),
            ),
          ),

          // Profile 화면
          GoRoute(
            path: RouteNames.profile,
            name: 'profile',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const ProfileScreen(),
            ),
          ),

          // 확장: 새 탭 추가 시 여기에 GoRoute 추가
          // 예시:
          // GoRoute(
          //   path: RouteNames.settings,
          //   name: 'settings',
          //   pageBuilder: (context, state) => NoTransitionPage(
          //     child: const SettingsScreen(),
          //   ),
          // ),
        ],
      ),
    ],

    // ============================================
    // 에러 화면
    // ============================================
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              '페이지를 찾을 수 없습니다',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              state.error.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.home),
              child: const Text('홈으로 이동'),
            ),
          ],
        ),
      ),
    ),
  );
}
