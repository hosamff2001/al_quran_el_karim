import 'package:al_quran_el_karim/core/resources/constants_manager.dart';
import 'package:al_quran_el_karim/features/home/presentation/mangment/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'singlesurabuilder.dart';

// ignore: must_be_immutable
class SurahBuilder extends StatefulWidget {
  final sura;
  final arabic;
  final suraName;
  int ayah;
  SurahBuilder({Key? key, this.sura, this.arabic, this.suraName,required this.ayah })
      : super(key: key);

  @override
  State<SurahBuilder> createState() => _SurahBuilderState();
}

class _SurahBuilderState extends State<SurahBuilder> {
  @override
  void initState() {
       WidgetsBinding.instance.addPostFrameCallback((_) => jumptoAya());
    super.initState();
  }
  
  jumptoAya() {
    if (AppConstants.fabIsClicked) {
      AppConstants.itemScrollController.scrollTo(
          index: widget.ayah,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic);
    }
    AppConstants.fabIsClicked = false;
  }
  Widget SingleSuraBuilder(lenghtOfSura, bool view) {
    String fullSura = '';
    int previousVerses = 0;
    if (widget.sura + 1 != 1) {
      for (int i = widget.sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + AppConstants.noOfVerses[i];
      }
    }

    if (!view)
      for (int i = 0; i < lenghtOfSura; i++) {
        fullSura += (widget.arabic[i + previousVerses]['aya_text']);
      }

    return SingleSuraBuilderWidget(
      fullSura: fullSura,
      previousVerses: previousVerses,
      sura: widget.sura,
      view: view,
      lenghtOfSura: lenghtOfSura,
      arabic: widget.arabic,
    );
  }

  @override
  Widget build(BuildContext context) {
    int lengthOfSura = AppConstants.noOfVerses[widget.sura];

    return BlocBuilder<AppCubit, AppCubitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_forward_ios))
            ],
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
              widget.suraName,
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
          ),
          body: SingleSuraBuilder(lengthOfSura, AppCubit.get(context).view),
        );
      },
    );
  }
}
