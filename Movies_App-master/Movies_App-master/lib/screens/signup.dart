import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/presentation_main_app/screen/main_screen.dart';
import 'package:movies_app/screens/toast.dart';
import 'package:movies_app/screens/toast_error.dart';

import 'custom_outline_button.dart';
import 'custom_text_fild.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(children: [
          const SizedBox(
            height: 70,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Name',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFild(hintText: 'Enter your name'),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Email',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFild(
            hintText: 'Enter email address',
            controller: emailController,
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Password',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFild(
            hintText: 'Enter password',
            controller: passwordController,
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Password again',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFild(hintText: 'Enter again password'),
          const SizedBox(
            height: 26,
          ),
          CustomOutlineButton(
            text: 'Account Created',
            onPressed: () => signUpAuth(context),
          ),
        ]),
      ),
    );
  }

  signUpAuth(context) {
    String email = emailController.text;
    String password = passwordController.text;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
      showLoginTost('Account Created');
    }).catchError((onError) {
      print(onError);
      showErrorTost(onError.toString());
    });
  }
}
