import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:healthandfitness/view_model/health_view_model.dart';

class Details extends StatelessWidget {
  final TextEditingController weightController = TextEditingController();

  final TextEditingController heightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: "Weight (kg)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: heightController,
              decoration: InputDecoration(labelText: "height (m)"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Retrieve the values from the controllers
                final weight = double.tryParse(weightController.text);
                final height = double.tryParse(heightController.text);

                // Check if the inputs are valid
                if (weight != null && height != null) {
                  // Access HealthViewModel and save preferences
                  Provider.of<HealthViewModel>(context, listen: false)
                      .savePreferences(weight, height);
                  // Optionally show a success message or navigate back
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Preferences saved!")),
                  );
                  Navigator.pop(context); // Go back to the previous screen
                } else {
                  // Show an error message if inputs are invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter valid numbers.")),
                  );
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
