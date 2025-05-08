import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_options.dart'; // Your generated file from FlutterFire CLI

final userDataProvider = StreamProvider<DocumentSnapshot>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) throw Exception('No user logged in');
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .snapshots();
});

class UserDashboard extends ConsumerWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Water System Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: userAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text('Error: ${error.toString()}'),
          ),
          data: (userSnapshot) {
            if (!userSnapshot.exists) {
              return const Center(child: Text('User data not found'));
            }
            final userData = userSnapshot.data() as Map<String, dynamic>?;
            if (userData == null) {
              return const Center(child: Text('Invalid user data'));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserHeader(userData),
                const SizedBox(height: 24),
                Expanded(child: _buildDashboardGrid()),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildUserHeader(Map<String, dynamic> userData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, ${userData['fullName'] ?? 'User'}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16),
            const SizedBox(width: 4),
            Text(
              userData['location'] ?? 'Ilala, Dar es Salaam',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDashboardGrid() {
    const dashboardItems = [
      DashboardItem(
        icon: Icons.water_drop, // Replaced CommunityIcons
        title: 'Water Request',
        badgeCount: 0,
      ),
      DashboardItem(
        icon: Icons.list_alt,
        title: 'Order Status',
        badgeCount: 2,
      ),
      DashboardItem(
        icon: Icons.report_problem,
        title: 'Report Problems',
        badgeCount: 1,
      ),
      DashboardItem(
        icon: Icons.person,
        title: 'Account',
      ),
      DashboardItem(
        icon: Icons.contact_support,
        title: 'Contact Supplier',
      ),
      DashboardItem(
        icon: Icons.location_searching,
        title: 'Track Location',
      ),
      DashboardItem(
        icon: Icons.history,
        title: 'View Story',
      ),
      DashboardItem(
        icon: Icons.help,
        title: 'Help',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: dashboardItems.length,
      itemBuilder: (context, index) {
        final item = dashboardItems[index];
        return _DashboardCard(item: item);
      },
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final DashboardItem item;

  const _DashboardCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          // Handle navigation here
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Badge(
                isLabelVisible: item.badgeCount > 0,
                label: Text(item.badgeCount.toString()),
                child: Icon(item.icon, size: 32),
              ),
              const SizedBox(height: 8),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardItem {
  final IconData icon;
  final String title;
  final int badgeCount;

  const DashboardItem({
    required this.icon,
    required this.title,
    this.badgeCount = 0,
  });
}
