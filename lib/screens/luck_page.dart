import 'package:flutter/material.dart';
import 'package:luck/top_page.dart';

class LuckPage extends StatelessWidget {
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
              margin: EdgeInsets.symmetric(vertical: 50),
              height: size.height / 3,
              width: double.infinity,
              child: SafeArea(
                child: Center(
                  child: Text(
                    '🤩',
                    style: TextStyle(
                      fontSize: 200,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Luck!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    '＋１',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width / 1.5,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 8,
                  shape: const StadiumBorder(),
                ),
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
            ),
          ],
        ),
      ),
    );
  }
}
