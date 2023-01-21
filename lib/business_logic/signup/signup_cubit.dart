import 'dart:developer';

import 'package:bakery_shop_application/business_logic/signup/signup_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../screens/login/login_screen.dart';
import '../../styles/colours.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String gender = 'm';

  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  bool visiblePassword = false;
  bool visibleConfirmPassword = false;

  // function to change visibility of password
  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(VisiblePasswordState());
  }

  void changeConfirmPasswordVisibility() {
    visibleConfirmPassword = !visibleConfirmPassword;
    emit(VisibleConfirmPasswordState());
  }

  void changeGender(val) {
    gender = val;
    emit(ChangeGenderState());
  }

  Future postSignup(context) async {
    // http
    try {
      final url = Uri.parse(
          'https://workshop.orangedigitalcenteregypt.com/api/v1/register/');
      http
          .post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "name": usernameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "phoneNumber": phoneNumberController.text,
          "gender": 'm',
        }),
      )
          .then((value) {
        log("value: " + value.body.toString());

        if (value.statusCode == 200) {
          print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
          Fluttertoast.showToast(
              msg: "Successfully Signup",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: primaryColor,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
              (route) => false);
        }
        emit(GetSignupSuccessState());
      });
    } catch (e) {
      log(e.toString());
      emit(GetSignupErrorState());
    }

    //Dio
    // var json = {
    //   "name": nameController.text,
    //   "email": emailController.text,
    //   "password": passwordController.text,
    //   "phoneNumber": phoneNumberController.text,
    //   "gender": gender == 'male' ? 'm' : 'f',
    // };

    // DioHelper.postData(url: registerEndPoint, data: json).then((value) {
    //   if (value.statusCode == 200) {
    //     print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
    //     Fluttertoast.showToast(
    //         msg: "Successfully Signup",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.BOTTOM,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.green,
    //         textColor: Colors.white,
    //         fontSize: 16.0);
    //     Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => LoginScreen(),
    //         ),
    //         (route) => false);
    //   }
    //   emit(GetSignupSuccessState());
    // }).catchError((e) {
    //   print(e);
    //   emit(GetSignupErrorState());
    // });
  }
}
