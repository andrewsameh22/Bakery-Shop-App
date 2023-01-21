import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/navbar/navbar_cubit.dart';
import '../business_logic/navbar/navbar_state.dart';
import '../styles/colours.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // specificIndex = NavbarCubit.get(context).currentIndex;

    return BlocProvider(
        create: (context) => NavbarCubit()
          ..SharedPref()
          ..TotalPriceCalculator(),
        child: BlocConsumer<NavbarCubit, NavbarState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NavbarCubit.get(context);
            return Scaffold(
                body: cubit.screens[cubit.currentIndex],
                // body: cubit.screens[cubit.currentIndex],
                bottomNavigationBar: BottomNavyBar(
                  selectedIndex: cubit.currentIndex,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  showElevation: false,
                  onItemSelected: (index) {
                    cubit.changeIndex(index);
                  },
                  items: [
                    BottomNavyBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                      ),
                      title: Text('Home'),
                      activeColor: primaryColor,
                      inactiveColor: Colors.black,
                    ),
                    BottomNavyBarItem(
                      icon: Icon(
                        CupertinoIcons.calendar,
                      ),
                      title: Text('Orders'),
                      activeColor: primaryColor,
                      inactiveColor: Colors.black,
                    ),
                    BottomNavyBarItem(
                      icon: Icon(
                        CupertinoIcons.cart,
                      ),
                      title: Text('Cart'),
                      activeColor: primaryColor,
                      inactiveColor: Colors.black,
                    ),
                    BottomNavyBarItem(
                      icon: Icon(
                        Icons.settings_outlined,
                      ),
                      title: Text('Settings'),
                      activeColor: primaryColor,
                      inactiveColor: Colors.black,
                    ),
                  ],
                ));
          },
        ));
  }
}
