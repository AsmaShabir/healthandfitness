


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: passController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 10,),
          MaterialButton(
            onPressed: ()async{
              final email=emailController.text.trim().toString();
              final password=passController.text.trim().toString();
                final user= await authViewModel.login(email, password);
                if(user!=null){
                  print('Sign up successful');
                  routesName.home;
                }
                else{

                  Utils.flushBarErrorMessage('invalid Input', context);
                }


            },
            child: Text('Login'),
          ),
          SizedBox(height: 15,),
          TextButton(
            onPressed: (){
              routesName.signup;
            },
            child: Text('Already have an account? Login'),
          )
        ],
      ),
    );
  }
}
