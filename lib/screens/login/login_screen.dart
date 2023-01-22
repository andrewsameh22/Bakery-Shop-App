import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ResuableWidgets/TXTFld.dart';
import '../../ResuableWidgets/default_button.dart';
import '../../business_logic/login/login_cubit.dart';
import '../../business_logic/login/login_state.dart';
import '../../guest.dart';
import '../../styles/colours.dart';
import '../home_screen.dart';
import '../signup/signup_screen.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: prefer_const_constructors

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isPass = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);

    return BlocProvider(
      create: (BuildContext context) => LoginCubit()..resetPrefs(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, stateNavbarCubit) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Image(
                        image: AssetImage('assets/images/bakerybg.png'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      TxtFld(
                        controller: usernameController,
                        label: 'Username',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TxtFld(
                        controller: passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please enter your password';
                          }
                          return null;
                        },
                        label: 'Password',
                        isPassword: isPass,
                        sicon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPass = !isPass;
                            });
                          },
                          icon: Icon(
                            isPass ? Icons.visibility_off : Icons.visibility,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     'Forgot Password?',
                      //     style: TextStyle(
                      //         fontSize: 14,
                      //         color: primaryColor,
                      //         decoration: TextDecoration.underline),
                      //   ),
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      defButton(
                        context: context,
                        text: 'Login',
                        color: primaryColor,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            try {
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
                              final prefs =
                                  await SharedPreferences.getInstance();

                              prefs.setString(
                                  'ClientName', '${usernameController.text}');
                              prefs.setString('ClientType', 'Account');
                            } catch (e) {
                              log(e.toString());
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
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
                                final prefs =
                                    await SharedPreferences.getInstance();

                                prefs.setString('ClientName', 'Guest');
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
                        text: 'Sign Up',
                        color: primaryColor,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
