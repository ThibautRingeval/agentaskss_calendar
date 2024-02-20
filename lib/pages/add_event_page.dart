import 'package:flutter/material.dart';
import 'package:agentaskss_calendar/pages/main_menu.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();
  bool acceptCgu = false;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  hintText: 'John Doe',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un nom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un mot de passe';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                controller: confirmPasswordController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Confirmer le mot de passe',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez confirmer le mot de passe';
                  } else if (value != passwordController.text) {
                    return 'Les mots de passe ne correspondent pas';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Mail',
                  hintText: 'john.doe@example.com',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un e-mail';
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                    return 'Veuillez saisir une adresse e-mail valide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Numéro de téléphone',
                  hintText: '+1234567890',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un numéro de téléphone';
                  } else if (!RegExp(r'^\+\d{8,15}$').hasMatch(value)) {
                    return 'Veuillez saisir un numéro de téléphone valide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: acceptCgu,
                    onChanged: (value) {
                      setState(() {
                        acceptCgu = value!;
                      });
                    },
                  ),
                  const Text(
                    'J\'accepte les CGU',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && acceptCgu) {
                    // Proceed to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainMenu(),
                      ),
                    );
                  } else {
                    // Show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Veuillez remplir tous les champs et accepter les CGU.'),
                      ),
                    );
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
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
