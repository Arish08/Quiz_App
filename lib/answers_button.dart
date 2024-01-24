import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers(this.text, this.onTap, {super.key});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          backgroundColor: const Color.fromARGB(255, 42, 18, 79),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
