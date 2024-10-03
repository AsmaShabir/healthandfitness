

import 'package:flutter/material.dart';
import 'package:healthandfitness/utils/routes/routes_name.dart';
import 'package:healthandfitness/utils/utils.dart';
import 'package:healthandfitness/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class signUpView extends StatefulWidget {
  const signUpView({super.key});

  @override
  State<signUpView> createState() => _signUpViewState();
}

class _signUpViewState extends State<signUpView> {
  TextEditingController emailController =TextEditingController();
  TextEditingController nameController =TextEditingController();
  TextEditingController passController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
   appBar:  AppBar(
     title: Text('SignUp'),
   ),
      body: Column(
        children: [

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'User Name',
              ),
            ),
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
                final name=nameController.text.trim().toString();
                final password=passController.text.trim().toString();
                // if(isLogin){
                //   final user= await authViewModel.login(email, password);
                //   if(user!=null){
                //     print('Sign up successful');
                //     routesName.home;
                //   }
                //   else{
                //
                //     Utils.flushBarErrorMessage('invalid Input', context);
                //   }
                // }
                  final user= await authViewModel.signUp(email, password,name);
                  if(user!=null){
                    Navigator.pushNamed(context, routesName.home);
                    Utils.flushBarErrorMessage('Logged in Successfully', context);

                  }
                  else{
                    Utils.flushBarErrorMessage('fill all the fields', context);
                  }

              },
            child: Text('Sign Up'),
          ),
          SizedBox(height: 15,),
          TextButton(
              onPressed: (){
                Navigator.pushNamed(context, routesName.login);

              },
              child: Text("Don't have an account? Sign up"),
          )

        ],
      ),
    );
  }
}
