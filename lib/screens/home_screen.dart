import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/theme/theme_notifier.dart';

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
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            context,
            '디자인 시스템 템플릿',
            'Tailwind/shadcn 스타일의 Flutter 디자인 토큰 시스템',
          ),

          const SizedBox(height: 32),

          /// Typography Section
          _buildSectionTitle(context, 'Typography'),
          _buildTypographyShowcase(context),

          const SizedBox(height: 32),

          /// Colors Section
          _buildSectionTitle(context, 'Colors'),
          _buildColorsShowcase(context),

          const SizedBox(height: 32),

          /// Buttons Section
          _buildSectionTitle(context, 'Buttons'),
          _buildButtonsShowcase(context),

          const SizedBox(height: 32),

          /// Cards Section
          _buildSectionTitle(context, 'Cards & Spacing'),
          _buildCardsShowcase(context),

          const SizedBox(height: 32),

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
        const SizedBox(height: 8),
        Text(description, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  Widget _buildTypographyShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Display Large', style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(height: 8),
        Text(
          'Headline Large',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        Text('Title Large', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(
          'Body Large - 본문 텍스트입니다',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'Body Medium - 기본 텍스트',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Body Small - 보조 텍스트',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildColorsShowcase(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
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
        ElevatedButton(onPressed: () {}, child: const Text('Elevated Button')),
        const SizedBox(height: 8),
        OutlinedButton(onPressed: () {}, child: const Text('Outlined Button')),
        const SizedBox(height: 8),
        TextButton(onPressed: () {}, child: const Text('Text Button')),
      ],
    );
  }

  Widget _buildCardsShowcase(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card Title',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  '카드 컴포넌트입니다. 기본 간격과 스타일이 적용되어 있습니다.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('간격 시스템', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  'xs: 4px | sm: 8px | md: 16px | lg: 24px | xl: 32px',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputShowcase(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'your@email.com',
          ),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: '비밀번호 입력',
            suffixIcon: Icon(Icons.visibility_off),
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
