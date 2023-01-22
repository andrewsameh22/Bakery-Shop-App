import 'package:bakery_shop_application/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bakery_profile.dart';
import '../business_logic/navbar/navbar_cubit.dart';
import '../business_logic/navbar/navbar_state.dart';
import '../styles/colours.dart';
import '../styles/constants.dart';
import 'bakery_model.dart';
import 'cart_model.dart';

class ProductTile extends StatelessWidget {
  // final Product product;
  final CartModel model;
  const ProductTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavbarCubit, NavbarState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NavbarCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 4.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(model.product.image),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BakeryProfile(
                                  // bakery: widget.product.bakery,
                                  bakery: model.product.bakeryName == 'Mongini'
                                      ? Mongini
                                      : model.product.bakeryName == 'Etoile'
                                          ? Etoile
                                          : Exception,
                                ),
                              ));
                        },
                        child: Text(
                          model.product.bakeryName,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        model.product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\$' + model.product.price.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          model.counter > 1 ? model.counter-- : null;
                          cubit.TotalPriceCalculator();
                          cubit.emit(NavbarTest());
                        },
                        icon: Icon(Icons.remove),
                        iconSize: 20.0,
                      ),
                      Text(
                        model.counter.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          model.counter++;
                          cubit.TotalPriceCalculator();
                          cubit.emit(NavbarTest());
                        },
                        icon: Icon(Icons.add),
                        iconSize: 20.0,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      CartItems.remove(model);
                      cubit.emit(NavbarTest());
                    },
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
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
