import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(";]"),
      ),
      body: Center(
          child: TextButton(
          autofocus: true,
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
          elevation: MaterialStateProperty.all(9.0),
          padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(110.0, 20.0,110 , 20)),
        ),
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        onPressed: () {
          Modular.to.pushNamed("/home");
        },
      )),
    );
  }
}
