// lib/permissions_temp.dart
import 'package:flutter/material.dart';

class PermissionsGrid extends StatelessWidget {
  const PermissionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Permission Grid',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set arrow color to white
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 3 / 2, // Keeps the previous size
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: 5, // Number of images
        itemBuilder: (context, index) {
          // Image asset paths and labels
          final imageNames = ['white1', 'white2', 'white3', 'white4', 'white5'];
          final labels = [
            'Duty Leave',
            'Electronic Device',
            'Permission to Leave Campus',
            'Weekend Leave',
            'Custom'
          ];

          final imageName = imageNames[index];
          final label = labels[index];

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black, width: 2.0),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/img/$imageName.png', // Asset image path
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
