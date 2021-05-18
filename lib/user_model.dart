import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  UserModel(this.user);
  final User user;

  Future<void> createUser() async {
    try {
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
      DocumentReference _users = _firestore.collection('users').doc(user.uid);
      _users.set({
        'name': user.email,
        'point': 0,
        'consecutiveWins': 0,
        'totalWins': 0,
        'createdAt': Timestamp.now(),
      });
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<DocumentSnapshot> getUser() async {
    try {
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
      return _firestore.collection('users').doc(user.uid).get();
    } catch (error) {
      print(error);
    }
  }

  // luckに関する情報更新
  Future<void> updateUserLuck(bool flag) async {
    try {
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
      DocumentReference _users = _firestore.collection('users').doc(user.uid);
      DocumentSnapshot userData = await getUser();
      int _point = userData.data()['point'];
      int _consecutiveWins = userData.data()['consecutiveWins'];
      int _totalWins = userData.data()['totalWins'];
      await _users.update({
        'point': flag ? _point + 1 : _point,
        'consecutiveWins': flag ? _consecutiveWins + 1 : 0,
        'totalWins': flag ? _totalWins + 1 : _totalWins,
      });
    } catch (error) {
      throw error;
    }
  }
}
