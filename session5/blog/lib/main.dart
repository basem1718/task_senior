import 'package:blog/blog_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppBlog(
    body: null,
  ));
}

class AppBlog extends StatelessWidget {
  const AppBlog({super.key, required body});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: BlogScreen(),
    );
  }
}
