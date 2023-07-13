import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/quiz_admin_screen.dart';
import 'package:quiz_app/quiz_main_Screen.dart';
import 'package:quiz_app/quiz_register.dart';

import 'forget_password.dart';

class QuizLogin extends StatefulWidget {
  const QuizLogin({super.key});

  @override
  State<QuizLogin> createState() => _QuizLoginState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

final firestore = FirebaseFirestore.instance;

class _QuizLoginState extends State<QuizLogin> {
  bool secourtext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001440),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          const CircleAvatar(
            radius: 140,
            backgroundImage: NetworkImage(
              'https://www.quizland.net/assets/images/meta.jpg',
            ),
            backgroundColor: Color(0xff001440),
          ),
          const SizedBox(
            height: 20,
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: passwordController,
              obscureText: secourtext,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        secourtext = !secourtext;
                      });
                    },
                    icon: const Icon(
                      Icons.visibility_off,
                    )),
                labelText: 'Password',
                hintText: 'Enter your Passwors',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: GestureDetector(
              child: Text(
                'Forget your password ?',
                style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    color: Colors.green),
              ),
              onTap: () => forgetScreen(),
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[300],
                    fixedSize: const Size(160, 45),
                  ),
                  onPressed: () => Login(context),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: const Size(160, 45),
                  ),
                  onPressed: () => NewRegister(),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }

  Login(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      checkUserType();
    }).catchError((error) {
      print(error);
      showErrorTost(error.toString());
    });
  }

  void showErrorTost(String ErrorMassege) {
    Fluttertoast.showToast(
        msg: ErrorMassege,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void showLoginTost(String ErrorMassege) {
    Fluttertoast.showToast(
        msg: ErrorMassege,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void NewRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuizRegister()));
  }

  forgetScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
  }

  void checkUserType() {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    firestore.collection('quizUser').doc(userId).get().then((value) {
      if (!value.exists) {
        showErrorTost('Not found');
        return;
      }
      if (value.data()!['admin']) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => QuizAdminScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => QuizMainScreen()));
      }
    });
  }
}
