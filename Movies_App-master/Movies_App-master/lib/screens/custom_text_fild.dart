import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
  CustomTextFild({super.key, required this.hintText, this.controller});
  String hintText;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(32),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white60),
        filled: true,
        fillColor: Colors.grey[800],
      ),
    );
  }
}
