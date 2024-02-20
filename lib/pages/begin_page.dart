import 'package:flutter/material.dart';
import 'package:agentaskss_calendar/pages/add_event_page.dart';
import 'package:agentaskss_calendar/pages/connect_page.dart';

class BeginPage extends StatelessWidget {
  const BeginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bienvenue sur",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            const SizedBox(height: 50),
            Image.asset("assets/images/logo.png"),
            SizedBox(
              width: 311.55,
              height: 94.64,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddEventPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ), backgroundColor: const Color(0xFFFAD053),
                  alignment: Alignment.center, // Alignement du texte au centre
                ),
                child: const Text(
                  "S'enregistrer",
                  style: TextStyle(
                    fontSize: 27,
                    color: Color(0xFF6C6700),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Ajoutez un espace entre les boutons
            SizedBox(
              width: 311.55,
              height: 94.64,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConnectPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ), backgroundColor: const Color(0xFFFAD053),
                  alignment: Alignment.center, // Alignement du texte au centre
                ),
                child: const Text(
                  "Se Connecter",
                  style: TextStyle(
                    fontSize: 27,
                    color: Color(0xFF6C6700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
