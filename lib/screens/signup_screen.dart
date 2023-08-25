import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/reusable_widgets/reusable_widgets.dart';
import 'package:login_page/screens/home_screen.dart';

import '../utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextConroller = TextEditingController();
  TextEditingController _emailTextConroller = TextEditingController();
  TextEditingController _userNameTextConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2893"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter username", Icons.person_outline, false,
                  _userNameTextConroller),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter email id", Icons.person_outline, false,
                  _emailTextConroller),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter password", Icons.lock_outline, true,
                  _passwordTextConroller),
              const SizedBox(
                height: 20,
              ),
              signInsignUpButton(context, false, () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailTextConroller.text,
                        password: _passwordTextConroller.text)
                    .then((value) {
                  print("Created New account");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              })
            ],
          ),
        )),
      ),
    );
  }
}
