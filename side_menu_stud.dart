import 'package:flutter/material.dart';
import 'profile_stud.dart'; // Import the profile page
import 'trash_stud.dart'; // Import the trash page
import 'report_stud.dart'; // Import the report page

class AppDrawer extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const AppDrawer({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.black45,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Colors.black45,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade500,
                child: const Icon(Icons.person, color: Colors.white),
              ),
              accountName: const Text('KH.EN.I5MCA22027', style: TextStyle(color: Colors.white)),
              accountEmail: const Text('CATHERINE P S', style: TextStyle(color: Colors.white)),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: const Text('Profile', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to ProfilePage
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete, color: Colors.black),
                    title: const Text('Trash', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TrashPage()), // Navigate to TrashPage
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.report, color: Colors.black),
                    title: const Text('Generate Report', style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ReportPage()), // Navigate to ReportPage
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/img/logo.png', fit: BoxFit.cover),
                ),
                IconButton(
                  icon: Icon(
                    isDarkMode ? Icons.wb_sunny_outlined : Icons.nights_stay_outlined,
                    color: Colors.black,
                  ),
                  onPressed: toggleTheme,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
