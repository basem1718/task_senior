import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_login.dart';

import 'quiz_main_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: navigateToScrren(),
    );
  }

  Widget navigateToScrren() {
    if (FirebaseAuth.instance.currentUser == null) {
      return const QuizLogin();
    } else {
      return QuizMainScreen();
    }
  }
}
