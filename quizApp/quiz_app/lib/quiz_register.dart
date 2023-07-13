import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuizRegister extends StatefulWidget {
  const QuizRegister({super.key});

  @override
  State<QuizRegister> createState() => _QuizRegisterState();
}

final nameController = TextEditingController();
final phoneController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();

class _QuizRegisterState extends State<QuizRegister> {
  bool secourtext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001440),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              'Create a new acount 🤝',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: nameController,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Name',
                  hintText: 'Enter your Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: phoneController,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Phone',
                  hintText: 'Enter your Phone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Colors.black,
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
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
            height: 15,
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
                  onPressed: () => Register(context),
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

  Register(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createUserDataInFirstore();
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

  void showCreatedTost(String ErrorMassege) {
    Fluttertoast.showToast(
        msg: ErrorMassege,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void createUserDataInFirstore() {
    String email = emailController.text;
    String name = nameController.text;
    String phone = phoneController.text;

    String userId = FirebaseAuth.instance.currentUser!.uid;

    final firestor = FirebaseFirestore.instance;

    Map<String, dynamic> data = {
      "id": userId,
      "name": name,
      "email": email,
      "phone": phone,
      "admin": false,
    };

    firestor.collection("quizUser").doc().set(data).then((value) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'Account created');
    });
  }
}
