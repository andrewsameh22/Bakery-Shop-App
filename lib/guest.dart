import 'package:bakery_shop_application/styles/colours.dart';
import 'package:flutter/material.dart';

import 'navbar_screens/nav_home.dart';

class Guest extends StatelessWidget {
  const Guest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.primaryswatch,
        primaryColor: primaryColor,
      ),
      home: NavHome(),
    );
  }
}
