import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Set a fixed width for the profile widget
      padding: const EdgeInsets.all(8.0),
      color: Colors.black, // Set the background color to white
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300], // Light grey for the avatar background
            radius: 30,
            child: const Icon(Icons.person, size: 40, color: Colors.black), // Keep the icon black
          ),
          const SizedBox(height: 10),
          const Text(
            'ICTS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white, // Change profile name color to black for contrast
            ),
          ),
          const Text(
            'Admin ID: ADMIN123',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70, // Change subdued color for Admin ID to black
            ),
          ),
          const Divider(
            color: Colors.grey, // Use a light grey for the divider
            thickness: 1,
          ),
        ],
      ),
    );
  }
}