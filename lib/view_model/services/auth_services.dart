import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthandfitness/repositories/auth_repository.dart';
import 'package:healthandfitness/utils/utils.dart';
import 'package:healthandfitness/view/login_view.dart';

import '../../utils/routes/routes_name.dart';

class AuthService {
  final repo =AuthRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Google Sign-in method
  Future<UserCredential?> signInWithGoogle() async {
    await InternetAddress.lookup('google.com');

    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential? googleCredential =await FirebaseAuth.instance.signInWithCredential(credential);

      // Once signed in, return the UserCredential
      return googleCredential;
    }catch(e){
      log('Error in signup with google $e');

      return null;


    }
  }
  // creating google account
  handleGoogleButtonClick(context)async{

    signInWithGoogle().then((userCred) async{


      if(userCred != null ) {
        var userData = await FirebaseFirestore.instance.collection("users").doc(
            userCred.user!.uid).get().then((value) {
          if (userCred.user != null) {

            repo.saveUserToFirestore(uid: userCred.user!.uid,
                email: userCred.user!.email.toString(),
                name: userCred.user!.displayName.toString(),
                imageUrl: userCred.user!.photoURL.toString(),
                context: context);

            Navigator.pushNamed(context, routesName.home);
          }

          else {

            log("Failed to create Account");
            Utils.snackBar("No email is selected.Kindly select email",context);
          }
        });
      }
      else{


        log("Failed to create Account");
        Utils.snackBar("No email is selected.Kindly select email",context);

      }



    });


  }
  // Store user credentials in Firestore

  // Sign out from Google
  Future<void> signOutGoogle(context) async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, routesName.login);
  }

// signOut(context)async{
//   Utils.flushBarErrorMessage("Logging Out...",context);
//   try{
//     await FirebaseAuth.instance.signOut();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginView()));
//     log("Logged out log");
//   }
//   catch(e){
//     // VxToast.show(context, msg: e.toString());
//   }
// }
 }