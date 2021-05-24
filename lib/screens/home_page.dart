import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:luck/auth_model.dart';
import 'package:luck/screens/luck_page.dart';
import 'package:luck/screens/unluck_page.dart';
import 'package:luck/user_model.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthModel>().user;
    final userModel = UserModel(user);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text('CURRENT POINTS'),
                      FutureBuilder(
                        future: userModel.getUserDocSnapShot(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data = snapshot.data.data();
                            return Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  data['consecutiveWins'] > 1
                                      ? Text("${data['consecutiveWins']}連続正解中")
                                      : Text(''),
                                  Text(
                                    '${data['point']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return Text("loading");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: size.width / 4.5,
                  width: size.width / 4.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool result = randomBox(0);
                      await userModel.updateUserLuck(result);
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return result ? LuckPage() : UnLuckPage();
                          },
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: Text(
                      '🍎',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.width / 4.5,
                  width: size.width / 4.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool result = randomBox(1);
                      await userModel.updateUserLuck(result);
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return result ? LuckPage() : UnLuckPage();
                          },
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: Text(
                      '🍏',
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  bool randomBox(int index) {
    Random rand = Random();
    return rand.nextInt(1) == index;
  }
}
