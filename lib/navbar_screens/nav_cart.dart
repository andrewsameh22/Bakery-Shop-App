
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ResuableWidgets/default_button.dart';
import '../business_logic/navbar/navbar_cubit.dart';
import '../business_logic/navbar/navbar_state.dart';
import '../models/product_model.dart';
import '../models/product_tile.dart';
import '../styles/colours.dart';
import '../styles/constants.dart';
import 'internal/proceedtopay.dart';

class NavCart extends StatelessWidget {
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
                'Your Cart',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
            ),
            body: CartItems.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      Center(
                        child: Text(
                          'Your Cart is empty',
                          style: TextStyle(
                              fontSize: 36,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Flexible(
                        child: ListView.builder(
                            // shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: CartItems.length,
                            itemBuilder: (context, index) {
                              return ProductTile(
                                model: CartItems[index],
                              );
                            }),
                      ),
                      // Text(
                      //   'Total: ' + cubit.totalprice.toString() + '\$',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 32,
                      //   ),
                      // ),
                      defaultButton(
                        text: 'Proceed To Pay',
                        onpressed: () {
                          cubit.TotalPriceCalculator();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Proceed(),
                              ));
                        },
                        color: primaryColor,
                        context: context,
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
