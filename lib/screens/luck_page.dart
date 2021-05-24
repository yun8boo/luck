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
              margin: EdgeInsets.only(top: 100),
              height: size.height / 3,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/luck-background-img.png'),
              )),
              child: SafeArea(
                child: Center(
                  child: Text(
                    '🤩',
                    style: TextStyle(
                      fontSize: 100,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Text(
                    'Luck!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Text(
                      '＋１',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'current point',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '11',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Text(
                      'See you tomorrow',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: SizedBox(
                width: size.width / 1.5,
                height: 52,
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
            ),
          ],
        ),
      ),
    );
  }
}
