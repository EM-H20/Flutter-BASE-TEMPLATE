# Flutter Base Template

### ⚡ Quick Start
```bash
# 1. Download and extract ZIP → Copy lib/ and pubspec.yaml to your project
# 2. Install dependencies and run code generation
flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
# 3. Run the app
flutter run
```

[한국어](#한국어) | [English](#english)

---

## 한국어

### 📋 프로젝트 소개

확장 가능한 디자인 시스템과 모범 사례가 적용된 프로덕션 레디 Flutter 템플릿입니다.

### ✨ 주요 기능

- **🎨 완전한 디자인 시스템**
  - 토큰 기반 색상 시스템 (Light/Dark 모드)
  - Typography 시스템 (Pretendard 폰트)
  - Spacing, Radius, Shadow 토큰
  - 공통 컴포넌트 (Button, Card, TextField, Loading, Error 등)

- **🏗️ 견고한 아키텍처**
  - Riverpod 2.x (상태 관리)
  - go_router 16.x (선언적 라우팅)
  - Freezed + JSON Serializable (불변 데이터 모델)
  - 계층화된 폴더 구조

- **🌓 다크 모드 지원**
  - Material Design 3 ColorScheme
  - 자동 테마 전환
  - 모든 컴포넌트 다크 모드 최적화

- **📱 반응형 UI**
  - flutter_screenutil 통합
  - 적응형 레이아웃 지원

- **🚀 개발자 경험**
  - 코드 생성 자동화 (build_runner)
  - 타입 안전 라우팅
  - 재사용 가능한 유틸리티 및 확장 기능

### 📦 기술 스택

#### 핵심 의존성
- **상태 관리**: flutter_riverpod ^2.6.1
- **라우팅**: go_router ^16.2.1
- **데이터 모델**: freezed ^2.5.7, json_serializable ^6.9.2
- **반응형 UI**: flutter_screenutil ^5.9.3
- **국제화**: flutter_localizations

#### 개발 도구
- build_runner ^2.4.14
- riverpod_generator ^2.6.2
- flutter_lints ^6.0.0

### 🗂️ 프로젝트 구조

```
lib/
├── core/                      # 핵심 기능 및 공유 리소스
│   ├── router/               # 라우팅 설정
│   │   ├── app_router.dart   # GoRouter 설정
│   │   └── route_names.dart  # 라우트 상수
│   ├── theme/                # 디자인 시스템 토큰
│   │   ├── app_colors.dart   # 색상 토큰 (Light/Dark)
│   │   ├── app_text_style.dart # Typography
│   │   ├── app_spacing.dart  # 간격 토큰
│   │   ├── app_radius.dart   # Border Radius 토큰
│   │   ├── app_shadow.dart   # Shadow 토큰
│   │   ├── app_theme.dart    # ThemeData 설정
│   │   └── theme_notifier.dart # 테마 상태 관리
│   ├── widgets/              # 공통 컴포넌트
│   │   ├── app_button.dart   # 버튼 컴포넌트
│   │   ├── app_card.dart     # 카드 컴포넌트
│   │   ├── app_text_field.dart # 입력 필드
│   │   ├── app_loading.dart  # 로딩 인디케이터
│   │   ├── app_error_widget.dart # 에러 위젯
│   │   └── app_empty_state.dart # 빈 상태 위젯
│   └── utils/                # 유틸리티 함수
│       ├── validators.dart   # 입력 검증
│       ├── formatters.dart   # 데이터 포맷팅
│       ├── extensions.dart   # Dart 확장
│       └── constants.dart    # 앱 상수
├── screens/                  # 화면
│   ├── main_shell.dart      # 바텀 네비게이션 셸
│   ├── splash_screen.dart   # 스플래시 화면
│   ├── home_screen.dart     # 홈 화면
│   └── profile_screen.dart  # 프로필 화면
└── main.dart                # 앱 진입점
```

### 🚀 시작하기

#### 사전 요구사항
- Flutter SDK ^3.9.2
- Dart SDK ^3.9.2

#### 설치

1. **저장소 클론**
```bash
git clone <repository-url>
cd base_template
```

2. **의존성 설치**
```bash
flutter pub get
```

3. **코드 생성 실행**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **앱 실행**
```bash
flutter run
```

### 🎨 디자인 시스템 사용법

#### 색상 사용
```dart
// ColorScheme을 통한 테마 인식 색상
Container(
  color: Theme.of(context).colorScheme.primary,
)

// AppColors를 통한 직접 접근 (자동 Light/Dark 전환)
Text(
  'Hello',
  style: TextStyle(color: AppColors.textPrimary),
)
```

#### 버튼 사용
```dart
AppButton(
  onPressed: () {},
  text: 'Primary Button',
  type: AppButtonType.primary, // primary, secondary, text, danger
  size: AppButtonSize.medium,  // small, medium, large
  icon: Icons.arrow_forward,   // 선택사항
)
```

#### 카드 사용
```dart
AppCard(
  child: Text('Content'),
  padding: AppSpacing.paddingMD,
  elevation: AppCardElevation.medium,
)
```

#### TextField 사용
```dart
AppTextField(
  label: 'Email',
  hint: 'Enter your email',
  keyboardType: TextInputType.email,
  validator: Validators.email,
)
```

### 📱 화면 추가하기

1. **화면 파일 생성**
```dart
// lib/screens/my_screen.dart
class MyScreen extends ConsumerWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Screen')),
      body: const Center(child: Text('Hello')),
    );
  }
}
```

2. **라우트 추가**
```dart
// lib/core/router/route_names.dart
class RouteNames {
  static const myScreen = '/my-screen';
}

// lib/core/router/app_router.dart
GoRoute(
  path: RouteNames.myScreen,
  name: RouteNames.myScreen,
  builder: (context, state) => const MyScreen(),
)
```

### 🔧 빌드 및 배포

#### 개발 빌드
```bash
flutter run --debug
```

#### 프로덕션 빌드
```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

### 📚 주요 컨벤션

- **파일명**: `snake_case.dart`
- **클래스명**: `PascalCase`
- **변수/함수**: `camelCase`
- **상수**: `camelCase` 또는 `SCREAMING_SNAKE_CASE`
- **폴더 구조**: 기능별 그룹화, 도메인 중심 설계

### 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### 📄 라이선스

This project is licensed under the MIT License.

---

## English

### 📋 Project Overview

A production-ready Flutter template with scalable design system and best practices built-in.

### ✨ Key Features

- **🎨 Complete Design System**
  - Token-based color system (Light/Dark mode)
  - Typography system (Pretendard font)
  - Spacing, Radius, Shadow tokens
  - Common components (Button, Card, TextField, Loading, Error, etc.)

- **🏗️ Solid Architecture**
  - Riverpod 2.x (State management)
  - go_router 16.x (Declarative routing)
  - Freezed + JSON Serializable (Immutable data models)
  - Layered folder structure

- **🌓 Dark Mode Support**
  - Material Design 3 ColorScheme
  - Automatic theme switching
  - All components optimized for dark mode

- **📱 Responsive UI**
  - flutter_screenutil integration
  - Adaptive layout support

- **🚀 Developer Experience**
  - Automated code generation (build_runner)
  - Type-safe routing
  - Reusable utilities and extensions

### 📦 Tech Stack

#### Core Dependencies
- **State Management**: flutter_riverpod ^2.6.1
- **Routing**: go_router ^16.2.1
- **Data Models**: freezed ^2.5.7, json_serializable ^6.9.2
- **Responsive UI**: flutter_screenutil ^5.9.3
- **Internationalization**: flutter_localizations

#### Development Tools
- build_runner ^2.4.14
- riverpod_generator ^2.6.2
- flutter_lints ^6.0.0

### 🗂️ Project Structure

```
lib/
├── core/                      # Core features and shared resources
│   ├── router/               # Routing configuration
│   │   ├── app_router.dart   # GoRouter setup
│   │   └── route_names.dart  # Route constants
│   ├── theme/                # Design system tokens
│   │   ├── app_colors.dart   # Color tokens (Light/Dark)
│   │   ├── app_text_style.dart # Typography
│   │   ├── app_spacing.dart  # Spacing tokens
│   │   ├── app_radius.dart   # Border radius tokens
│   │   ├── app_shadow.dart   # Shadow tokens
│   │   ├── app_theme.dart    # ThemeData configuration
│   │   └── theme_notifier.dart # Theme state management
│   ├── widgets/              # Common components
│   │   ├── app_button.dart   # Button component
│   │   ├── app_card.dart     # Card component
│   │   ├── app_text_field.dart # Input field
│   │   ├── app_loading.dart  # Loading indicator
│   │   ├── app_error_widget.dart # Error widget
│   │   └── app_empty_state.dart # Empty state widget
│   └── utils/                # Utility functions
│       ├── validators.dart   # Input validation
│       ├── formatters.dart   # Data formatting
│       ├── extensions.dart   # Dart extensions
│       └── constants.dart    # App constants
├── screens/                  # Screens
│   ├── main_shell.dart      # Bottom navigation shell
│   ├── splash_screen.dart   # Splash screen
│   ├── home_screen.dart     # Home screen
│   └── profile_screen.dart  # Profile screen
└── main.dart                # App entry point
```

### 🚀 Getting Started

#### Prerequisites
- Flutter SDK ^3.9.2
- Dart SDK ^3.9.2

#### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd base_template
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run code generation**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Run the app**
```bash
flutter run
```

### 🎨 Design System Usage

#### Using Colors
```dart
// Theme-aware colors via ColorScheme
Container(
  color: Theme.of(context).colorScheme.primary,
)

// Direct access via AppColors (auto Light/Dark switching)
Text(
  'Hello',
  style: TextStyle(color: AppColors.textPrimary),
)
```

#### Using Buttons
```dart
AppButton(
  onPressed: () {},
  text: 'Primary Button',
  type: AppButtonType.primary, // primary, secondary, text, danger
  size: AppButtonSize.medium,  // small, medium, large
  icon: Icons.arrow_forward,   // optional
)
```

#### Using Cards
```dart
AppCard(
  child: Text('Content'),
  padding: AppSpacing.paddingMD,
  elevation: AppCardElevation.medium,
)
```

#### Using TextField
```dart
AppTextField(
  label: 'Email',
  hint: 'Enter your email',
  keyboardType: TextInputType.email,
  validator: Validators.email,
)
```

### 📱 Adding New Screens

1. **Create screen file**
```dart
// lib/screens/my_screen.dart
class MyScreen extends ConsumerWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Screen')),
      body: const Center(child: Text('Hello')),
    );
  }
}
```

2. **Add route**
```dart
// lib/core/router/route_names.dart
class RouteNames {
  static const myScreen = '/my-screen';
}

// lib/core/router/app_router.dart
GoRoute(
  path: RouteNames.myScreen,
  name: RouteNames.myScreen,
  builder: (context, state) => const MyScreen(),
)
```

### 🔧 Build & Deploy

#### Development Build
```bash
flutter run --debug
```

#### Production Build
```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

### 📚 Code Conventions

- **File names**: `snake_case.dart`
- **Class names**: `PascalCase`
- **Variables/Functions**: `camelCase`
- **Constants**: `camelCase` or `SCREAMING_SNAKE_CASE`
- **Folder structure**: Feature-based grouping, domain-driven design

### 🤝 Contributing

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### 📄 License

This project is licensed under the MIT License.

---

**Made with ❤️ using Flutter**
