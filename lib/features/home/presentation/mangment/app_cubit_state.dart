part of 'app_cubit.dart';

@immutable
abstract class AppCubitState {}

class AppCubitInitial extends AppCubitState {}

class AppCubitChangeViewState extends AppCubitState {}

class AppCubitChangeFontSizeState extends AppCubitState {}
class AppCubitChangeMoshafSizeState extends AppCubitState {}
class AppCubitRestSizeState extends AppCubitState {}
