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
                                  Orders: CurrentOrders))
                          : Flexible(
                              child:
                                  cubit.BuildOrderCategory(Orders: PastOrders)),
                      // Expanded(
                      //   child: ListView.builder(
                      //     // physics: NeverScrollableScrollPhysics(),
                      //     // shrinkWrap: true,
                      //     itemCount: Orders.length,
                      //     itemBuilder: (context, index) => Padding(
                      //       padding:
                      //           const EdgeInsets.symmetric(horizontal: 15.0),
                      //       child: GestureDetector(
                      //         onTap: () {},
                      //         child: Card(
                      //           elevation: 4.0,
                      //           color: Colors.white,
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(10)),
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(15.0),
                      //             child: Row(
                      //               children: [
                      //                 // Padding(
                      //                 //   padding: const EdgeInsets.all(8.0),
                      //                 //   child: Container(
                      //                 //     width: MediaQuery.of(context).size.width / 4,
                      //                 //     height:
                      //                 //         MediaQuery.of(context).size.height * 0.1,
                      //                 //     decoration: BoxDecoration(
                      //                 //       image: DecorationImage(
                      //                 //         image: AssetImage(model.product.image),
                      //                 //         fit: BoxFit.fitWidth,
                      //                 //       ),
                      //                 //       borderRadius: BorderRadius.circular(15),
                      //                 //     ),
                      //                 //   ),
                      //                 // ),
                      //                 Column(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Text(
                      //                       'Order ${index + 1}',
                      //                       maxLines: 2,
                      //                       overflow: TextOverflow.ellipsis,
                      //                       style: TextStyle(
                      //                         color: primaryColor,
                      //                         fontWeight: FontWeight.bold,
                      //                         fontSize: 16,
                      //                       ),
                      //                     ),
                      //                     Text(
                      //                       '${Orders[index].products[0].product.title} and other items...',
                      //                       style: TextStyle(
                      //                         color: Colors.black,
                      //                         fontWeight: FontWeight.bold,
                      //                         fontSize: 16,
                      //                       ),
                      //                     ),
                      //                     Text(
                      //                       Orders[index]
                      //                               .products
                      //                               .length
                      //                               .toString() +
                      //                           ' items',
                      //                       style: TextStyle(
                      //                         color: Colors.black,
                      //                         fontWeight: FontWeight.bold,
                      //                         fontSize: 16,
                      //                       ),
                      //                     ),
                      //                     Text(
                      //                       'Total Order Price: \$' +
                      //                           Orders[index]
                      //                               .ordertotalprice
                      //                               .toString(),
                      //                       style: TextStyle(
                      //                         color: Colors.black,
                      //                         fontWeight: FontWeight.bold,
                      //                         fontSize: 16,
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 Spacer(),
                      //
                      //                 Column(
                      //                   children: [
                      //                     Text(
                      //                       Orders[index].collected == false
                      //                           ? 'Mark as collected'
                      //                           : 'Marked as collected',
                      //                       style: TextStyle(
                      //                         fontSize: 12,
                      //                       ),
                      //                     ),
                      //                     RawMaterialButton(
                      //                       onPressed: Orders[index]
                      //                                   .collected ==
                      //                               false
                      //                           ? () {
                      //                               print(Orders[index]
                      //                                   .rating
                      //                                   .toString());
                      //                               showDialog(
                      //                                 context: context,
                      //                                 builder: (context) =>
                      //                                     AlertDialog(
                      //                                   title: Text(
                      //                                       'Rate Your Order Please'),
                      //                                   content:
                      //                                       buildOrderRating(),
                      //                                   actions: [
                      //                                     TextButton(
                      //                                       onPressed: () {
                      //                                         Orders[index]
                      //                                                 .rating =
                      //                                             rating;
                      //                                         print(Orders[
                      //                                                 index]
                      //                                             .rating
                      //                                             .toString());
                      //                                         cubit.emit(
                      //                                             NavbarTest());
                      //                                         Orders[index]
                      //                                                 .collected =
                      //                                             true;
                      //                                         Navigator.pop(
                      //                                             context);
                      //                                       },
                      //                                       child: Text(
                      //                                         'Submit',
                      //                                         style: TextStyle(
                      //                                           fontSize: 16,
                      //                                           color:
                      //                                               primaryColor,
                      //                                           fontWeight:
                      //                                               FontWeight
                      //                                                   .bold,
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                   ],
                      //                                 ),
                      //                               );
                      //                             }
                      //                           : null,
                      //                       elevation: 2.0,
                      //                       fillColor:
                      //                           Orders[index].collected == false
                      //                               ? Colors.grey
                      //                               : Colors.green,
                      //                       child: Icon(
                      //                         Icons.check,
                      //                         color: Colors.white,
                      //                       ),
                      //                       shape: CircleBorder(),
                      //                     ),
                      //                   ],
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
