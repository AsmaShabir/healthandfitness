import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthandfitness/utils/routes/routes.dart';
import 'package:healthandfitness/utils/routes/routes_name.dart';
import 'package:healthandfitness/view/home_view.dart';
import 'package:healthandfitness/view_model/health_view_model.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=>HealthViewModel()),


        ],
        child:   MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute:routesName.home ,
          onGenerateRoute: routes.generateRoute,
        )
    );
  }
}


