import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/theme/theme_notifier.dart';
import '../core/widgets/app_button.dart';
import '../core/widgets/app_card.dart';
import '../core/widgets/app_text_field.dart';
import '../core/theme/app_spacing.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Demo'),
        actions: [
          /// 다크모드 토글 버튼
          IconButton(
            icon: Icon(
              themeNotifier.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => themeNotifier.toggleTheme(),
            tooltip: '테마 전환',
          ),
        ],
      ),
      body: ListView(
        padding: AppSpacing.all(AppSpacing.screenPadding),
        children: [
          _buildSection(
            context,
            '디자인 시스템 템플릿',
            'Tailwind/shadcn 스타일의 Flutter 디자인 토큰 시스템',
          ),

          AppSpacing.verticalXL(),

          /// Typography Section
          _buildSectionTitle(context, 'Typography'),
          _buildTypographyShowcase(context),

          AppSpacing.verticalXL(),

          /// Colors Section
          _buildSectionTitle(context, 'Colors'),
          _buildColorsShowcase(context),

          AppSpacing.verticalXL(),

          /// Buttons Section
          _buildSectionTitle(context, 'Buttons'),
          _buildButtonsShowcase(context),

          AppSpacing.verticalXL(),

          /// Cards Section
          _buildSectionTitle(context, 'Cards & Spacing'),
          _buildCardsShowcase(context),

          AppSpacing.verticalXL(),

          /// Input Fields Section
          _buildSectionTitle(context, 'Input Fields'),
          _buildInputShowcase(context),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        AppSpacing.verticalSM(),
        Text(description, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.md),
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  Widget _buildTypographyShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Display Large', style: Theme.of(context).textTheme.displayLarge),
        AppSpacing.verticalSM(),
        Text(
          'Headline Large',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        AppSpacing.verticalSM(),
        Text('Title Large', style: Theme.of(context).textTheme.titleLarge),
        AppSpacing.verticalSM(),
        Text(
          'Body Large - 본문 텍스트입니다',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        AppSpacing.verticalSM(),
        Text(
          'Body Medium - 기본 텍스트',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        AppSpacing.verticalSM(),
        Text(
          'Body Small - 보조 텍스트',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildColorsShowcase(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        _colorChip('Primary', Theme.of(context).colorScheme.primary),
        _colorChip('Secondary', Theme.of(context).colorScheme.secondary),
        _colorChip('Error', Theme.of(context).colorScheme.error),
        _colorChip('Surface', Theme.of(context).colorScheme.surface),
      ],
    );
  }

  Widget _colorChip(String label, Color color) {
    return Chip(
      label: Text(label),
      backgroundColor: color,
      labelStyle: TextStyle(
        color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
      ),
    );
  }

  Widget _buildButtonsShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppButton(
          onPressed: () {},
          text: 'Primary Button',
          type: AppButtonType.primary,
        ),
        AppSpacing.verticalSM(),
        AppButton(
          onPressed: () {},
          text: 'Secondary Button',
          type: AppButtonType.secondary,
        ),
        AppSpacing.verticalSM(),
        AppButton(
          onPressed: () {},
          text: 'Text Button',
          type: AppButtonType.text,
        ),
      ],
    );
  }

  Widget _buildCardsShowcase(BuildContext context) {
    return Column(
      children: [
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Card Title',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              AppSpacing.verticalSM(),
              Text(
                '카드 컴포넌트입니다. 기본 간격과 스타일이 적용되어 있습니다.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        AppSpacing.verticalMD(),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('간격 시스템', style: Theme.of(context).textTheme.titleMedium),
              AppSpacing.verticalSM(),
              Text(
                'xs: 4px | sm: 8px | md: 16px | lg: 24px | xl: 32px',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInputShowcase(BuildContext context) {
    return Column(
      children: [
        const AppTextField(
          label: 'Email',
          hint: 'your@email.com',
          keyboardType: TextInputType.emailAddress,
        ),
        AppSpacing.verticalMD(),
        const AppTextField(
          label: 'Password',
          hint: '비밀번호 입력',
          obscureText: true,
        ),
      ],
    );
  }
}
