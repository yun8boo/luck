import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:luck/user_model.dart';

class AuthModel extends ChangeNotifier {
  User _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User get user => _user;
  bool get loggedIn => _user != null;

  AuthModel() {
    _auth.authStateChanges().listen((User user) {
      print('user: ${user}');
      if (user == null) {
        _user = null;
      } else {
        _user = user;
      }
      notifyListeners();
    });
    // final User _currentUser = _auth.currentUser;

    // if (_currentUser != null) {
    //   _user = _currentUser;
    //   notifyListeners();
    // }
  }

  Future<void> login() async {
    try {
      UserCredential _userCredential = await _signInWithGoogle();
      _user = _userCredential.user;
      notifyListeners();
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<void> logout() async {
    _user = null;
    await _auth.signOut();
    notifyListeners();
  }

  Future<UserCredential> _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    print(googleUser);

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    print(googleAuth);
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print(credential);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> createWithEmailAndPassword(String email, String password) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential _userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      _user = _userCredential.user;
      UserModel(_user).createUser();
      notifyListeners();
    } catch (error) {}
  }

  Future<UserCredential> signinWithEmailAndPassword(
      String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
