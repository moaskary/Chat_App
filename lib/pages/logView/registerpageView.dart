// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minichatapp/services/auth/auth_service.dart';
import 'package:minichatapp/core/my_button.dart';
import 'package:minichatapp/core/my_textfield.dart';

class RegisterPageView extends StatelessWidget {
  RegisterPageView({super.key, this.onTap});
  //email and pw text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  //tap to go to login page
  final void Function()? onTap;

  //register method
  void register(BuildContext context) {
    // get auth service
    final auth = AuthService();
    //if passowrd match -> create user
    if (_passwordController != _confirmpasswordController) {
      try {
        auth.signUpWithEmailAndPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Password don't match"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            //space between logo and welcome back message
            const SizedBox(
              height: 50,
            ),
            //welcome back message
            Text(
              "Lets create an account for you!!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            //space between welcome back message and pw textfield
            const SizedBox(
              height: 25,
            ),
            //email text field
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            //password text field
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 10),
            //Confirm password text field
            MyTextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpasswordController,
            ),
            const SizedBox(height: 25),
            //loginbutton
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),
            const SizedBox(height: 25),
            //registration
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? lets ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Now!!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
