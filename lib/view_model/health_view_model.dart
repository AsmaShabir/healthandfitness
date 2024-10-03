import 'package:flutter/cupertino.dart';
import 'package:health/health.dart';

import '../model/health_model.dart';


class HealthViewModel with ChangeNotifier {
  var health ;
  HealthData? _healthData;
  HealthData? get healthData => _healthData;
  healthFunc()async{
    Health().configure();
    // Initialize the HealthFactory

    // Define the types to get
    var types = [
      HealthDataType.STEPS,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.HEART_RATE,
      HealthDataType.ACTIVE_ENERGY_BURNED,
      HealthDataType.TOTAL_CALORIES_BURNED,
      HealthDataType.DISTANCE_WALKING_RUNNING,



    ];

    // Request access to the data types before reading them
    bool requested = await health.requestAuthorization(types);

    var now = DateTime.now();

    // Fetch health data from the last 24 hours
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        now.subtract(Duration(days: 1)), now, types);

    // Request permissions to write steps and blood glucose
    var permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
    ];
    await health.requestAuthorization(types, permissions: permissions);

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
    int? steps = await health.getTotalStepsInInterval(midnight, now);
    notifyListeners();
  }
}

//
//
// // configure the health plugin before use.
// Health().configure();
//
//
// // define the types to get
// var types = [
//   HealthDataType.STEPS,
//   HealthDataType.BLOOD_GLUCOSE,
// ];
//
// // requesting access to the data types before reading them
// bool requested = await Health().requestAuthorization(types);
//
// var now = DateTime.now();
//
// // fetch health data from the last 24 hours
// List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
// now.subtract(Duration(days: 1)), now, types);
//
// // request permissions to write steps and blood glucose
// types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
// var permissions = [
// HealthDataAccess.READ_WRITE,
// HealthDataAccess.READ_WRITE
// ];
// await Health().requestAuthorization(types, permissions: permissions);
//
// // write steps and blood glucose
// bool success = await Health().writeHealthData(10, HealthDataType.STEPS, now, now);
// success = await Health().writeHealthData(3.1, HealthDataType.BLOOD_GLUCOSE, now, now);
//
// // you can also specify the recording method to store in the metadata (default is RecordingMethod.automatic)
// // on iOS only `RecordingMethod.automatic` and `RecordingMethod.manual` are supported
// // Android additionally supports `RecordingMethod.active` and `RecordingMethod.unknown`
// success &= await Health().writeHealthData(10, HealthDataType.STEPS, now, now, recordingMethod: RecordingMethod.manual);
//
// // get the number of steps for today
// var midnight = DateTime(now.year, now.month, now.day);
// int? steps = await Health().getTotalStepsInInterval(midnight, now);
