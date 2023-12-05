import 'package:al_quran_el_karim/features/setting/view/settingview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/mangment/app_cubit.dart';
import '../../features/home/presentation/view/homescreen.dart';
import '../../features/home/presentation/view/widgets/surahbuilder.dart';
import '../../features/splash/view/splashscreen.dart';
import '../resources/constants_manager.dart';

abstract class MyRoute {
  static const kSplashView = '/';
  static const kHomeView = '/home';
  static const kSuraBookMarkView = '/surabookmark';
  static const kSuraView = '/sura';
  static const kSettingView = '/setting';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: kSettingView,
        builder: (BuildContext context, GoRouterState state) {
          return const Settings();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocBuilder<AppCubit, AppCubitState>(
            builder: (context, state) {
              return HomeScreen();
            },
          );
        },
      ),
      GoRoute(
        path: kSuraBookMarkView,
        builder: (BuildContext context, GoRouterState state) {
          return SurahBuilder(
            arabic: AppConstants.quran[0],
            sura: AppConstants.bookmarkedSura - 1,
            suraName: AppConstants.arabicName[AppConstants.bookmarkedSura - 1]
                ['name'],
            ayah: AppConstants.bookmarkedAyah,
          );
        },
      ),
      GoRoute(
        path: kSuraView,
        builder: (BuildContext context, GoRouterState state) {
          return SurahBuilder(
            arabic: AppConstants.quran[0],
            sura: state.extra as int,
            suraName: AppConstants.arabicName[state.extra as int]['name'],
            ayah: 0,
          );
        },
      ),
    ],
  );
}
