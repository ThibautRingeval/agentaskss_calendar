import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:agentaskss_calendar/pages/main_menu.dart';
import 'package:http/http.dart' as http;

class ConnectPage extends StatefulWidget {
  const ConnectPage({Key? key}) : super(key: key);

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _password = '';
  bool _rememberMe = false;

  Future<void> authenticateUser(String name, String password) async {
    final response = await http.get(
      Uri.parse('https://65d3bf11522627d501097eb0.mockapi.io/api/v1/users'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> users = json.decode(response.body);

      for (final user in users) {
        if (user['name'] == name && user['password'] == password) {
          // Authentication successful
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainMenu(),
            ),
          );
          return;
        }
      }
    }

    // Authentication failed
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Authentication failed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCA9700),
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  style: const TextStyle(color: Color(0xFFCA9700)),
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                    hintText: 'John Doe',
                    labelStyle: TextStyle(
                      color: Color(0xFFCA9700),
                    ),
                    hintStyle: TextStyle(color: Color(0xFFCA9700)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir votre nom.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  style: const TextStyle(color: Color(0xFFCA9700)),
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                    labelStyle: TextStyle(
                      color: Color(0xFFCA9700),
                    ),
                    hintStyle: TextStyle(color: Color(0xFFCA9700)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir votre mot de passe.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                      checkColor: const Color(0xFFCA9700),
                    ),
                    const Text(
                      'Se souvenir de moi',
                      style: TextStyle(
                        color: Color(0xFFCA9700),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      authenticateUser(_name, _password);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCA9700),
                    fixedSize: const Size(367, 102),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
