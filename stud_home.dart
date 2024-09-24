import 'package:flutter/material.dart';
import 'side_menu_stud.dart'; // Import the custom drawer file
import 'permissions_temp.dart'; // Import the new permissions grid file

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Permission Manager',
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode
          ? ThemeData.dark()
          : ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: PermissionManager(
        toggleTheme: _toggleTheme,
        isDarkMode: _isDarkMode, // Pass the isDarkMode state
      ),
    );
  }
}

class PermissionManager extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const PermissionManager({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  _PermissionManagerState createState() => _PermissionManagerState();
}

class _PermissionManagerState extends State<PermissionManager> {
  String _selectedFilter = 'ALL';
  String _searchQuery = '';
  final List<Map<String, dynamic>> _permissions = [
    {
      'title': 'Duty Leave',
      'status': 'PENDING',
      'date': '22 AUG 2024',
      'to': 'XYZ',
      'reason': null, // Simulating a null value here
    },
    {
      'title': 'Electronic Device Permission',
      'status': 'ACCEPTED',
      'date': '12 AUG 2024',
      'to': 'XYZ',
      'reason': 'Project requirement',
    },
    {
      'title': 'Custom',
      'status': 'DENIED',
      'date': '19 JUL 2024',
      'to': 'XYZ',
      'reason': '',
    },
  ];

  Color? getStatusColor(String status) {
    switch (status) {
      case 'PENDING':
        return Colors.yellow[700];
      case 'ACCEPTED':
        return Colors.green;
      case 'DENIED':
        return Colors.red[800];
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Opens the drawer on click
            },
          ),
        ),
        toolbarHeight: 48.0,
      ),
      drawer: AppDrawer( // Use the custom drawer here
        toggleTheme: widget.toggleTheme,
        isDarkMode: widget.isDarkMode,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: const TextStyle(fontSize: 12.0),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFilter = 'ALL';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 2.0),
                    textStyle: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold
                    ),
                    elevation: _selectedFilter == 'ALL' ? 5.0 : 0.0,
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: const Text('ALL', style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFilter = 'ACCEPTED';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
                    textStyle: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold
                    ),
                    elevation: _selectedFilter == 'ACCEPTED' ? 5.0 : 0.0,
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: const Text('APPROVED', style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFilter = 'PENDING';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                    textStyle: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold
                    ),
                    elevation: _selectedFilter == 'PENDING' ? 5.0 : 0.0,
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: const Text('PENDING', style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFilter = 'DENIED';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
                    textStyle: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold
                    ),
                    elevation: _selectedFilter == 'DENIED' ? 5.0 : 0.0,
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: const Text('DENIED', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _permissions.length,
                itemBuilder: (context, index) {
                  var permission = _permissions[index];

                  if ((_selectedFilter == 'ALL' || permission['status'] == _selectedFilter) &&
                      (_searchQuery.isEmpty || permission['title'].toLowerCase().contains(_searchQuery.toLowerCase()))) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: getStatusColor(permission['status']),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  permission['status'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  permission['date'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Container(
                            padding: const EdgeInsets.all(6.0),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  permission['title'].toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text('TO: ${permission['to']}', style: const TextStyle(fontSize: 12.0)),
                                Text('REASON: ${permission['reason'] ?? 'No reason provided'}', style: const TextStyle(fontSize: 12.0)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PermissionsGrid()), // Navigate to PermissionsGrid
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
