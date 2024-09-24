import 'package:flutter/material.dart';
import 'report_admin.dart';


class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // Set background to white
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Push content to top and bottom
          children: <Widget>[
            // Drawer Header and menu items at the top
            Column(
              children: [
                // Adjusted the DrawerHeader to align the icon and text to the left
                Container(
                  width: double.infinity, // Make the profile part fill the width
                  color: Colors.black, // Make the background black
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Add some padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
                    children: <Widget>[
                      const SizedBox(height: 30), // Increase this value to adjust the distance from the top
                      CircleAvatar(
                        backgroundColor: Colors.grey[700], // Darker grey for contrast with black background
                        radius: 40, // Larger avatar size
                        child: const Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                      const SizedBox(height: 15), // Space between the avatar and text
                      const Text(
                        'ADMIN ID',
                        style: TextStyle(
                          color: Colors.white, // White text for contrast
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'ABCD XYZ',
                        style: TextStyle(
                          color: Colors.white70, // Slightly dimmed white for secondary text
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                // Styled 'ADD' ExpansionTile to look more like a dropdown
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    leading: Icon(Icons.add_circle_outline, color: Colors.black), // Set icon color to black
                    title: Text(
                      'ADD',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_drop_down, color: Colors.black), // Arrow icon for dropdown indication
                    backgroundColor: Colors.white, // Set background for the expanded tile items
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color for submenu
                          borderRadius: BorderRadius.circular(8), // Rounded corners for submenu
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // Subtle shadow for depth
                              blurRadius: 4,
                              offset: Offset(0, 2), // Shadow offset
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0), // Margin around the drop-down container
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('Students'),
                              onTap: () {
                                // Handle Students tap
                              },
                              leading: Icon(Icons.people, color: Colors.black), // Add icon to list tile
                            ),
                            Divider(height: 1, color: Colors.grey[300]), // Subtle divider between items
                            ListTile(
                              title: Text('Faculty'),
                              onTap: () {
                                // Handle Faculty tap
                              },
                              leading: Icon(Icons.work, color: Colors.black), // Add icon to list tile
                            ),
                            Divider(height: 1, color: Colors.grey[300]),
                            ListTile(
                              title: Text('Programme'),
                              onTap: () {
                                // Handle Programme tap
                              },
                              leading: Icon(Icons.book, color: Colors.black), // Add icon to list tile
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.bar_chart, color: Colors.black), // Set icon color to black
                  title: const Text('GENERATE REPORT', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GenerateReportPage()), // Navigate to the report page
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock_outline, color: Colors.black), // Set icon color to black
                  title: const Text('UPDATE PASSWORD', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Handle UPDATE PASSWORD tap
                  },
                ),
              ],
            ),

            // Logo and brightness icon at the bottom
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('assets/img/logo.png', height: 30, width: 30), // Add your logo here
                  Icon(Icons.brightness_medium, color: Colors.black), // Brightness (sun) icon, now in black
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}