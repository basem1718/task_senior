import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/presentation_main_app/screen/main_screen.dart';
import 'package:movies_app/screens/signup.dart';
import 'package:movies_app/screens/toast.dart';
import 'package:movies_app/screens/toast_error.dart';

import '../core/global/theme/app_color/app_color_dark.dart';
import '../generated/assets.dart';
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
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 60, bottom: 20).r,
            child: CircleAvatar(
              maxRadius: 93.r,
              minRadius: 93.r,
              backgroundColor: AppColorsDark.primaryGreenColor,
              child: CircleAvatar(
                maxRadius: 90.r,
                minRadius: 90.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(95).r,
                  child: Image.asset(
                    Assets.imagesLogo,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 200.h,
                  ),
                ),
              ),
            ),
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
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
          context, MaterialPageRoute(builder: (context) => MainScreen()));
      showLoginTost('login in sucssful');
    }).catchError((onError) {
      print(onError);
      showErrorTost(onError.toString());
    });
  }
}
