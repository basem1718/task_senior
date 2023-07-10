import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gggg/constant/colors.dart';
import 'package:gggg/forget_screen.dart';
import 'package:gggg/notes_screen.dart';
import 'package:gggg/register_screen%20.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  bool secourtext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const CircleAvatar(
            radius: 140,
            backgroundImage: NetworkImage(
              'https://cdn1.vectorstock.com/i/1000x1000/53/35/mobile-notes-logo-vector-25235335.jpg',
            ),
            backgroundColor: Colors.blue,
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
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: GestureDetector(
              child: Text(
                'Forget your password ?',
                style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.secondary),
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
                    primary: Colors.blue[300],
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
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => noteScreen()));
      showLoginTost('Logged In Successfully');
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
        context, MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

  forgetScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgetScreen()));
  }
}
