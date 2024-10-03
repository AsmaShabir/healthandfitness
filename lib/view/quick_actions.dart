import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickActionsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Start workout
          },
          icon: Icon(Icons.directions_run),
          label: Text("Start Workout"),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Log meal
          },
          icon: Icon(Icons.fastfood),
          label: Text("Log Meal"),
        ),
      ],
    );
  }
}