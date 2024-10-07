import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthandfitness/utils/routes/routes.dart';
import 'package:healthandfitness/utils/routes/routes_name.dart';
import 'package:healthandfitness/view/home_view.dart';
import 'package:healthandfitness/view/signup_view.dart';
import 'package:healthandfitness/view_model/auth_view_model.dart';
import 'package:healthandfitness/view_model/health_view_model.dart';
import 'package:healthandfitness/view_model/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final healthViewModel = HealthViewModel();
  await healthViewModel.loadPreferences();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HealthViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),

        home: StreamBuilder<User?>(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return HomeView();
            } else {
              return  signUpView();
            }
          },
        ),
        initialRoute: routesName.splash,
        onGenerateRoute: routes.generateRoute,
      ),
    );
  }
}
