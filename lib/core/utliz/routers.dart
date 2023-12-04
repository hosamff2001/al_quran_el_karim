import 'package:al_quran_el_karim/features/home/presentation/mangment/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/view/homescreen.dart';
import '../../features/splash/view/splashscreen.dart';

abstract class MyRoute {
  static const kHomeView = '/home';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AppCubit()..initApp(),
            child: BlocBuilder<AppCubit, AppCubitState>(
              builder: (context, state) {
                return HomeScreen();
              },
            ),
          );
        },
      ),
    ],
  );
}
