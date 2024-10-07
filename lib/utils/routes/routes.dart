

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthandfitness/utils/routes/routes_name.dart';
import 'package:healthandfitness/view/home_view.dart';

import '../../view/Activity.dart';
import '../../view/goals.dart';
import '../../view/health_metrics.dart';
import '../../view/login_view.dart';
import '../../view/progress_view.dart';
import '../../view/addDetails.dart';
import '../../view/signup_view.dart';
import '../../view/splash_view.dart';


class routes{
  static Route<dynamic>generateRoute(RouteSettings settings){

    switch(settings.name){
      case routesName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=>SplashView());
      case routesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>loginView());
      case routesName.signup:
        return MaterialPageRoute(builder: (BuildContext context)=>signUpView());
      case routesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeView());
      case routesName.activity:
        return MaterialPageRoute(builder: (BuildContext context)=>Activity());
      case routesName.healthMetrics:
        return MaterialPageRoute(builder: (BuildContext context)=>HealthMetricsCard());
      case routesName.goals:
        return MaterialPageRoute(builder: (BuildContext context)=>GoalsCard());
      case routesName.progress:
        return MaterialPageRoute(builder: (BuildContext context)=>ProgressVisualization());
      case routesName.details:
        return MaterialPageRoute(builder: (BuildContext context)=>Details());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }


  }
}