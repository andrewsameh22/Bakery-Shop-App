// import 'package:bakery/models/product_model.dart';
// import 'package:flutter/material.dart';
//
// import '../styles/colours.dart';
//
// class ItemCard extends StatelessWidget {
//   final Product product;
//   final Function onpressed;
//   const ItemCard({
//     Key? key,
//     required this.product,
//     required this.onpressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onpressed(),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.7,
//               height: MediaQuery.of(context).size.height * 0.3,
//               // decoration: BoxDecoration(
//               //   borderRadius: BorderRadius.all(Radius.circular(30.0)),
//               //   color: product.color,
//               // ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20.0),
//                 child: Image.asset(
//                   product.image,
//                   // width: MediaQuery.of(context).size.width * 0.6,
//                   // height: MediaQuery.of(context).size.height * 0.2,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Text(
//               product.title,
//               style: TextStyle(
//                 color: primaryColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 17,
//               ),
//             ),
//             Text(
//               "\$${product.price}",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
