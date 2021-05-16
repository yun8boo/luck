import 'package:flutter/material.dart';
import 'package:luck/auth_model.dart';
import 'package:luck/home_page.dart';
import 'package:luck/login_page.dart';
import 'package:provider/provider.dart';

class LoginCheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool _loggedIn = context.watch<AuthModel>().loggedIn;
    print(_loggedIn);
    return _loggedIn ? HomePage() : LoginPage();
  }
}
