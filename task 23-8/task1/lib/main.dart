import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/login.dart';
import 'package:newsapp/views/home_page.dart';
import 'package:newsapp/widgets/tap_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: navigateWidget(),
    );
  }

  Widget navigateWidget() {
    if (FirebaseAuth.instance.currentUser == null) {
      return LoginScreen();
    } else {
      return const TapController();
    }
  }
}
