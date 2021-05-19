import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:luck/auth_model.dart';
import 'package:luck/user_model.dart';
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
                        UserModel(user).updateUserLuck(result);
                      },
                      child: Text('1')),
                ),
                SizedBox(
                  height: size.width / 4.5,
                  width: size.width / 4.5,
                  child: ElevatedButton(
                      onPressed: () async {
                        bool result = randomBox(1);
                        UserModel(user).updateUserLuck(result);
                      },
                      child: Text('2')),
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
    return rand.nextInt(1) == index;
  }
}
