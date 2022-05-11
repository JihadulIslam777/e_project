import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseCollection {
//   static final FirebaseFirestore _firebaseFirestore =
//       FirebaseFirestore.instance;

//   static void saveUserData(
//       String name, String password, String email, User user) async {
//     await _firebaseFirestore.collection('Users').doc(user.uid).set({
//       'userName': name,
//       'email': user.email,
//       'pass': password,
//     }).onError((error, stackTrace) {
//       print(error.toString());
//     });
//   }
// }

class FirebaseCollection {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  static void saveUserData(
      String name, String email, String password, User user) async {
    await _firebaseFirestore.collection('Users').doc(user.uid).set({
      'UserName': name,
      'email': user.email,
      'pass': password,
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
