import 'package:flutter/material.dart';
import 'package:minichatapp/pages/logView/loginpageview.dart';
import 'package:minichatapp/pages/logView/registerpageView.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show login page view
  bool showLoginPage = true;
  //toggle between login and register page
  void togglepages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPageView(onTap: togglepages,);
    } else {
      return RegisterPageView(onTap: togglepages,);
    }
  }
}
