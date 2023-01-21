// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../models/product_model.dart';
// import 'add_to_cart.dart';
// import 'cart_counter.dart';
// import 'product_title_with_image.dart';
//
// class ProdBody extends StatelessWidget {
//   final Product product;
//
//   const ProdBody({Key? key, required this.product}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // It provide us total height and width
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: size.height,
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.only(top: size.height * 0.3),
//                   padding: EdgeInsets.only(
//                     top: size.height * 0.12,
//                     left: 20.0,
//                     right: 20.0,
//                   ),
//                   // height: 500,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(24),
//                       topRight: Radius.circular(24),
//                     ),
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       SizedBox(height: 20.0 / 2),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 20.0),
//                         child: Text(
//                           product.description,
//                           style: TextStyle(height: 1.5),
//                         ),
//                       ),
//                       SizedBox(height: 20.0 / 2),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           CartCounter(),
//                           Container(
//                             padding: EdgeInsets.all(8),
//                             height: 32,
//                             width: 32,
//                             decoration: BoxDecoration(
//                               color: Color(0xFFFF6464),
//                               shape: BoxShape.circle,
//                             ),
//                             child: SvgPicture.asset("assets/oldicons/heart.svg"),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 20.0 / 2),
//                       AddToCart(product: product)
//                     ],
//                   ),
//                 ),
//                 ProductTitleWithImage(product: product)
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
