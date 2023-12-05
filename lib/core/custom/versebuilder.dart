 import 'package:al_quran_el_karim/core/resources/constants_manager.dart';
import 'package:flutter/material.dart';

Row verseBuilder(int index, previousVerses,arabic) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                arabic[index + previousVerses]['aya_text'],
              
                style: TextStyle(
                  fontSize: AppConstants.arabicFontSize,
                  fontFamily: AppConstants.arabicFont,
                  color: const Color.fromARGB(196, 0, 0, 0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
