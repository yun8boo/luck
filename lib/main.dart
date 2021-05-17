import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:luck/auth_model.dart';
import 'package:luck/login_check_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthModel(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        darkTheme: ThemeData.dark(),
        home: LoginCheckPage(),
      ),
    );
  }
}
