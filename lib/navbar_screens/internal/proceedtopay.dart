
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../ResuableWidgets/default_button.dart';
import '../../business_logic/navbar/navbar_cubit.dart';
import '../../business_logic/navbar/navbar_state.dart';
import '../../models/cart_model.dart';
import '../../models/order_model.dart';
import '../../models/product_tile.dart';
import '../../screens/home_screen.dart';
import '../../styles/colours.dart';
import '../../styles/constants.dart';

class Proceed extends StatelessWidget {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NavbarCubit()..TotalPriceCalculator(),
      child: BlocConsumer<NavbarCubit, NavbarState>(
        listener: (context, stateNavbarCubit) {},
        builder: (context, state) {
          var cubit = NavbarCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text(
                  'Payment',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Column(
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
                  Text(
                    'Total: ' + cubit.totalprice.toString() + '\$',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  defaultButton(
                    text: 'Place Order',
                    onpressed: () {
                      cubit.TotalPriceCalculator();

                      List<CartModel> TempCartOrder = List.from(CartItems);

                      CurrentOrders.add(
                        OrderModel(
                          products: TempCartOrder,
                          ordertotalprice: cubit.totalprice,
                        ),
                      );
                      Fluttertoast.showToast(
                        msg: 'Order Successfully Placed',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                          (route) => false);
                      CartItems.clear();
                    },
                    color: primaryColor,
                    context: context,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
