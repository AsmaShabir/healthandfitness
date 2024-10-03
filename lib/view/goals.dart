import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoalsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("Goals"),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(child: _buildGoalItem("Steps Goal", "10,000", "45%")),
              Flexible(child: _buildGoalItem("Calories Goal", "500 kcal", "60%")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGoalItem(String goal, String value, String progress) {
    // Remove '%' and parse the number as a double
    double progressValue = double.parse(progress.replaceAll('%', '')) / 100;

    return Column(
      children: [
        Text(goal),
        Text(value, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        LinearProgressIndicator(value: progressValue),
        Text("$progress Complete"),
      ],
    );
  }
}
