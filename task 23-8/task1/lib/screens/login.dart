import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/signup.dart';
import 'package:newsapp/screens/toast.dart';
import 'package:newsapp/screens/toast_error.dart';
import 'package:newsapp/widgets/tap_controller.dart';

import 'custom_elevated_button.dart';
import 'custom_outline_button.dart';
import 'custom_text_fild.dart';
import 'forget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://img.myloview.com/posters/minimal-innovative-initial-mb-logo-and-bm-logo-letter-mb-bm-creative-elegant-monogram-premium-business-logo-icon-white-color-on-black-background-700-216230557.jpg'),
            backgroundColor: Colors.black,
            radius: 90,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Email',
              style: TextStyle(fontSize: 18, color: Colors.black),
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
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgetScreen())),
                  child: const Text(
                    'Forget password ?',
                    style: TextStyle(fontSize: 12, color: Colors.white60),
                  ),
                ),
              ],
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
            height: 22,
          ),
          CustomElevatedButton(
              text: 'Login', onPressed: () => loginauth(context)),
          const SizedBox(
            height: 22,
          ),
          CustomOutlineButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen())),
            text: 'SignUp',
          ),
          const SizedBox(
            height: 16,
          ),
          const Center(
            child: Text(
              'Or',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomOutlineButton(
            text: 'Sign in with Google',
            image:
                'https://e1.pxfuel.com/desktop-wallpaper/297/673/desktop-wallpaper-google-g-logo-google-logo-black-background-thumbnail.jpg',
          ),
        ]),
      ),
    );
  }

  loginauth(context) {
    String email = emailController.text;
    String password = passwordController.text;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TapController()));
      showLoginTost('login in sucssful');
    }).catchError((onError) {
      print(onError);
      showErrorTost(onError.toString());
    });
  }
}
