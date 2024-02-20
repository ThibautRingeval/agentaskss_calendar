import 'package:flutter/material.dart';

typedef AddHomeworkCallback = void Function(String description, String deliveryMethod, DateTime? dateTime);

class CreationHomeworkPage extends StatefulWidget {
  const CreationHomeworkPage({Key? key, required this.onHomeworkAdded}) : super(key: key);

  final AddHomeworkCallback onHomeworkAdded;

  @override
  State<CreationHomeworkPage> createState() => _CreationHomeworkPageState();
}

class _CreationHomeworkPageState extends State<CreationHomeworkPage> {
  final TextEditingController descriptionController = TextEditingController();
  String selectedDeliveryMethod = '';
  DateTime? selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Ajouter un devoir'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Ajouter un devoir',
                style: TextStyle(
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Description (280 caractères max)',
                  hintText: 'Saisissez la description du devoir',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                ),
                maxLength: 280,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16.0),
              _buildDeliveryMethodRadio(),
              const SizedBox(height: 16.0),
              _buildDateTimePicker(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String description = descriptionController.text;
                  if (description.isNotEmpty && selectedDeliveryMethod.isNotEmpty && selectedDateTime != null) {
                    widget.onHomeworkAdded(description, selectedDeliveryMethod, selectedDateTime);
                    Navigator.pop(context);
                  } else {
                    // Add error handling or display a message for incomplete data
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCA9700),
                  fixedSize: const Size(367, 102),
                ),
                child: const Text(
                  'Valider',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryMethodRadio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Choix de l\'endroit de rendu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8.0),
        _buildRadioTile('Mail', 'mail'),
        _buildRadioTile('360 Learning', '360_learning'),
        _buildRadioTile('GitHub', 'github'),
      ],
    );
  }

  Widget _buildRadioTile(String title, String value) {
    return RadioListTile<String>(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      value: value,
      groupValue: selectedDeliveryMethod,
      onChanged: (newValue) {
        setState(() {
          selectedDeliveryMethod = newValue!;
        });
      },
    );
  }

  Widget _buildDateTimePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Rappel',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 1),
            );

            if (pickedDate != null) {
              // ignore: use_build_context_synchronously
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (pickedTime != null) {
                setState(() {
                  selectedDateTime = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );
                });
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFCA9700),
          ),
          child: const Text('Sélectionner une date et une heure'),
        ),
        if (selectedDateTime != null)
          Text(
            'Date et heure sélectionnées : ${selectedDateTime!.toLocal()}',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
      ],
    );
  }
}
