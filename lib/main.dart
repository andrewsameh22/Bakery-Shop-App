import 'package:bakery_shop_application/styles/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/login/login_cubit.dart';
import 'business_logic/navbar/navbar_cubit.dart';
import 'business_logic/signup/signup_cubit.dart';
import 'screens/login/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Bakery());
}

class Bakery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignupCubit()),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => NavbarCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Palette.primaryswatch,
            primaryColor: primaryColor,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: primaryColor,
              ),
            ),
          ),
          home: LoginScreen(),
        ));
  }
}
