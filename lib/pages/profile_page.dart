import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFFCA9700),
      ),
      body: Container(
        color: Colors.black, // Change the background color of the Container to black
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'New Password',
                        labelStyle: TextStyle(
                          color: Color(0xFFCA9700),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 8.0), // Reduced the SizedBox height
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          color: Color(0xFFCA9700),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 8.0), // Reduced the SizedBox height
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'New Email Address',
                        hintText: 'john.doe@example.com',
                        labelStyle: TextStyle(
                          color: Color(0xFFCA9700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0), // Reduced the SizedBox height
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'New Phone Number',
                        hintText: '+1234567890',
                        labelStyle: TextStyle(
                          color: Color(0xFFCA9700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0), // Reduced the SizedBox height
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle password change action
                // You can add logic to validate and update the password
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCA9700),
                fixedSize: const Size(367, 102),
              ),
              child: const Text(
                'Change',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
