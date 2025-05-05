import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('')),
      sideBar: SideBar(
        items: const [
          // All items in one layer - no nesting
          AdminMenuItem(
            title: 'Dashboard',
            route: 'HomeScreen',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'ADD SELLERS',
            route: '/firstLevelItem1',
            icon: Icons.person_add,
          ),
          AdminMenuItem(
            title: 'DELETE SELLERS',
            route: '/firstLevelItem2',
            icon: Icons.person_remove,
          ),
          AdminMenuItem(
            title: 'ADD BUYERS',
            route: '/secondLevelItem1',
            icon: Icons.person_add_alt,
          ),
          AdminMenuItem(
            title: 'DELETE BUYERS',
            route: '/secondLevelItem2',
            icon: Icons.person_remove,
          ),
          AdminMenuItem(
            title: 'VIEW ORDERS',
            route: '/thirdLevelItem1',
            icon: Icons.shopping_bag,
          ),
          AdminMenuItem(
            title: 'SEE REPORTS',
            route: '/thirdLevelItem2',
            icon: Icons.analytics,
          ),
          AdminMenuItem(
            title: 'LOGOUT',
            route: '/thirdLevelItem2',
            icon: Icons.exit_to_app,
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
          if (item.route != null) Navigator.pushNamed(context, item.route!);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color.fromARGB(255, 250, 248, 248),
          child: const Center(
            child: Text(
              'ADMIN PANEL',
              style: TextStyle(color: Color.fromARGB(255, 2, 1, 1)), 
            ),
          ),
        ),
       
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Dashboard',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
          ),
        ),
      ),
    );
  }
}