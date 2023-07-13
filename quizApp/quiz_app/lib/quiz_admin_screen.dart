import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_login.dart';

class QuizAdminScreen extends StatefulWidget {
  const QuizAdminScreen({super.key});

  @override
  State<QuizAdminScreen> createState() => _QuizAdminScreenState();
}

class _QuizAdminScreenState extends State<QuizAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('admin App'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => QuizLogin()));
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(
          height: 30,
        ),
        const CircleAvatar(
          radius: 140,
          backgroundImage: NetworkImage(
            'https://cdn1.vectorstock.com/i/1000x1000/53/35/mobile-notes-logo-vector-25235335.jpg',
          ),
          backgroundColor: Colors.blue,
        ),
      ]),
    );
  }
}
