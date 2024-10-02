import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoURL;

  AuthModel({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoURL,
  });

  // Factory constructor to create an AuthModel from a Firebase User object
  factory AuthModel.fromFirebaseUser(User user) {
    return AuthModel(
      uid: user.uid,
      email: user.email!,
      displayName: user.displayName,
      photoURL: user.photoURL,
    );
  }
}