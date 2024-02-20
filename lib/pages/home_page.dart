import 'package:flutter/material.dart';

import 'begin_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Renouveau de l’EPSI:",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 50),
            const Text(
              "Bienvenue sur notre application",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "INCROYABLE",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 311.55,
              height: 94.64,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BeginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: const Color(0xFFFAD053),
                  alignment: Alignment.center, // Alignement du bouton complet
                ),
                child: Text(
                  "Appuyez pour commencer",
                  style: TextStyle(
                    fontSize: 27,
                    color: Color(0xFF6C6700),
                  ),
                  textAlign: TextAlign.center, // Alignement du texte au centre
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
