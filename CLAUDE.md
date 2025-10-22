# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter starter project (`base_template`) using SDK ^3.9.2 with a **complete design system template**. It provides a Tailwind CSS/shadcn-inspired design token system for rapid Flutter app development with consistent styling and theming.

## Essential Commands

### Development
```bash
# Run the app in debug mode
flutter run

# Run with hot reload (automatic during development)
# Press 'r' in terminal to manually hot reload
# Press 'R' in terminal to hot restart

# Run on specific device
flutter run -d <device_id>

# List available devices
flutter devices
```

### Testing
```bash
# Run all tests
flutter test

# Run a specific test file
flutter test test/widget_test.dart

# Run tests with coverage
flutter test --coverage
```

### Code Quality
```bash
# Run static analysis (uses analysis_options.yaml with flutter_lints)
flutter analyze

# Format code according to Dart style guide
dart format .

# Fix auto-fixable issues
dart fix --apply
```

### Build
```bash
# Build for Android
flutter build apk          # Debug APK
flutter build apk --release # Release APK
flutter build appbundle     # Android App Bundle for Play Store

# Build for iOS (requires macOS)
flutter build ios

# Build for web
flutter build web

# Build for desktop
flutter build macos
flutter build linux
flutter build windows
```

### Dependency Management
```bash
# Get dependencies (run after modifying pubspec.yaml)
flutter pub get

# Update dependencies
flutter pub upgrade

# Check for outdated packages
flutter pub outdated
```

### Clean Build
```bash
# Clean build artifacts (useful when encountering build issues)
flutter clean

# Clean and reinstall dependencies
flutter clean && flutter pub get
```

## Project Architecture

### Current Structure
```
lib/
├── main.dart                      # App entry point (Riverpod + go_router)
├── screens/                       # 화면 파일
│   ├── splash_screen.dart         # Splash 화면
│   ├── home_screen.dart           # Home 화면 (데모 UI 포함)
│   └── profile_screen.dart        # Profile 화면
└── core/
    ├── theme/                     # 디자인 시스템
    │   ├── app_colors.dart        # Color tokens (light/dark)
    │   ├── app_spacing.dart       # Spacing system (Tailwind-style)
    │   ├── app_radius.dart        # Border radius tokens
    │   ├── app_shadow.dart        # Shadow/elevation system
    │   ├── app_text_style.dart    # Typography with Pretendard font
    │   ├── theme_notifier.dart    # Dark mode state management (Riverpod)
    │   └── app_theme.dart         # ThemeData integration
    ├── router/                    # 라우팅
    │   ├── route_names.dart       # Route constants (splash, home, profile)
    │   └── app_router.dart        # go_router configuration (Riverpod)
    ├── widgets/                   # 공통 위젯
    │   ├── app_button.dart        # Button component
    │   ├── app_text_field.dart    # Text input component
    │   ├── app_loading.dart       # Loading indicators
    │   ├── app_error_widget.dart  # Error states
    │   ├── app_empty_state.dart   # Empty states
    │   └── app_card.dart          # Card components
    └── utils/                     # 유틸리티
        ├── validators.dart        # Form validators
        ├── formatters.dart        # Date/number formatters
        ├── extensions.dart        # Utility extensions
        └── constants.dart         # App constants

assets/
└── fonts/                         # Pretendard font family (Thin to Black)

test/                              # Widget tests
```

### Code Style
- Linting: Uses `flutter_lints` package (configured in [analysis_options.yaml](analysis_options.yaml:10))
- The project follows standard Flutter/Dart conventions
- All Dart code should pass `flutter analyze` before committing

### Dependencies

**Core Packages**:
- `flutter_riverpod` ^2.6.1 - State management
- `riverpod_annotation` ^2.6.1 - Code generation for Riverpod
- `freezed_annotation` ^2.4.4 - Immutable data classes
- `json_annotation` ^4.9.0 - JSON serialization

**Navigation & UI**:
- `go_router` ^16.2.1 - Declarative routing
- `cupertino_icons` ^1.0.8 - iOS-style icons

**Utilities**:
- `intl` ^0.20.2 - Internationalization
- `shared_preferences` ^2.3.4 - Local storage
- `flutter_screenutil` ^5.9.3 - Responsive sizing
- `flutter_svg` ^2.2.1 - SVG support
- `cached_network_image` ^3.4.1 - Image caching
- `shimmer` ^3.0.0 - Shimmer effects

**Dev Dependencies**:
- `flutter_lints` ^5.0.0 - Linting rules
- `build_runner` ^2.4.14 - Code generation
- `riverpod_generator` ^2.6.2 - Riverpod code gen
- `freezed` ^2.6.1 - Freezed code gen
- `json_serializable` ^6.9.2 - JSON code gen

## Platform Support

This template supports:
- Android
- iOS
- Web
- macOS
- Linux
- Windows

All platform configurations are included in their respective directories.

## Development Notes

### Hot Reload vs Hot Restart
- **Hot Reload** (r): Updates UI instantly while preserving app state
- **Hot Restart** (R): Restarts app from scratch, losing current state
- Use hot reload for UI changes, hot restart for changes to `main()` or app initialization

### Widget Testing
- Widget tests are in [test/widget_test.dart](test/widget_test.dart)
- Use `testWidgets()` for widget interaction testing
- `WidgetTester` provides utilities for widget manipulation and verification

## Design System

This project includes a comprehensive design token system inspired by Tailwind CSS and shadcn.

### Design Tokens

**Colors** ([app_colors.dart](lib/core/theme/app_colors.dart)):
- Semantic colors: `AppColors.primary`, `AppColors.secondary`, `AppColors.success`, `AppColors.error`
- Surface colors: `AppColors.background`, `AppColors.surface`, `AppColors.card`
- Text colors: `AppColors.textPrimary`, `AppColors.textSecondary`, `AppColors.textTertiary`
- Automatically switches between light/dark variants based on theme

**Spacing** ([app_spacing.dart](lib/core/theme/app_spacing.dart)):
- Tailwind-style scale: `xs` (4px), `sm` (8px), `md` (16px), `lg` (24px), `xl` (32px), `xxl` (48px)
- Semantic spacing: `AppSpacing.screenPadding`, `AppSpacing.cardPadding`, `AppSpacing.sectionSpacing`
- Helper widgets: `AppSpacing.verticalMD()`, `AppSpacing.horizontalLG()`

**Typography** ([app_text_style.dart](lib/core/theme/app_text_style.dart)):
- Uses **Pretendard** font family (all weights from Thin 100 to Black 900)
- Material Design 3 hierarchy: `displayLarge`, `headlineLarge`, `titleLarge`, `bodyLarge`, `labelLarge`
- Semantic styles: `AppTextStyle.link`, `AppTextStyle.error`, `AppTextStyle.success`

**Border Radius** ([app_radius.dart](lib/core/theme/app_radius.dart)):
- Size scale: `xs` (4px), `sm` (8px), `md` (12px), `lg` (16px), `xl` (24px), `full` (999px)
- Semantic: `AppRadius.button`, `AppRadius.card`, `AppRadius.input`, `AppRadius.dialog`
- Directional: `AppRadius.topLG()`, `AppRadius.bottomSheet`

**Shadows** ([app_shadow.dart](lib/core/theme/app_shadow.dart)):
- Elevation-based: `AppShadow.sm`, `AppShadow.md`, `AppShadow.lg`, `AppShadow.xl`
- Semantic: `AppShadow.card`, `AppShadow.button`, `AppShadow.dialog`
- Special effects: `AppShadow.glow(color)`, `AppShadow.colored(color)`

### Theme Management

**Dark Mode**:
- Automatic light/dark theme switching via `ThemeNotifier` (Riverpod)
- Toggle: `ref.read(themeNotifierProvider.notifier).toggleTheme()`
- System mode support: automatically follows device settings

**Usage Example**:
```dart
// Using design tokens
Container(
  padding: EdgeInsets.all(AppSpacing.md),
  decoration: BoxDecoration(
    color: AppColors.primary,
    borderRadius: AppRadius.card,
    boxShadow: AppShadow.md,
  ),
  child: Text(
    'Hello World',
    style: AppTextStyle.headlineMedium,
  ),
)

// Using theme (recommended)
Container(
  padding: EdgeInsets.all(AppSpacing.md),
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.primary,
    borderRadius: AppRadius.card,
  ),
  child: Text(
    'Hello World',
    style: Theme.of(context).textTheme.headlineMedium,
  ),
)

// Toggle dark mode (Riverpod)
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeNotifierProvider.notifier);

    return IconButton(
      icon: Icon(Icons.dark_mode),
      onPressed: () => themeNotifier.toggleTheme(),
    );
  }
}
```

### Extending the Design System

**Adding New Colors**:
1. Add light/dark variants in [app_colors.dart](lib/core/theme/app_colors.dart:15)
2. Add getter that switches based on `_isDarkMode`

**Adding Custom Fonts**:
1. Place font files in `assets/fonts/`
2. Register in [pubspec.yaml](pubspec.yaml:29) under `fonts:`
3. Update `_fontFamily` in [app_text_style.dart](lib/core/theme/app_text_style.dart:9)

**Modifying Theme**:
- Edit [app_theme.dart](lib/core/theme/app_theme.dart) to customize `ThemeData` components
- Changes automatically apply to all Material components

### Design System Best Practices

1. **Use semantic names** over direct values: `AppColors.primary` not `Color(0xFF2563EB)`
2. **Use Theme.of(context)** when possible for automatic theme switching
3. **Use spacing constants** for consistent layout: `AppSpacing.md` not `16.0`
4. **Follow Material Design 3** typography hierarchy for text
5. **Test both light and dark modes** before committing

## Common Widgets (Tier 1)

프로젝트에 바로 사용 가능한 공통 위젯과 유틸리티가 포함되어 있습니다.

### Widgets

**Buttons** ([app_button.dart](lib/core/widgets/app_button.dart)):
```dart
AppButton(
  onPressed: () {},
  text: 'Submit',
  type: AppButtonType.primary,  // primary, secondary, text, danger
  size: AppButtonSize.medium,   // small, medium, large
  isLoading: false,
  icon: Icons.send,
)
```

**Text Fields** ([app_text_field.dart](lib/core/widgets/app_text_field.dart)):
```dart
AppTextField(
  label: 'Email',
  hint: 'your@email.com',
  prefixIcon: Icons.email,
  keyboardType: TextInputType.emailAddress,
  validator: Validators.email,  // Built-in validators
  onChanged: (value) {},
)
```

**Loading** ([app_loading.dart](lib/core/widgets/app_loading.dart)):
```dart
// Circular loading
AppLoading(type: AppLoadingType.circular)

// Shimmer effect
AppLoading(type: AppLoadingType.shimmer)
AppShimmerListItem()
AppShimmerCard()
```

**Error States** ([app_error_widget.dart](lib/core/widgets/app_error_widget.dart)):
```dart
AppErrorWidget(
  title: '오류 발생',
  message: '다시 시도해주세요',
  onRetry: () {},
)

// Pre-built error widgets
AppNetworkErrorWidget(onRetry: () {})
AppServerErrorWidget(onRetry: () {})
```

**Empty States** ([app_empty_state.dart](lib/core/widgets/app_empty_state.dart)):
```dart
AppEmptyState(
  title: '데이터 없음',
  message: '새로운 항목을 추가하세요',
  actionText: '추가',
  onAction: () {},
)

// Pre-built empty states
AppNoSearchResults()
AppEmptyList(message: '목록이 비어있습니다')
```

**Cards** ([app_card.dart](lib/core/widgets/app_card.dart)):
```dart
AppCard(
  onTap: () {},
  elevation: AppCardElevation.medium,
  child: Text('Card content'),
)

AppListCard(
  title: 'Title',
  subtitle: 'Subtitle',
  leading: Icon(Icons.person),
  trailing: Icon(Icons.arrow_forward),
  onTap: () {},
)
```

### Utilities

**Validators** ([validators.dart](lib/core/utils/validators.dart)):
```dart
Validators.email(value)           // 이메일 검증
Validators.password(value)        // 비밀번호 (8자 이상, 영문+숫자)
Validators.phone(value)           // 전화번호 (한국)
Validators.required(value)        // 필수 입력
Validators.minLength(value, 8)    // 최소 길이
Validators.combine([...])         // 여러 검증 조합
```

**Formatters** ([formatters.dart](lib/core/utils/formatters.dart)):
```dart
Formatters.date(DateTime.now())           // 2024-01-01
Formatters.dateKorean(DateTime.now())     // 2024년 01월 01일
Formatters.relativeTime(DateTime.now())   // 방금 전, 1분 전
Formatters.number(1000000)                // 1,000,000
Formatters.won(50000)                     // 50,000원
Formatters.phone('01012345678')           // 010-1234-5678
Formatters.fileSize(1024 * 1024)          // 1.0 MB
```

**Extensions** ([extensions.dart](lib/core/utils/extensions.dart)):
```dart
// BuildContext extensions
context.screenWidth
context.screenHeight
context.theme
context.colorScheme
context.isDarkMode
context.hideKeyboard()
context.showSnackBar('Message')
context.showErrorSnackBar('Error')

// String extensions
'hello'.capitalize              // Hello
'test@email.com'.isValidEmail  // true
'abc123'.digitsOnly            // 123
'Long text'.truncate(10)       // Long text...

// DateTime extensions
DateTime.now().isToday         // true
DateTime.now().startOfDay
date1.isSameDay(date2)

// num extensions
5.seconds                      // Duration(seconds: 5)
100.isBetween(0, 200)         // true
```

**Constants** ([constants.dart](lib/core/utils/constants.dart)):
```dart
AppConstants.apiBaseUrl
AppConstants.apiTimeout
AppConstants.pageSize
AppConstants.errorNetwork
AppConstants.searchDebounce
```

### Usage Patterns

**Form with Validation**:
```dart
AppTextField(
  label: 'Email',
  validator: Validators.email,
  onChanged: (value) => setState(() => email = value),
)

AppTextField(
  label: 'Password',
  obscureText: true,
  validator: Validators.password,
)

AppButton(
  onPressed: _submit,
  text: 'Login',
  isLoading: isLoading,
)
```

**Loading States**:
```dart
if (isLoading) {
  return AppLoading();
} else if (hasError) {
  return AppErrorWidget(
    message: errorMessage,
    onRetry: _retry,
  );
} else if (data.isEmpty) {
  return AppEmptyState(message: '데이터가 없습니다');
} else {
  return ListView(...);
}
```

**Using Extensions**:
```dart
// Hide keyboard on submit
context.hideKeyboard();

// Show success message
context.showSuccessSnackBar('저장되었습니다');

// Format date
Text(Formatters.dateKorean(createdAt))

// Check if valid
if (email.isValidEmail) {
  // proceed
}
```

## Routing System

이 프로젝트는 `go_router`를 사용한 **바텀 네비게이션 기반** 라우팅 시스템을 제공합니다.

### App Structure

```
앱 시작
  ↓
Splash (/) - 2초 대기
  ↓ context.go() - 스택 쌓지 않음
MainShell - ShellRoute (바텀 네비게이션)
  ├─ Home (/home)
  └─ Profile (/profile)
```

### Bottom Navigation Features

- **ShellRoute 구조**: 바텀 네비게이션이 모든 탭에서 유지됨
- **애니메이션 없음**: 탭 전환 시 부드러운 즉시 전환 (`NoTransitionPage`)
- **탭 재탭 스크롤**: 현재 선택된 탭을 다시 탭하면 최상위로 스크롤
- **확장 가능**: 새 탭 추가 시 3곳만 수정

### Basic Usage

**Navigation**:
```dart
// Named route로 이동 (바텀 네비게이션 포함)
context.go(RouteNames.home);
context.go(RouteNames.profile);

// 뒤로가기
context.pop();
```

**Route Constants** ([route_names.dart](lib/core/router/route_names.dart)):
```dart
RouteNames.splash   // '/'
RouteNames.home     // '/home'
RouteNames.profile  // '/profile'
```

### Router Configuration

**ShellRoute 구조** ([app_router.dart](lib/core/router/app_router.dart)):
```dart
ShellRoute(
  builder: (context, state, child) => MainShell(
    state: state,
    child: child,
  ),
  routes: [
    GoRoute(
      path: RouteNames.home,
      pageBuilder: (context, state) => NoTransitionPage(
        child: const HomeScreen(),
      ),
    ),
    // ... 다른 탭들
  ],
)
```

### Adding New Bottom Navigation Tab

새 탭을 바텀 네비게이션에 추가하려면 **3곳만** 수정하면 됩니다:

#### 1. 화면 파일 생성 (`lib/screens/settings_screen.dart`):
```dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings Screen')),
    );
  }
}
```

#### 2. MainShell 수정 ([main_shell.dart](lib/screens/main_shell.dart)):
```dart
// ✅ Step 2-1: _calculateSelectedIndex() 메서드에 조건 추가
int _calculateSelectedIndex() {
  final location = widget.state.uri.path;
  if (location.startsWith(RouteNames.home)) return 0;
  if (location.startsWith(RouteNames.profile)) return 1;
  if (location.startsWith(RouteNames.settings)) return 2;  // 추가
  return 0;
}

// ✅ Step 2-2: _onItemTapped() 메서드에 case 추가
void _onItemTapped(BuildContext context, int index) {
  // ... existing code ...
  case 2:
    context.go(RouteNames.settings);  // 추가
    break;
}

// ✅ Step 2-3: destinations에 NavigationDestination 추가
destinations: const [
  NavigationDestination(icon: Icon(Icons.home_outlined), ...),
  NavigationDestination(icon: Icon(Icons.person_outline), ...),
  NavigationDestination(  // 추가
    icon: Icon(Icons.settings_outlined),
    selectedIcon: Icon(Icons.settings),
    label: 'Settings',
  ),
],
```

#### 3. Router 수정 ([app_router.dart](lib/core/router/app_router.dart) + [route_names.dart](lib/core/router/route_names.dart)):
```dart
// ✅ route_names.dart에 추가
static const String settings = '/settings';

// ✅ app_router.dart - import 추가
import '../../screens/settings_screen.dart';

// ✅ app_router.dart - ShellRoute의 routes 배열에 추가
ShellRoute(
  builder: (context, state, child) => MainShell(...),
  routes: [
    GoRoute(...),  // home
    GoRoute(...),  // profile
    GoRoute(  // 추가
      path: RouteNames.settings,
      name: 'settings',
      pageBuilder: (context, state) => NoTransitionPage(
        child: const SettingsScreen(),
      ),
    ),
  ],
)
```

#### 4. 코드 생성:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Adding Non-Tab Routes

바텀 네비게이션 **밖**의 라우트 추가 (예: 상세 페이지):

```dart
// ShellRoute 밖에 GoRoute 추가 (바텀 네비게이션 없음)
GoRoute(
  path: '/detail/:id',
  name: 'detail',
  builder: (context, state) {
    final id = state.pathParameters['id']!;
    return DetailScreen(id: id);
  },
),
```

### Tap to Scroll to Top

**이미 선택된 탭을 한 번 더 탭**하면 자동으로 최상위로 스크롤됩니다:

```dart
// MainShell에 이미 구현되어 있음
// 현재 탭 재탭 → 최상위로 부드럽게 스크롤 (300ms)
// ListView, GridView 등 PrimaryScrollController를 사용하는 위젯에서 자동 작동
```

**동작 예시**:
- Home 탭 선택 상태에서 → Home 탭 다시 탭 → 최상위로 스크롤
- Profile 탭 선택 상태에서 → Profile 탭 다시 탭 → 최상위로 스크롤

### Best Practices

1. **RouteNames 사용**: 문자열 대신 상수 사용
```dart
// ✅ Good
context.go(RouteNames.home);

// ❌ Bad
context.go('/home');
```

2. **NoTransitionPage**: 탭 전환 시 애니메이션 제거
```dart
pageBuilder: (context, state) => NoTransitionPage(
  child: const HomeScreen(),
),
```

3. **ShellRoute for Bottom Nav**: 바텀 네비게이션은 ShellRoute 사용
```dart
// ✅ Good: 바텀 네비게이션 유지
ShellRoute(
  builder: (context, state, child) => MainShell(...),
  routes: [/* 탭 라우트들 */],
)

// ❌ Bad: 개별 GoRoute (바텀 네비게이션 사라짐)
GoRoute(path: '/home', builder: ...)
```

4. **Code Generation**: 라우트 변경 후 항상 build_runner 실행
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Adding Assets
To add images or other assets:
1. Create appropriate directory in `assets/` (e.g., `assets/images/`)
2. Add assets to `pubspec.yaml` under the `flutter:` section
3. Run `flutter pub get`
