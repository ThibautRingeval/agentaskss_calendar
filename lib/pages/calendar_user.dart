import 'package:flutter/material.dart';

class CalendarUser extends StatelessWidget {
  const CalendarUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: const Color(0xFFCA9700),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the main menu
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_left),
            onPressed: () {
              // Handle changing to the previous day
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_right),
            onPressed: () {
              // Handle changing to the next day
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black, // Set the background color to black
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: _buildTaskSection('Morning Tasks', 'Maths - 8h à 12h'),
              ),
            ),
            Expanded(
              child: Container(
                child: _buildTaskSection('Afternoon Tasks', 'Science - 13h à 17h'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskSection(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.black,
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
          Container(
            width: double.infinity,
            height: 221, // Adjust the height as needed
            color: Colors.grey, // Color of the square
            child: Center(
              child: Text(
                content,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),
                textAlign: TextAlign.center,
              ),
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

void main() {
  runApp(const MaterialApp(
    home: CalendarUser(),
  ));
}
