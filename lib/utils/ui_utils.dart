import 'package:flutter/material.dart';

Widget actionButton(String text, VoidCallback onTap) {
  return SizedBox(
    width: double.infinity,
    child: TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        side: const BorderSide(color: Color(0xFF4083B9), width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: const Size(0, 51),
        splashFactory: NoSplash.splashFactory,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF4083B9),
          fontSize: 15,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
        ),
      ),
    ),
  );
}
