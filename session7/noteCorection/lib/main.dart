import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gggg/login_screen.dart';
import 'package:gggg/notes_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(note());
}

class note extends StatelessWidget {
  const note({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: navigateToScrren(),
    );
  }

  Widget navigateToScrren() {
    if (FirebaseAuth.instance.currentUser == null) {
      return const LoginScreen();
    } else {
      return noteScreen();
    }
  }
}
