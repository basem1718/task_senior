import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/toast.dart';

import 'custom_outline_button.dart';
import 'custom_text_fild.dart';

final emailController = TextEditingController();

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});
  Future passowrdReset() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
    showLoginTost('Password reset link send! Check your email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Reset Password ?',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const Text(
              'Please enter your email address',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextFild(
              hintText: 'Enter  email address',
              controller: emailController,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomOutlineButton(
              text: 'Reset Password',
              onPressed: passowrdReset,
            )
          ],
        ),
      ),
    );
  }
}
