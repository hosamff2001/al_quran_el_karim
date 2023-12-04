import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/resources/constants_manager.dart';

part 'app_cubit_state.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(AppCubitInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  void initApp() {
    WidgetsBinding.instance.addPostFrameCallback((_) => jumptoAya);
    emit(AppCubitInitial());
  }

  bool view = true;
  void changeview() {
    view = !view;
    emit(AppCubitChangeViewState());
  }

  jumptoAya(int ayah) {
    if (AppConstants.fabIsClicked) {
      AppConstants.itemScrollController.scrollTo(
          index: ayah,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic);
    }
    AppConstants.fabIsClicked = false;
  }
}
