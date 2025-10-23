import 'package:flutter/material.dart';
import '../core/widgets/app_card.dart';
import '../core/theme/app_spacing.dart';
import '../core/theme/app_radius.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: AppSpacing.all(AppSpacing.screenPadding),
        children: [
          CircleAvatar(
            radius: AppRadius.xl * 2,
            child: Icon(Icons.person, size: AppRadius.xl * 2),
          ),
          AppSpacing.verticalMD(),
          Text(
            'User Name',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          AppSpacing.verticalSM(),
          Text(
            'user@example.com',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          AppSpacing.verticalXL(),
          AppListCard(
            leading: const Icon(Icons.settings),
            title: 'Settings',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          AppListCard(
            leading: const Icon(Icons.notifications),
            title: 'Notifications',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          AppListCard(
            leading: const Icon(Icons.privacy_tip),
            title: 'Privacy',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          AppListCard(
            leading: const Icon(Icons.help),
            title: 'Help & Support',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          AppListCard(
            leading: const Icon(Icons.info),
            title: 'About',
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          AppSpacing.verticalXL(),
          // 스크롤 테스트를 위한 추가 아이템들
          ...List.generate(
            20,
            (index) => AppListCard(
              leading: const Icon(Icons.list),
              title: 'Item ${index + 1}',
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
