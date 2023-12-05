import 'package:al_quran_el_karim/core/resources/language_manager.dart';
import 'package:al_quran_el_karim/core/utliz/cashmemory.dart';
import 'package:al_quran_el_karim/features/home/presentation/mangment/app_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/resources/theme_manager.dart';
import 'core/utliz/routers.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CashHelper.init();
  runApp(
    MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp.router(
        routerConfig: MyRoute.router,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: Locale(LanguageTypeExtension(LanguageType.ARABIC).getValue()),
        title: 'Movies App',
        theme: getApplicationTheme(),
      ),
    );
  }
}
