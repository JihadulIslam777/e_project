import 'package:e_project/services/firebase_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './auth_response.dart';

class FireBaseAuthentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // static final User? user = _firebaseAuth.currentUser;

  static Future<AuthResponse> signUp(
      String name, String email, String password) async {
    return await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((UserCredential value) {
      FirebaseCollection.saveUserData(name, email, password, value.user!);
      return AuthResponse('Successfully SignUp', true);
    }).onError((FirebaseAuthException error, stackTrace) {
      return AuthResponse(error.code, false);
    }).catchError((error) {
      return AuthResponse(error.code, false);
    });
  }

  static Future<AuthResponse> logIn(String email, String password) async {
    return await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential value) {
      return AuthResponse('congrats', true);
    }).onError((error, stackTrace) => AuthResponse(error.toString(), false));
  }
}
