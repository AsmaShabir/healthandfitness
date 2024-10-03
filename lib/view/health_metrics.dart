import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HealthMetricsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Health Metrics"),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildHealthMetricItem("Heart Rate", "72 bpm"),
                _buildHealthMetricItem("Sleep", "6h 45m"),
                _buildHealthMetricItem("Weight", "70 kg"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthMetricItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }
}