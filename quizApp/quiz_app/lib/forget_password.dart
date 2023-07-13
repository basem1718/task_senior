import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/quiz_login.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool secourtext = true;
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passowrdReset() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
    showPasswordTost('Password reset link send! Check your email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001440),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              'Receive an email',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'reset your password 😁.',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: emailController,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Email',
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 110),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                fixedSize: const Size(160, 45),
              ),
              onPressed: passowrdReset,
              child: const Text(
                'Reset Password',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }

  void showPasswordTost(String ErrorMassege) {
    Fluttertoast.showToast(
        msg: ErrorMassege,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
