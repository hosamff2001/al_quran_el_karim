import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/constants_manager.dart';

part 'app_cubit_state.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(AppCubitInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  bool view = true;
  void changeview() {
    view = !view;
    emit(AppCubitChangeViewState());
  }

  void changefontsize(var value) {
    AppConstants.arabicFontSize = value;
    emit(AppCubitChangeFontSizeState());
  }

  void changemoshafsize(var value) {
    AppConstants.mushafFontSize = value;
    emit(AppCubitChangeMoshafSizeState());
  }

  void restfontsize() {
    AppConstants.arabicFontSize = 28;
    AppConstants.mushafFontSize = 40;
    AppConstants.saveSettings();
    emit(AppCubitRestSizeState());
  }
}
