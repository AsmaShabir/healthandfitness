
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthandfitness/model/auth_model.dart';

class AuthViewModel with ChangeNotifier{
  final _auth = FirebaseAuth.instance;
  final _firestore=FirebaseFirestore.instance;
  User? _user;

  User? get user =>_user;
  AuthViewModel(){
    _auth.authStateChanges().listen((User? user){
      _user=user;
      notifyListeners();
    });

  }



   Future<AuthModel?> signUp(String email,String password,String name)async{
    try{
   final credentials=await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final user = credentials.user;
    if(user!=null){
       await _firestore.collection('users').doc(user.uid).set({
        'uid':user.uid,
        'email':user.email,
        'name':user.displayName,
        'imageUrl':user.photoURL,
      });
    }
    return AuthModel.fromFirebaseUser(user!);
    }
    catch(e){
      throw e;
    }

    }

    Future<AuthModel?>login(String email,String password)async{
    try{
     final credentials= await _auth.signInWithEmailAndPassword(email: email, password: password);
      final user=credentials.user;
      if(user!=null){
        final snapshot = await _firestore.collection('users').doc(user.uid).get();
        if(snapshot.exists){
          return AuthModel(
              uid: user.uid,
              email: user.email.toString(),
            displayName: snapshot['imageUrl'],
          );
        }
        return AuthModel.fromFirebaseUser(user);
      }
    }
    catch(e){
      throw e;
    }
    }
    Future<void>signOut()async{
    await _auth.signOut();
    }
  }
