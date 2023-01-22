import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../business_logic/navbar/navbar_cubit.dart';
import '../business_logic/navbar/navbar_state.dart';
import '../models/product_tile.dart';
import '../styles/colours.dart';
import '../styles/constants.dart';
import 'nav_settings.dart';

class NavOrders extends StatefulWidget {
  @override
  State<NavOrders> createState() => _NavOrdersState();
}

class _NavOrdersState extends State<NavOrders> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavbarCubit, NavbarState>(
      listener: (context, stateNavbarCubit) {},
      builder: (context, state) {
        var cubit = NavbarCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
            ),
            body: CurrentOrders.isEmpty && PastOrders.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      Center(
                        child: Text(
                          'You have no orders yet',
                          style: TextStyle(
                              fontSize: 32,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            child: Text(
                              'Current Orders',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: cubit.OrdersType == 'current'
                                    ? primaryColor
                                    : Colors.black,
                              ),
                            ),
                            onPressed: () {
                              cubit.OrdersType = 'current';
                              cubit.emit(NavbarTest());
                            },
                          ),
                          TextButton(
                            child: Text(
                              'Past Orders',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: cubit.OrdersType == 'past'
                                    ? primaryColor
                                    : Colors.black,
                              ),
                            ),
                            onPressed: () {
                              cubit.OrdersType = 'past';
                              cubit.emit(NavbarTest());
                            },
                          ),
                        ],
                      ),
                      cubit.OrdersType == 'current'
                          ? Flexible(
                              child: cubit.BuildOrderCategory(
                                Orders: CurrentOrders,
                              ),
                            )
                          : Flexible(
                              child: cubit.BuildOrderCategory(
                                Orders: PastOrders,
                              ),
                            ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
