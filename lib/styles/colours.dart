import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffEF995C);
// const Color primaryColor = Color(0xff73AB5B);
const Color secColor = Colors.greenAccent;

List Colours = [
  Color(0xFF3D82AE),
  Color(0xFFD3A984),
  Color(0xFF9D77AE),
  Color(0xFF989493),
  Color(0xFFFB7883),
  Color(0xFF54052c),
  Color(0xFF61ad98),
  Color(0xFFEDBA4D),
];

class Palette {
  static const MaterialColor primaryswatch = const MaterialColor(
    0xffEF995C, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffce5641), //10%
      100: const Color(0xffb74c3a), //20%
      200: const Color(0xffa04332), //30%
      300: const Color(0xff89392b), //40%
      400: const Color(0xff733024), //50%
      500: const Color(0xff5c261d), //60%
      600: const Color(0xff451c16), //70%
      700: const Color(0xff2e130e), //80%
      800: const Color(0xff170907), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
