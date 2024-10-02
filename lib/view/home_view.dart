import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/health_view_model.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final healthViewModel = Provider.of<HealthViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Health & Fitness')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Steps: ${healthViewModel.healthData?.steps ?? 0}'),
            Text('Blood Glucose: ${healthViewModel.healthData?.bloodGlucose ?? 0.0}'),
            ElevatedButton(
              onPressed: () {
                healthViewModel.healthFunc();
              },
              child: Text('Get Health Data'),
            ),
          ],
        ),
      ),
    );
  }
}
