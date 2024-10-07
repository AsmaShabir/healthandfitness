import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthandfitness/view_model/health_view_model.dart';
import 'package:provider/provider.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  void initState() {
    super.initState();
    final healthViewModel = Provider.of<HealthViewModel>(context, listen: false);
    healthViewModel.startListeningForSteps(); // Ensure this method is defined in your ViewModel
  }

  @override
  void dispose() {
    final healthViewModel = Provider.of<HealthViewModel>(context, listen: false);
    healthViewModel.stopListeningForSteps(); // Ensure this method is defined in your ViewModel
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use Provider to get the HealthViewModel instance
    final healthViewModel = Provider.of<HealthViewModel>(context);

    return Scaffold(
      backgroundColor: Color(0xFFF1f305c),
      body: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(70, 100)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Color(0xFFF1f305c)),
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Steps:", style: GoogleFonts.poppins(color: Color(0xFFF1f305c), fontSize: 13, fontWeight: FontWeight.w500)),
                      SizedBox(height: 8.0),
                      Consumer<HealthViewModel>(
                      builder: (context, healthViewModel, child) {
                       return _buildActivityItem("Steps", healthViewModel.steps ?? 0);// Use null coalescing operator

                      }
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Calories Burnt:", style: GoogleFonts.poppins(color: Color(0xFFF1f305c), fontSize: 13, fontWeight: FontWeight.w500)),
                      SizedBox(height: 8.0),
                      Consumer<HealthViewModel>(
                           builder: (context, healthViewModel, child) {
                             return
                               _buildActivityItem("Calories Burnt", (healthViewModel.caloriesBurned ?? 0).round()); // Use null coalescing operator

                           }
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Distance:", style: GoogleFonts.poppins(color: Color(0xFFF1f305c), fontSize: 13, fontWeight: FontWeight.w500)),
                      SizedBox(height: 8.0),
                      Consumer<HealthViewModel>(
                       builder: (context, healthViewModel, child) {
                        return _buildActivityItem("Distance", (healthViewModel.distanceWalked ?? 0).round()); // Use null coalescing operator

                       }
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 356.7,
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF1f305c),
                borderRadius: BorderRadius.only(topRight: Radius.elliptical(170, 200)),
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/activity.png'),
                  SizedBox(width: 7),
                  Text('Activity', style: GoogleFonts.azeretMono(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String label, int value) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xFFFd8efff),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value.toString(), style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          Text(label),
        ],
      ),
    );
  }
}
