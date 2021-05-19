import 'package:flutter/material.dart';
import 'package:luck/bottom_navigation_bar_model.dart';
import 'package:luck/screens/home_page.dart';
import 'package:luck/screens/profile_page.dart';
import 'package:luck/screens/share_page.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _pageList = <Widget>[HomePage(), SharePage(), ProfilePage()];
    return ChangeNotifierProvider(
      create: (_) => BottomNavigationBarModel(),
      child:
          Consumer<BottomNavigationBarModel>(builder: (context, model, child) {
        return Scaffold(
          body: _pageList[model.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.currentIndex,
            onTap: (index) {
              model.currentIndex = index;
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.share), label: 'share'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'profile')
            ],
          ),
        );
      }),
    );
  }

  bool randomBox(int index) {
    Random rand = Random();
    return rand.nextInt(1) == index;
  }
}
