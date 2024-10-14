import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:healthandfitness/view_model/health_view_model.dart';

class Details extends StatelessWidget {
  final TextEditingController weightController = TextEditingController();

  final TextEditingController heightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" User Details"),
      backgroundColor:Color(0xFFF1f305c) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10,),

            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF1f305c)),
                borderRadius: BorderRadius.circular(35),
              ),
              child: TextField(
                controller: weightController,
                decoration: InputDecoration(
                  label: Text('weight(kg)'),
                    labelStyle: GoogleFonts.azeretMono(color: Color(0xFFF1f305c)),
                    // labelText: "Weight (kg)",
                  border: OutlineInputBorder(borderSide: BorderSide.none),

                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 30,),

            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF1f305c)),
                borderRadius: BorderRadius.circular(35),
              ),
              child: TextField(
                controller: heightController,
                decoration: InputDecoration(
                    labelText: "height (m)",
                  labelStyle: GoogleFonts.azeretMono(color: Color(0xFFF1f305c)),

                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 30,),

            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF1f305c)),
                borderRadius: BorderRadius.circular(35),
              ),
              child: TextField(
                controller: heightController,
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.line_weight),
                    labelText: "gender",
                  labelStyle: GoogleFonts.azeretMono(color: Color(0xFFF1f305c)),

                  border: OutlineInputBorder(borderSide: BorderSide.none),

                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF1f305c)),
                borderRadius: BorderRadius.circular(35),
              ),
              child: TextField(
                controller: heightController,
                decoration: InputDecoration(
                    labelText: "height (m)",
                  labelStyle: GoogleFonts.azeretMono(color: Color(0xFFF1f305c)),

                  border: OutlineInputBorder(borderSide: BorderSide.none),

                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xFFF1f305c),
                borderRadius: BorderRadius.circular(25)
              ),
              child: MaterialButton(
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
                child: Text("Save",style: GoogleFonts.azeretMono(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
