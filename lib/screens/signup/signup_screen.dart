import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../ResuableWidgets/TXTFld.dart';
import '../../../ResuableWidgets/default_button.dart';
import '../../../business_logic/signup/signup_cubit.dart';
import '../../business_logic/signup/signup_state.dart';
import '../../guest.dart';
import '../../navbar_screens/nav_home.dart';
import '../../styles/colours.dart';
import 'package:http/http.dart' as http;
import '../login/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignupCubit cubit = SignupCubit.get(context);

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Center(
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 40.0,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TxtFld(
                    controller: cubit.usernameController,
                    label: 'Username',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TxtFld(
                    controller: cubit.emailController,
                    label: 'E-Mail',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TxtFld(
                    controller: cubit.phoneNumberController,
                    keyType: TextInputType.phone,
                    label: 'Phone Number',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TxtFld(
                    controller: cubit.passwordController,
                    label: 'Password',
                    isPassword: cubit.visiblePassword,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your password';
                      }
                      return null;
                    },
                    sicon: IconButton(
                      onPressed: () {
                        cubit.changePasswordVisibility();
                      },
                      icon: Icon(
                        cubit.visiblePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TxtFld(
                    controller: cubit.confirmPasswordController,
                    label: 'Confirm Your Password',
                    isPassword: cubit.visibleConfirmPassword,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your email address';
                      } else if (cubit.passwordController.text !=
                          cubit.confirmPasswordController.text)
                        return 'passwords don\'t match';
                      return null;
                    },
                    sicon: IconButton(
                      onPressed: () {
                        cubit.changeConfirmPasswordVisibility();
                      },
                      icon: Icon(
                        cubit.visibleConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  defButton(
                    context: context,
                    text: 'Sign Up',
                    color: primaryColor,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Fluttertoast.showToast(
                            msg: "Successfully Signup Sign in to continue",
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
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Divider(
                        indent: 4,
                        height: 1,
                        color: primaryColor,
                        thickness: 1,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: TextButton(
                          child: Text(
                            'Continue as a guest',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Guest(),
                                ));
                          },
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        endIndent: 4,
                        height: 1,
                        color: primaryColor,
                        thickness: 1,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  emptydefButton(
                    context: context,
                    text: 'Sign In',
                    color: primaryColor,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
