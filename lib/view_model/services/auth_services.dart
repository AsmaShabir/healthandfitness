import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Get the authentication credentials from Google
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        // Create a new credential for Firebase
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credentials
        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        final User? user = userCredential.user;

        // Return the Firebase user
        return user;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }

}
