import 'package:flutter/material.dart';
import 'package:luck/top_page.dart';

class UnLuckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: size.height / 3,
              width: double.infinity,
              child: SafeArea(
                child: Center(
                  child: Text(
                    '🤯',
                    style: TextStyle(
                      fontSize: 200,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return TopPage();
                    },
                  ),
                );
              },
              child: Text('pop'),
            ),
          ],
        ),
      ),
    );
  }
}
