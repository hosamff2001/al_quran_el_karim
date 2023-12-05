import 'package:al_quran_el_karim/core/resources/color_manager.dart';
import 'package:al_quran_el_karim/features/home/presentation/mangment/app_cubit.dart';
import 'package:al_quran_el_karim/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/resources/constants_manager.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<AppCubit, AppCubitState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                S.of(context).setting,
              ),
              backgroundColor: ColorManager.primary,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        S.of(context).Font_Size,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Slider(
                        value: AppConstants.arabicFontSize,
                        min: 20,
                        max: 40,
                        onChanged: (value) {
                          AppCubit.get(context).changefontsize(value);
                        },
                      ),
                      Text(
                        "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                        style: TextStyle(
                            fontFamily: 'quran',
                            fontSize: AppConstants.arabicFontSize),
                        textDirection: TextDirection.rtl,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(),
                      ),
                      Text(
                        S.of(context).Moshaf_Size,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Slider(
                        value: AppConstants.mushafFontSize,
                        min: 20,
                        max: 50,
                        onChanged: (value) {
                          AppCubit.get(context).changemoshafsize(value);
                        },
                      ),
                      Text(
                        "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                        style: TextStyle(
                            fontFamily: 'quran',
                            fontSize: AppConstants.mushafFontSize),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                AppCubit.get(context).restfontsize();
                              },
                              child: Text(S.of(context).Reset,
                                  style: TextStyle(color: ColorManager.white))),
                          ElevatedButton(
                            onPressed: () {
                              AppConstants.saveSettings();
                              GoRouter.of(context).pop();
                            },
                            child: Text(S.of(context).Save,
                                style: TextStyle(color: ColorManager.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
