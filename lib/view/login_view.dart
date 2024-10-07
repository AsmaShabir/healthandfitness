


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthandfitness/view/home_view.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';
import '../view_model/services/auth_services.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  final AuthService authService = AuthService();
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Color(0xFFF1f305c),
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 500,
                width:double.infinity ,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(70, 100))
                ),
                child:     Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/activity.png',height: 120,),
                          Text('FitTrack',style: GoogleFonts.azeretMono(color: Color(0xFFF1f305c),fontWeight: FontWeight.bold),),


                          SizedBox(height: 15,),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFF1f305c)),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email,color:Color(0xFFF1f305c) ,),
                                labelText: 'Email',
                                  labelStyle: GoogleFonts.azeretMono(color:Color(0xFFF1f305c),fontSize: 12 ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )
                                
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFF1f305c)),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: TextField(
                              controller: passController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock,color:Color(0xFFF1f305c) ,),
                                labelText: 'Password',
                                  labelStyle: GoogleFonts.azeretMono(color:Color(0xFFF1f305c),fontSize: 12 ),
                                
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 40,
                            child: MaterialButton(
                              color: Color(0xFFF1f305c),
        
                              onPressed: ()async{
                                final email=emailController.text.trim().toString();
                                final password=passController.text.trim().toString();
                                  final user= await authViewModel.login(email, password);
                                  if(user!=null){
                                    print('Sign in successful');
                                    Navigator.pushNamed(context, routesName.home);
        
                                  }
                                  else{
        
                                    Utils.flushBarErrorMessage('invalid Input', context);
                                  }
        
        
                              },
                              child: Text('Login',style: GoogleFonts.azeretMono(color: Colors.white),),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
        
                                )
                            ),
                          ),

                        ]
                    )
                )
            ),
        
            Container(height: 356.7,
              color: Colors.white ,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF1f305c),
                    borderRadius: BorderRadius.only(topRight: Radius.elliptical(170, 200))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15,),
                    TextButton(
                      onPressed: ()async{
                        User? user = await authService.signInWithGoogle();

                        if (user != null) {
                          // Navigate to home screen if sign-in is successful
                          Navigator.pushReplacementNamed(context, routesName.home);
                        } else {
                          // Show error or handle failed sign-in
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Failed to sign in')),
                          );
                        }

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundColor:Colors.white,
                              child: Image.asset('assets/images/google.png',height: 20,)),
                          SizedBox(width: 4,),
                          Text('Login with GOOGLE',style: GoogleFonts.azeretMono(decoration: TextDecoration.underline,decorationColor:Colors.white ,color: Colors.white,fontSize: 12,),),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, routesName.signup);

                      },
                      child: Text("Don't have an account? Signup",style: GoogleFonts.azeretMono(decoration: TextDecoration.underline,decorationColor:Colors.white ,color: Colors.white,fontSize: 12,),),
                    )
                  ],
                ),
              ),
            ),
            // SizedBox(height: 10,),
            // TextField(
            //   controller: emailController,
            //   decoration: InputDecoration(
            //     labelText: 'Email',
            //   ),
            // ),
            // SizedBox(height: 10,),
            // TextField(
            //   controller: passController,
            //   obscureText: true,
            //   decoration: InputDecoration(
            //     labelText: 'Password',
            //   ),
            // ),
            // SizedBox(height: 10,),
            // MaterialButton(
            //   onPressed: ()async{
            //     final email=emailController.text.trim().toString();
            //     final password=passController.text.trim().toString();
            //       final user= await authViewModel.login(email, password);
            //       if(user!=null){
            //         print('Sign in successful');
            //         Navigator.pushNamed(context, routesName.home);
            //
            //       }
            //       else{
            //
            //         Utils.flushBarErrorMessage('invalid Input', context);
            //       }
            //
            //
            //   },
            //   child: Text('Login'),
            // ),
            // SizedBox(height: 15,),
            // TextButton(
            //   onPressed: (){
            //     Navigator.pushNamed(context, routesName.signup);
            //
            //   },
            //   child: Text('Already have an account? Login'),
            // )
          ],
        ),
      ),
    );
  }
}
