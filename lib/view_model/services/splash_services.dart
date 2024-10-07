

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:healthandfitness/model/auth_model.dart';
import 'package:healthandfitness/view_model/auth_view_model.dart';
import 'package:healthandfitness/view_model/user_view_model.dart';

import '../../utils/routes/routes_name.dart';

class splashServices{

  Future<AuthModel>getUserData()=>UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) async {
      if(value.uid=='null'||value.uid==""){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, routesName.login);
      }
      else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, routesName.home);

      }
    }).onError((error,stackTrace){

      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}