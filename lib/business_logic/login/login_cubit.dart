import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  void resetPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('ClientType', 'Guest');
    emit(LoginTest());
  }

  bool visiblePassword = true;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(PasswordVisibilityState());
  }
}
