import 'package:flutter/material.dart';

class TrashPage extends StatefulWidget {
  @override
  _TrashPageState createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  DateTimeRange? _selectedDateRange;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> deletedRequests = [
      {'image': 'assets/img/white1.png', 'title': 'Duty Leave', 'date': '2024-09-10'},
      {'image': 'assets/img/white2.png', 'title': 'Electronic Device', 'date': '2024-09-12'},
      // Add more items as needed
    ];

    final filteredRequests = _selectedDateRange == null
        ? deletedRequests
        : deletedRequests.where((request) {
      final requestDate = DateTime.parse(request['date']!);
      return requestDate.isAfter(_selectedDateRange!.start) &&
          requestDate.isBefore(_selectedDateRange!.end);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Deleted Requests',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set arrow color to white
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the button horizontally
              children: [
                SizedBox(
                  width: 150, // Adjust this width as needed
                  child: ElevatedButton(
                    onPressed: () async {
                      final selectedDateRange = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                        initialDateRange: _selectedDateRange,
                      );
                      if (selectedDateRange != null) {
                        setState(() {
                          _selectedDateRange = selectedDateRange;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                      foregroundColor: Colors.black, // Text color
                      side: const BorderSide(color: Colors.black, width: 2.0), // Border color and width
                      padding: const EdgeInsets.symmetric(vertical: 8.0), // Adjust padding for height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Adjust border radius
                      ),
                    ),
                    child: Text(
                      _selectedDateRange == null
                          ? 'Select Date Range'
                          : 'Selected: ${_selectedDateRange!.start.toLocal()} - ${_selectedDateRange!.end.toLocal()}',
                      textAlign: TextAlign.center, // Center text horizontally
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: filteredRequests.length,
              itemBuilder: (context, index) {
                final request = filteredRequests[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black, width: 2.0),
                  ),
                  child: ListTile(
                    leading: Image.asset(request['image']!, fit: BoxFit.cover),
                    title: Text(request['title']!),
                    subtitle: Text('Date: ${request['date']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
