import 'package:al_quran_el_karim/core/resources/constants_manager.dart';
import 'package:al_quran_el_karim/features/home/presentation/mangment/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'singlesurabuilder.dart';

class SurahBuilder extends StatelessWidget {
  final sura;
  final arabic;
  final suraName;
  final int ayah;
  SurahBuilder(
      {Key? key, this.sura, this.arabic, this.suraName, required this.ayah})
      : super(key: key);

  Widget SingleSuraBuilder(LenghtOfSura, bool view) {
    String fullSura = '';
    int previousVerses = 0;
    if (sura + 1 != 1) {
      for (int i = sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + AppConstants.noOfVerses[i];
      }
    }

    if (!view)
      for (int i = 0; i < LenghtOfSura; i++) {
        fullSura += (arabic[i + previousVerses]['aya_text']);
      }

    return SingleSuraBuilderWidget(
      fullSura: fullSura,
      previousVerses: previousVerses,
      sura: sura,
      view: view,
      LenghtOfSura: LenghtOfSura,
      arabic: arabic,
    );
  }

  @override
  Widget build(BuildContext context) {
    int LengthOfSura = AppConstants.noOfVerses[sura];

    return BlocBuilder<AppCubit, AppCubitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Tooltip(
              message: 'Mushaf Mode',
              child: TextButton(
                child: const Icon(
                  Icons.chrome_reader_mode,
                  color: Colors.white,
                ),
                onPressed: () {
                  AppCubit.get(context).changeview();
                },
              ),
            ),
            centerTitle: true,
            title: Text(
              // widget.
              suraName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'quran',
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 2.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ]),
            ),
            backgroundColor: const Color.fromARGB(255, 56, 115, 59),
          ),
          body: SingleSuraBuilder(LengthOfSura, AppCubit.get(context).view),
        );
      },
    );
  }
}

class RetunBasmala extends StatelessWidget {
  const RetunBasmala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Center(
        child: Text(
          'بسم الله الرحمن الرحيم',
          style: TextStyle(fontFamily: 'me_quran', fontSize: 30),
          textDirection: TextDirection.rtl,
        ),
      ),
    ]);
  }
}
