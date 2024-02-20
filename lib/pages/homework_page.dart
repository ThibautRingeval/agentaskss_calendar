import 'package:flutter/material.dart';
import 'package:agentaskss_calendar/pages/creation_homework_page.dart';

class HomeworkPage extends StatefulWidget {
  const HomeworkPage({Key? key}) : super(key: key);

  @override
  State<HomeworkPage> createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {
  List<String> homeworkList = [];

  // Function to add homework to the list
  void addHomework(String description, String deliveryMethod, DateTime? dateTime) {
    String newHomework = 'Description: $description, Method: $deliveryMethod, Date: $dateTime';
    setState(() {
      homeworkList.add(newHomework);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Homework'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          _buildTaskSection('Morning Tasks'),
          _buildTaskSection('Afternoon Tasks'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreationHomeworkPage(onHomeworkAdded: addHomework),
            ),
          );
        },
        backgroundColor: const Color(0xFFCA9700),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskSection(String title) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          // Add your tasks or content for each section
          // For example, you can use a ListView.builder for a list of tasks
        ],
      ),
    );
  }
}
