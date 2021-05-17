import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:luck/auth_model.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthModel>().user;
    print(user);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: size.width / 4.5,
                  width: size.width / 4.5,
                  child: ElevatedButton(
                      onPressed: () async {
                        bool result = randomBox(0);
                        print(result);
                        // TODO
                        CollectionReference luck = FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .collection('luck');
                        DocumentReference value = await luck.add({
                          'point': result ? 1 : 0,
                          'consecutiveWins': result ? 1 : 0,
                          'totalWins': result ? 1 : 0
                        });
                        print(value);
                      },
                      child: Text('1')),
                ),
                SizedBox(
                  height: size.width / 4.5,
                  width: size.width / 4.5,
                  child: ElevatedButton(
                      onPressed: () async {
                        // TODO
                        bool result = randomBox(1);
                        print(result);
                        CollectionReference luck = FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .collection('luck');
                        DocumentReference value = await luck.add({
                          'point': result ? 1 : 0,
                          'consecutiveWins': result ? 1 : 0,
                          'totalWins': result ? 1 : 0
                        });
                        print(value);
                      },
                      child: Text('2')),
                ),
                SizedBox(
                  height: size.width / 4.5,
                  width: size.width / 4.5,
                  child: ElevatedButton(
                      onPressed: () async {
                        // TODO
                        bool result = randomBox(2);
                        print(result);
                        CollectionReference luck = FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .collection('luck');
                        DocumentReference value = await luck.add({
                          'point': result ? 1 : 0,
                          'consecutiveWins': result ? 1 : 0,
                          'totalWins': result ? 1 : 0
                        });
                        print(value);
                      },
                      child: Text('3')),
                ),
              ],
            ),
            ElevatedButton(
              child: Text('logout'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'share'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'profile')
        ],
      ),
    );
  }

  bool randomBox(int index) {
    Random rand = Random();
    return rand.nextInt(2) == index;
  }
}
