import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ResuableWidgets/def_icon_button.dart';
import '../ResuableWidgets/default_button.dart';
import '../bakery_profile.dart';
import '../business_logic/navbar/navbar_cubit.dart';
import '../business_logic/navbar/navbar_state.dart';
import '../models/bakery_model.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../navbar_screens/internal/buynow.dart';
import '../styles/constants.dart';
import 'home_screen.dart';
import 'login/login_screen.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String ClientType = '';

  void SharedTest() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      ClientType = prefs.getString('ClientType').toString();
    });
  }

  @override
  void initState() {
    SharedTest();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = NavbarCubit.get(context);

    cubit.numOfItems = 1;
    return BlocConsumer<NavbarCubit, NavbarState>(
      listener: (context, state) {},
      builder: (context, state) {
        // var cubit = NavbarCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: widget.product.color,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Spacer(),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            IconButton(
                              icon: Icon(
                                CartItems.isEmpty
                                    ? Icons.shopping_cart_outlined
                                    : Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ));

                                // cubit.changeIndex(2);
                                cubit.emit(NavbarTest());
                                Navigator.pop(context);

                                cubit.emit(NavbarTest());
                              },
                            ),
                            CartItems.isNotEmpty
                                ? Text(
                                    CartItems.length.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.3),
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.12,
                            left: 20.0,
                            right: 20.0,
                          ),
                          // height: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextButton(
                                child: Text(
                                  widget.product.bakeryName,
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w900,
                                    color: widget.product.color,
                                  ),
                                ),
                                onPressed: () {
                                  // print(widget.product.bakery.name.toString());
                                  // print(
                                  //     widget.product.bakeryreference.toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BakeryProfile(
                                          // bakery: widget.product.bakery,
                                          bakery: widget.product.bakeryName ==
                                                  'Mongini'
                                              ? Mongini
                                              : widget.product.bakeryName ==
                                                      'Etoile'
                                                  ? Etoile
                                                  : Exception,
                                        ),
                                      ));
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  widget.product.description,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              ClientType == 'Account'
                                  ? Column(
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            MaterialButton(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color:
                                                          widget.product.color,
                                                      width: 2),
                                                ),
                                                child: Icon(Icons.remove),
                                              ),
                                              onPressed: () {
                                                // cubit.numOfItems--;
                                                // cubit.emit(SelectmealDecrementItem());
                                                cubit.decnum();
                                              },
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0 / 2),
                                              child: Text(
                                                // if our item is less  then 10 then  it shows 01 02 like that
                                                cubit.numOfItems
                                                    .toString()
                                                    .padLeft(2, "0"),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                            ),
                                            MaterialButton(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color:
                                                          widget.product.color,
                                                      width: 2),
                                                ),
                                                child: Icon(Icons.add),
                                              ),
                                              onPressed: () {
                                                // setState(() {
                                                cubit.numOfItems++;
                                                cubit.emit(NavbarTest());
                                                // });
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                // margin: EdgeInsets.only(right: 20.0),
                                                height: 50,
                                                width: 58,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                    color: widget.product.color,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.add_shopping_cart,
                                                    color: widget.product.color,
                                                  ),
                                                  onPressed: () {
                                                    CartItems.any((element) =>
                                                            element.product ==
                                                            widget.product)
                                                        ? {
                                                            temp = CartItems.where(
                                                                (element) =>
                                                                    element
                                                                        .product ==
                                                                    widget
                                                                        .product),
                                                            // int tempCount= temp.
                                                            CartItems.removeWhere(
                                                                (element) =>
                                                                    element
                                                                        .product ==
                                                                    widget
                                                                        .product),

                                                            CartItems.add(CartModel(
                                                                product: widget
                                                                    .product,
                                                                counter: cubit
                                                                        .numOfItems +
                                                                    1)),
                                                          }
                                                        : CartItems.add(
                                                            CartModel(
                                                              product: widget
                                                                  .product,
                                                              counter: cubit
                                                                  .numOfItems,
                                                            ),
                                                          );
                                                    Fluttertoast.showToast(
                                                      msg: 'Added To Cart',
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          // widget.product.color,
                                                          Colors.black,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0,
                                                    );
                                                    cubit.emit(NavbarTest());
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  height: 50,
                                                  child: MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18)),
                                                    color: widget.product.color,
                                                    child: Text(
                                                      "Buy Now".toUpperCase(),
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onPressed:
                                                        ClientType == 'Account'
                                                            ? () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              BuyNow(),
                                                                    ));
                                                              }
                                                            : null,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          'To Add to Cart or Buy this item please log in First',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: widget.product.color,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                        ),
                                        defaultButton(
                                          text: 'Go to Login page',
                                          onpressed: () {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen(),
                                                ),
                                                (route) => false);
                                          },
                                          color: widget.product.color,
                                          context: context,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.product.type.toUpperCase() + ' Category',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                widget.product.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(text: "Price\n"),
                                        TextSpan(
                                          text: "\$${widget.product.price}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Expanded(
                                    child: Hero(
                                      tag: "${widget.product.type}",
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.asset(
                                          widget.product.image,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
