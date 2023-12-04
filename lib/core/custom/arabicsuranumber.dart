import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';

class ArabicSuraNumber extends StatelessWidget {
  const ArabicSuraNumber({super.key, required this.number});
  final int number;
  @override
  Widget build(BuildContext context) {
    return Text(
      "\uFD3F" + ArabicNumbers().convert(number).toString() + "\uFD3E",
      style: const TextStyle(
        fontFamily: "me_quran",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
