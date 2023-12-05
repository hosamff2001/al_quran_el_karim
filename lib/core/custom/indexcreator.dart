import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../resources/constants_manager.dart';
import '../utliz/routers.dart';
import 'arabicsuranumber.dart';

Container indexCreator(quran, context) {
  return Container(
    color: const Color.fromARGB(255, 221, 250, 236),
    child: ListView(
      children: [
        for (int i = 0; i < 114; i++)
          Container(
            color: i % 2 == 0
                ? const Color.fromARGB(255, 253, 247, 230)
                : const Color.fromARGB(255, 253, 251, 240),
            child: TextButton(
              child: Row(
                children: [
                  ArabicSuraNumber(number: i),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    AppConstants.arabicName[i]['name'],
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontFamily: 'quran',
                        shadows: [
                          Shadow(
                            offset: Offset(.5, .5),
                            blurRadius: 1.0,
                            color: Color.fromARGB(255, 130, 130, 130),
                          )
                        ]),
                   
                  ),
                ],
              ),
              onPressed: () {
                AppConstants.fabIsClicked = false;
                GoRouter.of(context).push(MyRoute.kSuraView, extra: i);
              },
            ),
          ),
      ],
    ),
  );
}
