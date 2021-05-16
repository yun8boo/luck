import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      // TODO
                      bool result = randomBox(0);
                      print(result);
                    },
                    child: Text('1')),
                ElevatedButton(
                    onPressed: () {
                      // TODO
                      bool result = randomBox(1);
                      print(result);
                    },
                    child: Text('2')),
                ElevatedButton(
                    onPressed: () {
                      // TODO
                      bool result = randomBox(2);
                      print(result);
                    },
                    child: Text('3')),
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
