import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../app_layout.dart';
import '../business_logic/navbar/navbar_cubit.dart';
import '../business_logic/navbar/navbar_state.dart';
import '../models/product_model.dart';
import '../screens/details_screen.dart';
import '../styles/colours.dart';
import '../styles/constants.dart';
import 'nav_settings.dart';

class NavHome extends StatefulWidget {
  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  @override
  Widget build(BuildContext context) {
    NavbarCubit cubit = NavbarCubit.get(context);
    return BlocConsumer<NavbarCubit, NavbarState>(
      listener: (context, stateNavbarCubit) {},
      builder: (context, state) {
        var cubit = NavbarCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 60,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Welcome Back, ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 34,
                                ),
                              ),
                              TextSpan(
                                text: cubit.Name,
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                          textScaleFactor: 0.5,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Showing ' + cubit.productCheck.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: primaryColor,
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: Icon(
                            cubit.ActiveProductsList == products
                                ? Icons.filter_alt_outlined
                                : Icons.filter_alt,
                            color: primaryColor,
                          ),
                          onSelected: cubit.choiceAction,
                          itemBuilder: (BuildContext context) {
                            return PopItems.choices.map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                  ),
                  cubit.BuildBakeryCategory(
                      category: cubit.ActiveProductsList.toList()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PopItems {
  static const String all = 'All Bakeries';
  static const String basic = 'Basic Bakeries';
  static const String pancakes = 'Pancakes';
  static const String cheesecakes = 'Cheesecakes';
  static const String donuts = 'Donuts';
  static const String piesandtarts = 'Pies and Tarts';
  static const String cinnabon = 'Cinnabon';

  static const List<String> choices = <String>[
    all,
    basic,
    pancakes,
    donuts,
    piesandtarts,
    cinnabon,
    cheesecakes,
  ];
}
