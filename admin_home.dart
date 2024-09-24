import 'package:flutter/material.dart';
import 'side_menu_admin.dart'; // Import the custom drawer
import 'admin_profile_mini.dart'; // Import the profile widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Permission Management',
      theme: ThemeData(
        brightness: Brightness.light, // Set brightness to light for white background
        primaryColor: Colors.white,
      ),
      home: AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Permission Management',
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        backgroundColor: Colors.black, // AppBar background color black
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white), // Menu icon color white
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.person, color: Colors.white), // Profile icon color white
            onSelected: (value) {
              if (value == 'View Profile') {
                // Handle view profile action
              } else if (value == 'Logout') {
                // Handle logout action
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  enabled: false, // Disable this item to show as just profile info
                  child: Container(
                    color: Colors.black45, // Set background color to white
                    child: ProfileWidget(), // Use the new profile widget
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'View Profile',
                  child: Text(
                    'View Profile',
                    style: TextStyle(
                      color: Colors.white, // Text color white
                    ),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red, // Text color red for logout
                    ),
                  ),
                ),
              ];
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners for the popup menu
            ),
            color: Colors.black, // Menu background color black
            elevation: 8, // Shadow for a more attractive appearance
          ),
        ],
      ),
      drawer: CustomDrawer(), // Use the custom drawer
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Example request received section with date
            const Text(
              '22 AUG 2024',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black, // Set text color to black
              ),
            ),
            const SizedBox(height: 16),
            // Sample requests (can be ListView.builder in a real case)
            requestCard('KH.EN.I5MCA22105', 'XYZ', '2:00'),
            requestCard('KH.EN.I5MCA22027', 'XYZ', '2:00'),
            requestCard('KH.EN.I5MCA22078', 'XYZ', '2:00'),
            requestCard('KH.EN.I5MCA22105', 'XYZ', '2:00'),
          ],
        ),
      ),
    );
  }

  // Widget for individual request card
  Widget requestCard(String studentId, String name, String time) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300], // Light grey for request cards
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: ListTile(
        title: Text(
          studentId,
          style: const TextStyle(color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NAME : $name', style: const TextStyle(color: Colors.black)),
            Text('TIME : $time', style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
