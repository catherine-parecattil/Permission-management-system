import 'package:flutter/material.dart';

class GenerateReportPage extends StatefulWidget {
  @override
  _GenerateReportPageState createState() => _GenerateReportPageState();
}

class _GenerateReportPageState extends State<GenerateReportPage> {
  String? selectedOption;
  String? selectedStudent;
  String? selectedClass;
  String? selectedDepartment;

  List<String> students = ['Student A', 'Student B', 'Student C']; // Example student list
  List<String> classes = ['Class 1', 'Class 2', 'Class 3']; // Example class list
  List<String> departments = ['Department A', 'Department B', 'Department C']; // Example department list

  List<String> filteredStudents = [];
  List<String> filteredClasses = [];
  List<String> filteredDepartments = [];

  TextEditingController studentSearchController = TextEditingController();
  TextEditingController classSearchController = TextEditingController();
  TextEditingController departmentSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredStudents = students;
    filteredClasses = classes;
    filteredDepartments = departments;
  }

  void filterStudents(String query) {
    setState(() {
      filteredStudents = students
          .where((student) => student.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void filterClasses(String query) {
    setState(() {
      filteredClasses = classes
          .where((classItem) => classItem.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void filterDepartments(String query) {
    setState(() {
      filteredDepartments = departments
          .where((department) => department.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Report'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white, // Set the background color to white
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight, // Ensure the widget takes up at least the screen height
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Option',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                DropdownButton<String>(
                  value: selectedOption,
                  items: <String>['Single Student', 'Class', 'Department']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOption = newValue;
                      selectedStudent = null;
                      selectedClass = null;
                      selectedDepartment = null;
                      filteredStudents = students;
                      filteredClasses = classes;
                      filteredDepartments = departments;
                      studentSearchController.clear();
                      classSearchController.clear();
                      departmentSearchController.clear();
                    });
                  },
                  isExpanded: true,
                  hint: Text('Select an option'),
                  style: TextStyle(color: Colors.black),
                  dropdownColor: Colors.white,
                ),
                SizedBox(height: 20),
                if (selectedOption == 'Single Student') ...[
                  Text(
                    'Select Student',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  TextField(
                    controller: studentSearchController,
                    onChanged: filterStudents,
                    decoration: InputDecoration(
                      hintText: 'Search student...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView(
                      children: filteredStudents
                          .map((student) => ListTile(
                        title: Text(student),
                        onTap: () {
                          setState(() {
                            selectedStudent = student;
                            studentSearchController.clear();
                            filteredStudents = students;
                          });
                        },
                      ))
                          .toList(),
                    ),
                  ),
                ] else if (selectedOption == 'Class') ...[
                  Text(
                    'Enter Class',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  TextField(
                    controller: classSearchController,
                    onChanged: filterClasses,
                    decoration: InputDecoration(
                      hintText: 'Search class...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView(
                      children: filteredClasses
                          .map((classItem) => ListTile(
                        title: Text(classItem),
                        onTap: () {
                          setState(() {
                            selectedClass = classItem;
                            classSearchController.clear();
                            filteredClasses = classes;
                          });
                        },
                      ))
                          .toList(),
                    ),
                  ),
                ] else if (selectedOption == 'Department') ...[
                  Text(
                    'Enter Department',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  TextField(
                    controller: departmentSearchController,
                    onChanged: filterDepartments,
                    decoration: InputDecoration(
                      hintText: 'Search department...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView(
                      children: filteredDepartments
                          .map((department) => ListTile(
                        title: Text(department),
                        onTap: () {
                          setState(() {
                            selectedDepartment = department;
                            departmentSearchController.clear();
                            filteredDepartments = departments;
                          });
                        },
                      ))
                          .toList(),
                    ),
                  ),
                ],
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle report generation logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  ),
                  child: Text('Generate Report'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
