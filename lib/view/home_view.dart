import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, [User Name]!"),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to Profile Screen
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ActivitySummaryCard(),
          HealthMetricsCard(),
          GoalsCard(),
          QuickActionsRow(),
          ProgressVisualization(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "Workout"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
// child: Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     Text('Steps: ${healthViewModel.healthData?.steps ?? 0}'),
//     Text('Blood Glucose: ${healthViewModel.healthData?.bloodGlucose ?? 0.0}'),
//     ElevatedButton(
//       onPressed: () {
//         healthViewModel.healthFunc();
//       },
//       child: Text('Get Health Data'),
//     ),
//   ],
// ),