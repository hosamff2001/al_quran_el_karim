import 'package:al_quran_el_karim/core/custom/arabicsuranumber.dart';
import 'package:al_quran_el_karim/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).appbartitle),
        ),
        body: ArabicSuraNumber(number: 2));
  }
}
