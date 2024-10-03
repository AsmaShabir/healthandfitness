import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthandfitness/view_model/health_view_model.dart';
import 'package:provider/provider.dart';

class ActivitySummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final healthModel =Provider.of<HealthViewModel>(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Today's Activity"),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActivityItem("Steps", healthModel.healthData?.steps ?? 0),
                // _buildActivityItem("Calories", ),
                // _buildActivityItem("Distance", ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(String label, int value) {
    return Column(
      children: [
        Text(value.toString(), style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }
}