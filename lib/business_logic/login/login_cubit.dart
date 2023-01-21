import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../screens/home_screen.dart';
import '../../styles/colours.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  bool visiblePassword = false;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(PasswordVisibilityState());
  }

  void login({
    required context,
    required String email,
    required String password,
    // required Function(String) loginError,
  }) {
    emit(LoginLoading());

    try {
      final url = Uri.parse(
          'https://workshop.orangedigitalcenteregypt.com/api/v1/login/');
      http
          .post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "email": email,
          "password": password,
        }),
      )
          .then((value) {
        if (value.statusCode == 200) {
          print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
          Fluttertoast.showToast(
            msg: "Successfully Logged In",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: primaryColor,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
              (route) => false);
        }
        emit(LoginSuccess());
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
