import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:health/health.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HealthViewModel with ChangeNotifier {
  Health health = Health();
  Timer? _timer;
  int? _steps = 0;
  double? _bloodGlucose = 0.0;
  double? _heartRate = 0.0;
  double? _caloriesBurned = 0.0;
  double? _distanceWalked = 0.0;
  double? _weight; // User's weight in kg
  double? _strideLength; // Stride length
  double? _height; // User's weight in kg

  int? get steps => _steps;
  double? get bloodGlucose => _bloodGlucose;
  double? get heartRate => _heartRate;
  double? get caloriesBurned => _caloriesBurned;
  double? get distanceWalked => _distanceWalked;
  double? get weight => _weight;
  double? get height => _height;


  HealthViewModel() {
    loadPreferences(); // Load preferences when the ViewModel is created
    fetchSteps();
    healthFunc(); // Fetch steps when the ViewModel is created
  }

  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _weight = prefs.getDouble('weight') ?? 70.0; // Default weight
    _strideLength = prefs.getDouble('strideLength') ?? 0.78; // Default stride length
    _height = prefs.getDouble('height') ?? 0.0; // Default stride length

    notifyListeners(); // Notify listeners for any UI updates
  }

  Future<void> savePreferences(double newWeight,double newheight) async {
    final prefs = await SharedPreferences.getInstance();
    _weight = newWeight;
    // _strideLength = newStrideLength;
    _height =newheight;
    await prefs.setDouble('weight', _weight!); // Save weight to preferences
    await prefs.setDouble('strideLength', _strideLength!); // Save stride length to preferences
    await prefs.setDouble('height', _height!); // Save stride length to preferences

    notifyListeners();
  }

  double calculateStrideLength(double height, String gender) {
    if (gender.toLowerCase() == 'male') {
      return height * 0.415; // Average stride length for males
    } else if (gender.toLowerCase() == 'female') {
      return height * 0.413; // Average stride length for females
    } else {
      throw Exception('Gender must be either "male" or "female".');
    }
  }

  void updateSteps(int steps) {
    _steps = steps;
    double distance = calculateDistance(_steps!); // Calculate distance
    _caloriesBurned = calculateCaloriesBurned(distance); // Calculate calories burned
    notifyListeners(); // Notify listeners of changes
  }

  double calculateCaloriesBurned(double distance) {
    const double caloriesPerKm = 60; // Example: 60 calories per kilometer
    return distance * caloriesPerKm;
  }

  double calculateDistance(int steps) {
    // Convert steps to distance in kilometers
    double distanceInKm = (steps * _strideLength!) / 1000; // Use stride length safely
    return distanceInKm;
  }

  void startListeningForSteps() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      await fetchSteps();
    });
  }

  void stopListeningForSteps() {
    _timer?.cancel();
  }

  Future<void> fetchSteps() async {
    var now = DateTime.now();
    var midnight = DateTime(now.year, now.month, now.day);

    // Fetch total steps in the interval from midnight to now
    int? stepsToday = await health.getTotalStepsInInterval(midnight, now);

    if (stepsToday != null) {
      _steps = stepsToday;
      double distance = calculateDistance(_steps!);
      _caloriesBurned = calculateCaloriesBurned(distance);
      notifyListeners();

      // Save the updated data to Firestore
      await saveHealthDataToFirestore();
    }
  }

  Future<void> saveHealthDataToFirestore() async {
    try {
      // Get the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get the current user's UID (assuming you're using Firebase Auth)
      String userId = FirebaseAuth.instance.currentUser!.uid;

      // Prepare the data to store in Firestore
      Map<String, dynamic> healthData = {
        'steps': _steps, // Add more fields as needed
        'calories_burned': _caloriesBurned,
        'distance_walked': _distanceWalked,
        'timestamp': FieldValue.serverTimestamp(), // Save the time of data entry
      };

      // Save the health data to Firestore under the user's document
      await firestore.collection('Activity').doc(userId).set(healthData, SetOptions(merge: true));

      print('Health data saved successfully!');
    } catch (e) {
      print('Error saving health data to Firestore: $e');
    }
  }

  Future<void> healthFunc() async {
    var types = [
      HealthDataType.STEPS,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.HEART_RATE,
      HealthDataType.ACTIVE_ENERGY_BURNED,
      HealthDataType.TOTAL_CALORIES_BURNED,
      HealthDataType.DISTANCE_WALKING_RUNNING,
    ];

    bool requested = await health.requestAuthorization(types);

    if (requested) {
      var now = DateTime.now(); // Current time
      var startTime = now.subtract(Duration(days: 1)); // 24 hours ago
      var endTime = now; // Now

      try {
        // Fetch health data from the last 24 hours
        List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          types: types,
          startTime: startTime,
          endTime: endTime,
        );

        // Process the fetched data points
        for (var dataPoint in healthData) {
          if (dataPoint.type == HealthDataType.STEPS) {
            _steps = (dataPoint.value is double) ? (dataPoint.value as double).toInt() : dataPoint.value as int;
          } else if (dataPoint.type == HealthDataType.BLOOD_GLUCOSE) {
            _bloodGlucose = dataPoint.value as double?;
          } else if (dataPoint.type == HealthDataType.HEART_RATE) {
            _heartRate = dataPoint.value as double?;
          } else if (dataPoint.type == HealthDataType.ACTIVE_ENERGY_BURNED) {
            _caloriesBurned = dataPoint.value as double?;
          } else if (dataPoint.type == HealthDataType.DISTANCE_WALKING_RUNNING) {
            _distanceWalked = dataPoint.value as double?;
          }
        }

        // Notify listeners for any UI updates
        notifyListeners();
      } catch (error) {
        print('Error fetching health data: $error');
      }
    } else {
      print('Authorization not granted');
    }
  }

  // Method to set user's stride length based on height and gender
  void setUserStrideLength(double height, String gender) {
    try {
      double strideLength = calculateStrideLength(height, gender);
      _strideLength = strideLength;
      // Save the stride length to preferences for persistence
      savePreferences(_weight!,_height!);
      print('Calculated Stride Length: $_strideLength meters');
    } catch (e) {
      print(e);
    }
  }
}
