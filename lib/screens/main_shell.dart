import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/router/route_names.dart';

/// MainShell - 바텀 네비게이션을 포함하는 Shell
/// ShellRoute의 builder로 사용됨
class MainShell extends StatefulWidget {
  final GoRouterState state;
  final Widget child;

  const MainShell({super.key, required this.state, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final _scrollControllers = <String, ScrollController>{};

  @override
  void dispose() {
    for (final controller in _scrollControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  ScrollController _getScrollController(String route) {
    return _scrollControllers.putIfAbsent(
      route,
      () => ScrollController(),
    );
  }

  /// 현재 선택된 탭 인덱스 계산
  int _calculateSelectedIndex() {
    final location = widget.state.uri.path;
    if (location.startsWith(RouteNames.home)) return 0;
    if (location.startsWith(RouteNames.profile)) return 1;
    // 확장: 새 탭 추가 시 여기에 조건 추가
    return 0;
  }

  /// 탭 선택 시 네비게이션 처리
  void _onItemTapped(BuildContext context, int index) {
    final selectedIndex = _calculateSelectedIndex();

    // 이미 선택된 탭을 다시 탭한 경우 → 최상위로 스크롤
    if (selectedIndex == index) {
      _scrollToTop();
      return;
    }

    // 다른 탭으로 이동
    switch (index) {
      case 0:
        context.go(RouteNames.home);
        break;
      case 1:
        context.go(RouteNames.profile);
        break;
      // 확장: 새 탭 추가 시 case 추가
    }
  }

  /// 현재 화면의 ScrollController를 최상위로 스크롤
  void _scrollToTop() {
    final route = widget.state.uri.path;
    final controller = _scrollControllers[route];

    if (controller != null && controller.hasClients) {
      controller.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex();
    final route = widget.state.uri.path;
    final scrollController = _getScrollController(route);

    return Scaffold(
      body: PrimaryScrollController(
        controller: scrollController,
        child: widget.child,
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => _onItemTapped(context, index),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            // 탭 1: Home
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            // 탭 2: Profile
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
            // 확장: 새 탭 추가 시 BottomNavigationBarItem 추가
            // 예시:
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings_outlined),
            //   activeIcon: Icon(Icons.settings),
            //   label: 'Settings',
            // ),
          ],
        ),
      ),
    );
  }
}
