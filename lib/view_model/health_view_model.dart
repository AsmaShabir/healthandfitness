import 'package:flutter/cupertino.dart';
import 'package:health/health.dart';

import '../model/health_model.dart';


class HealthViewModel with ChangeNotifier {
  Health? _health ;
  Health? get health=>_health;
  HealthData? _healthData;
  HealthData? get healthData => _healthData;
  healthFunc()async{
    Health().configure();
    // Initialize the HealthFactory

    // Define the types to get
    var types = [
      HealthDataType.STEPS,
      HealthDataType.BLOOD_GLUCOSE,
    ];

    // Request access to the data types before reading them
    bool? requested = await health?.requestAuthorization(types);

    var now = DateTime.now();

    // Fetch health data from the last 24 hours
    List<HealthDataPoint>? healthData = await health?.getHealthDataFromTypes(
        now.subtract(Duration(days: 1)), now, types, types: [], startTime: null, endTime: null);

    // Request permissions to write steps and blood glucose
    var permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
    ];
    await health?.requestAuthorization(types, permissions: permissions);

    // Write steps and blood glucose
    bool success = await health.writeHealthData(10, HealthDataType.STEPS, now, now);
    success &= await health.writeHealthData(3.1, HealthDataType.BLOOD_GLUCOSE, now, now);

    // Manual recording method (optional, for Android and iOS)
    success &= await health.writeHealthData(
        10,
        HealthDataType.STEPS,
        now,
        now,
        recordingMethod: RecordingMethod.manual);

    // Get the number of steps for today
    var midnight = DateTime(now.year, now.month, now.day);
    int? steps = await health?.getTotalStepsInInterval(midnight, now);
notifyListeners();
  }
}


