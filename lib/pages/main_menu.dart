import 'package:agentaskss_calendar/pages/homework_page.dart';
import 'package:agentaskss_calendar/pages/profile_page.dart';
import 'package:flutter/material.dart';

import 'calendar_user.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CalendarUser(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFCA9700),
            fixedSize: const Size(367, 102),
          ),
          child: const Text(
            'Accéder à l\'agenda',
            style: TextStyle(
              fontSize: 20, // Set your desired font size
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeworkPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFCA9700),
            fixedSize: const Size(367, 102),
          ),
          child: const Text(
            'Ajouter un devoir',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFCA9700),
            fixedSize: const Size(367, 102),
          ),
          child: const Text(
            'Profil',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
