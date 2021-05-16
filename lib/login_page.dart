import 'package:flutter/material.dart';
import 'package:luck/auth_model.dart';
import 'package:sign_button/sign_button.dart';
import 'package:provider/provider.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => AuthModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('ログイン'),
//         ),
//         body: Center(
//           child: SignInButton(
//             buttonType: ButtonType.google,
//             onPressed: () async => {await context.read<AuthModel>().login()},
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String infoText = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthModel(),
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'メールアドレス'),
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'パスワード'),
                  onChanged: (String value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.all(8),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('ユーザー登録'),
                    onPressed: () async {
                      try {
                        context
                            .read<AuthModel>()
                            .createWithEmailAndPassword(email, password);
                      } catch (e) {
                        setState(() {
                          infoText = '登録に失敗しました: ${e.toString()}';
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    child: Text('ログイン'),
                    onPressed: () async {
                      try {
                        context
                            .read<AuthModel>()
                            .signinWithEmailAndPassword(email, password);
                      } catch (e) {
                        setState(() {
                          infoText = 'ログインに失敗しました: ${e.toString()}';
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
