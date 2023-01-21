
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
                          'Showing ' + cubit.productCheck,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: primaryColor,
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: Icon(
                            cubit.productCheck == 'All Bakeries'
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     TextButton(
                  //       child: Text('All Bakeries'),
                  //       onPressed: () {
                  //         cubit.productCheck = 'All Bakeries';
                  //         cubit.emit(NavbarTest());
                  //       },
                  //     ),
                  //     TextButton(
                  //       child: Text('Light Bakeries'),
                  //       onPressed: () {
                  //         cubit.productCheck = 'Light Bakeries';
                  //         cubit.emit(NavbarTest());
                  //       },
                  //     ),
                  //     TextButton(
                  //       child: Text('Sweet Bakeries'),
                  //       onPressed: () {
                  //         cubit.productCheck = 'Sweet Bakeries';
                  //         cubit.emit(NavbarTest());
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: ListView.builder(
                  //     physics: NeverScrollableScrollPhysics(),
                  //     shrinkWrap: true,
                  //     // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     //   crossAxisCount: 2,
                  //     //   crossAxisSpacing: 4.0,
                  //     //   mainAxisSpacing: 4.0,
                  //     // ),
                  //     itemCount: products.length,
                  //     itemBuilder: (context, index) {
                  //       // return Padding(
                  //       //   padding: const EdgeInsets.all(5.0),
                  //       //   child: InkWell(
                  //       //     onTap: () {
                  //       //       // Navigator.push(
                  //       //       //     context,
                  //       //       //     MaterialPageRoute(
                  //       //       //       builder: (context) =>
                  //       //       //           homeCards[index].DestScreen,
                  //       //       //     ));
                  //       //     },
                  //       //     child: Material(
                  //       //       borderRadius: BorderRadius.circular(20.0),
                  //       //       color: Colors.white,
                  //       //       elevation: 5.0,
                  //       //       // decoration: BoxDecoration(
                  //       //       //   boxShadow: [
                  //       //       //     BoxShadow(
                  //       //       //       color: Colors.grey.withOpacity(0.3),
                  //       //       //       spreadRadius: 3,
                  //       //       //       blurRadius: 5,
                  //       //       //       offset:
                  //       //       //           Offset(0, 3), // changes position of shadow
                  //       //       //     ),
                  //       //       //   ],
                  //       //       // ),
                  //       //       child: Column(
                  //       //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       //         children: [
                  //       //           SizedBox(
                  //       //             child: Stack(
                  //       //               alignment: Alignment.center,
                  //       //               children: [
                  //       //                 Container(
                  //       //                   height:
                  //       //                       MediaQuery.of(context).size.height *
                  //       //                           0.1,
                  //       //                   width:
                  //       //                       MediaQuery.of(context).size.height *
                  //       //                           0.1,
                  //       //                   decoration: BoxDecoration(
                  //       //                     color: Colors.grey.shade200,
                  //       //                     borderRadius: BorderRadius.all(
                  //       //                         Radius.circular(100)),
                  //       //                   ),
                  //       //                 ),
                  //       //                 SvgPicture.asset(
                  //       //                   products[index].ImagePath,
                  //       //                   height:
                  //       //                       MediaQuery.of(context).size.height *
                  //       //                           0.06,
                  //       //                 ),
                  //       //               ],
                  //       //             ),
                  //       //           ),
                  //       //           Text(
                  //       //             homeCards[index].title,
                  //       //             style: TextStyle(
                  //       //               color: primaryColor,
                  //       //               fontWeight: FontWeight.bold,
                  //       //               fontSize: 20,
                  //       //             ),
                  //       //           ),
                  //       //         ],
                  //       //       ),
                  //       //     ),
                  //       //   ),
                  //       // );
                  //       return GestureDetector(
                  //         onTap: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => DetailsScreen(
                  //                   product: products[index],
                  //                 ),
                  //               ));
                  //         },
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               Container(
                  //                 width:
                  //                 MediaQuery.of(context).size.width * 0.7,
                  //                 height: MediaQuery.of(context).size.height *
                  //                     0.3,
                  //                 // decoration: BoxDecoration(
                  //                 //   borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //                 //   color: product.color,
                  //                 // ),
                  //                 child: ClipRRect(
                  //                   borderRadius: BorderRadius.circular(20.0),
                  //                   child: Image.asset(
                  //                     products[index].image,
                  //                     // width: MediaQuery.of(context).size.width * 0.6,
                  //                     // height: MediaQuery.of(context).size.height * 0.2,
                  //                     fit: BoxFit.cover,
                  //                   ),
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 height: MediaQuery.of(context).size.height *
                  //                     0.01,
                  //               ),
                  //               Text(
                  //                 products[index].title,
                  //                 style: TextStyle(
                  //                   color: primaryColor,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: 17,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 "\$${products[index].price}",
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: 16,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // )
                  cubit.productCheck == 'All Bakeries'
                      ? cubit.BuildBakeryCategory(category: products)
                      : cubit.productCheck == 'Light Bakeries'
                          ? cubit.BuildBakeryCategory(
                              category: lightproducts.toList())
                          : cubit.productCheck == 'Sweet Bakeries'
                              ? cubit.BuildBakeryCategory(
                                  category: sweetproducts.toList())
                              : Container(),
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
  static const String light = 'Light Bakeries';
  static const String sweet = 'Sweet Bakeries';

  static const List<String> choices = <String>[
    all,
    light,
    sweet,
  ];
}
