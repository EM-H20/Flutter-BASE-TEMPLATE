import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        primary: true, // PrimaryScrollController 사용 활성화
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),
          const SizedBox(height: 16),
          Text(
            'User Name',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'user@example.com',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          _buildProfileItem(context, Icons.settings, 'Settings'),
          _buildProfileItem(context, Icons.notifications, 'Notifications'),
          _buildProfileItem(context, Icons.privacy_tip, 'Privacy'),
          _buildProfileItem(context, Icons.help, 'Help & Support'),
          _buildProfileItem(context, Icons.info, 'About'),
          const SizedBox(height: 32),
          // 스크롤 테스트를 위한 추가 아이템들
          ...List.generate(
            20,
            (index) => _buildProfileItem(
              context,
              Icons.list,
              'Item ${index + 1}',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(BuildContext context, IconData icon, String title) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
