import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  CustomOutlineButton(
      {super.key, this.image, required this.text, this.onPressed});
  String? image;
  String text;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        backgroundColor: Colors.black,
        primary: Colors.green,
        side: const BorderSide(color: Colors.green, width: 2),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image == null
              ? const SizedBox()
              : CircleAvatar(
                  backgroundImage: NetworkImage(
                    image!,
                  ),
                  radius: 14,
                  backgroundColor: Colors.black,
                ),
          Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
