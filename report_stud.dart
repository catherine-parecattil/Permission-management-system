import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  // Mock data: Replace this with actual data retrieval from your database
  final List<Map<String, dynamic>> allRequests = [
    {'date': DateTime.now(), 'status': 'Accepted', 'details': 'Request details here'},
    {'date': DateTime.now().subtract(const Duration(days: 1)), 'status': 'Pending', 'details': 'Request details here'},
    // Add more items as needed
  ];

  String _selectedStatus = 'All';
  DateTimeRange? _selectedDateRange;

  @override
  Widget build(BuildContext context) {
    final filteredRequests = allRequests.where((request) {
      final matchesStatus = _selectedStatus == 'All' || request['status'] == _selectedStatus;
      final matchesDate = _selectedDateRange == null ||
          (request['date'] as DateTime).isAfter(_selectedDateRange!.start) &&
              (request['date'] as DateTime).isBefore(_selectedDateRange!.end);

      return matchesStatus && matchesDate;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generate Report',
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
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white, // Background color of the dropdown container
                    ),
                    child: DropdownButton<String>(
                      value: _selectedStatus,
                      onChanged: (value) {
                        setState(() {
                          _selectedStatus = value!;
                        });
                      },
                      items: <String>['All', 'Accepted', 'Pending', 'Denied']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      underline: const SizedBox(), // Remove underline
                      isExpanded: true,
                      style: const TextStyle(color: Colors.black),
                      dropdownColor: Colors.white, // Background color of the dropdown menu
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
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
              padding: const EdgeInsets.all(16.0),
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
                    title: Text('Status: ${request['status']}'),
                    subtitle: Text('Details: ${request['details']}'),
                    trailing: Text('Date: ${request['date'].toLocal()}'),
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
