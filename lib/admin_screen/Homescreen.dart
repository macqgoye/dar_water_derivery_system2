import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalUsers = 0;
  int activeSellers = 0;
  int completedOrders = 0;
  int committedOrders = 0;
  List<Map<String, dynamic>> recentOrders = [];

  @override
  void initState() {
    super.initState();
    fetchDashboardData();
    fetchRecentOrders();
  }

  Future<void> fetchDashboardData() async {
    try {
      final usersSnapshot = await FirebaseFirestore.instance.collection('users').get();
      final sellersSnapshot = await FirebaseFirestore.instance.collection('sellers').get();
      final ordersSnapshot = await FirebaseFirestore.instance.collection('orders').get();
      
      // Get today's date for filtering
      final today = DateTime.now();
      final startOfDay = DateTime(today.year, today.month, today.day);
      
      // Get committed orders (created today)
      final committedOrdersQuery = await FirebaseFirestore.instance
          .collection('orders')
          .where('createdAt', isGreaterThanOrEqualTo: startOfDay)
          .get();

      setState(() {
        totalUsers = usersSnapshot.size + sellersSnapshot.size;
        activeSellers = sellersSnapshot.size;
        completedOrders = ordersSnapshot.docs
            .where((doc) => doc['status']?.toString().toLowerCase() == 'delivered')
            .length;
        committedOrders = committedOrdersQuery.size;
      });
    } catch (e) {
      print("Error fetching dashboard data: $e");
    }
  }

  Future<void> fetchRecentOrders() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .orderBy('createdAt', descending: true)
          .limit(5)
          .get();

      setState(() {
        recentOrders = querySnapshot.docs.map((doc) {
          return {
            'orderId': doc.id,
            'customer': doc['customerName'] ?? 'N/A',
            'seller': doc['sellerName'] ?? doc['sellerId'] ?? 'N/A',
            'status': doc['status'] ?? 'N/A',
          };
        }).toList();
      });
    } catch (e) {
      print("Error fetching recent orders: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(title: const Text('')),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(title: 'Dashboard', route: 'HomeScreen', icon: Icons.dashboard),
          AdminMenuItem(title: 'ADD SELLERS', route: '/firstLevelItem1', icon: Icons.person_add),
          AdminMenuItem(title: 'DELETE SELLERS', route: '/firstLevelItem2', icon: Icons.person_remove),
          AdminMenuItem(title: 'ADD BUYERS', route: '/secondLevelItem1', icon: Icons.person_add_alt),
          AdminMenuItem(title: 'DELETE BUYERS', route: '/secondLevelItem2', icon: Icons.person_remove),
          AdminMenuItem(title: 'VIEW ORDERS', route: '/thirdLevelItem1', icon: Icons.shopping_bag),
          AdminMenuItem(title: 'SEE REPORTS', route: '/thirdLevelItem2', icon: Icons.analytics),
          AdminMenuItem(title: 'LOGOUT', route: '/logout', icon: Icons.exit_to_app),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('DASHBOARD OVERVIEW', 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildDashboardCard("TOTAL USERS", totalUsers),
                  buildDashboardCard("ACTIVE SELLERS", activeSellers),
                  buildDashboardCard("COMPLETED ORDERS", completedOrders),
                  buildDashboardCard("COMMITTED ORDERS", committedOrders),
                ],
              ),
              const SizedBox(height: 30),
              const Text('RECENT ORDERS', 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              buildRecentOrdersTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDashboardCard(String title, int count) {
    return Container(
      width: 150,
      height: 100,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, 
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('$count', 
              style: const TextStyle(fontSize: 24, color: Colors.white)),
        ],
      ),
    );
  }

  Widget buildRecentOrdersTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Order ID', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Customer', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Seller', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: recentOrders.map((order) {
            return DataRow(cells: [
              DataCell(Text('#${order['orderId'].toString().substring(0, 4)}')),
              DataCell(Text(order['customer'].toString())),
              DataCell(Text(order['seller'].toString())),
              DataCell(
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: order['status'].toString().toLowerCase() == 'delivered' 
                        ? Colors.green.shade100 
                        : Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    order['status'].toString(),
                    style: TextStyle(
                      color: order['status'].toString().toLowerCase() == 'delivered' 
                          ? Colors.green.shade800 
                          : Colors.orange.shade800,
                    ),
                  ),
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}