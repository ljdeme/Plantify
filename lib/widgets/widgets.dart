import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GreenButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
          backgroundColor: const MaterialStatePropertyAll<Color>(
              Color.fromRGBO(56, 82, 80, 0.7)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))),
      child: Text(text /*,style:*/),
    );
  }
}
