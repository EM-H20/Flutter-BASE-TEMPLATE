import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../core/router/route_names.dart';
import '../core/theme/app_spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // 2초 대기 후 Home으로 이동
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go(RouteNames.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100.w),
            AppSpacing.verticalLG(),
            Text(
              'Base Template',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            AppSpacing.verticalMD(),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
