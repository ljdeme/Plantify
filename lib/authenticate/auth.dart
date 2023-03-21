import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /*Future<String> login({String email, String password}) {
    try {} catch (error) {}
  }*/

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
