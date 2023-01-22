import 'package:bakery_shop_application/styles/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'business_logic/navbar/navbar_cubit.dart';
import 'business_logic/navbar/navbar_state.dart';
import 'models/bakery_model.dart';
import 'models/product_model.dart';

class BakeryProfile extends StatefulWidget {
  final Bakery bakery;

  const BakeryProfile({Key? key, required this.bakery}) : super(key: key);

  @override
  State<BakeryProfile> createState() => _BakeryProfileState();
}

class _BakeryProfileState extends State<BakeryProfile> {
  double rating = 0;
  Widget buildRating() => RatingBar.builder(
      initialRating: widget.bakery.rating == 'Excellent'
          ? 5
          : widget.bakery.rating == 'Very Good'
              ? 4
              : widget.bakery.rating == 'Good'
                  ? 3
                  : 2,
      minRating: 1,
      itemSize: 30,
      itemPadding: EdgeInsets.symmetric(horizontal: 4),
      itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
      updateOnDrag: false,
      onRatingUpdate: (rating) {}
      // => setState(() {
      //       this.rating = rating;
      //     })

      );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavbarCubit, NavbarState>(
      listener: (context, stateNavbarCubit) {},
      builder: (context, state) {
        var cubit = NavbarCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Column(
            children: [
              Image(
                image: AssetImage(
                  widget.bakery.image,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                widget.bakery.name + ' Products',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: primaryColor,
                ),
              ),
              Text(
                'Rating: ' + widget.bakery.rating,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: primaryColor,
                ),
              ),
              buildRating(),
              cubit.BuildBakeryCategory(
                category: widget.bakery.listOfProducts.toList(),
                // bakery: widget.product.bakeryreference,
              ),
            ],
          )),
        );
      },
    );
  }
}
