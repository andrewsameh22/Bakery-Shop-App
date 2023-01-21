import 'dart:math';

import 'package:flutter/material.dart';

import '../styles/colours.dart';

var randomColor = (Colours..shuffle()).first;
int randomIndex = Random().nextInt(Colours.length);
void test() {
  print(lightproducts.where((element) => element.type == 'light'));
}

class Product {
  final String image, title, description, type;
  final String bakeryName;
  // final Bakery bakery;
  final int price;
  Color color = Colours[Random().nextInt(Colours.length)];
  Product({
    required this.type,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.bakeryName,
    // required this.bakery,
  });
}

class Bakery {
  final String name;
  final String rating;
  final Iterable<Product> listOfProducts;
  final String image;
  Bakery({
    required this.name,
    required this.listOfProducts,
    required this.rating,
    required this.image,
  });
}

// class LightProduct {
//   final String image, title, description, type;
//   final int price;
//   Color color = Colours[Random().nextInt(Colours.length)];
//   LightProduct({
//     required this.type,
//     required this.image,
//     required this.title,
//     required this.price,
//     required this.description,
//   });
// }
//
// class SweetProduct {
//   final String image, title, description;
//   final int price;
//   Color color = Colours[Random().nextInt(Colours.length)];
//   SweetProduct({
//     required this.image,
//     required this.title,
//     required this.price,
//     required this.description,
//   });
// }

Iterable<Product> sweetproducts =
    products.where((element) => element.type == 'sweet');
Iterable<Product> lightproducts =
    products.where((element) => element.type == 'light');

Iterable<Product> EtoileProducts =
    products.where((element) => element.bakeryName == 'Etoile');

Iterable<Product> MonginiProducts =
    products.where((element) => element.bakeryName == 'Mongini');

Iterable<Product> ExceptionProducts =
    products.where((element) => element.bakeryName == 'Exception');

// List<Bakery> bakeries = [
//   Bakery(
//     name: 'Etoile',
//     listOfProducts: EtoileProducts,
//     rating: 'Very Good',
//     image: "assets/images/etoile.png",
//   ),
//   Bakery(
//     name: 'Exception',
//     listOfProducts: ExceptionProducts,
//     rating: 'Excellent',
//     image: "assets/images/exception.png",
//   ),
//   Bakery(
//     name: 'Mongini',
//     listOfProducts: MonginiProducts,
//     rating: 'Good',
//     image: "assets/images/monginis.png",
//   ),
// ];
Bakery Exception = Bakery(
  name: 'Exception',
  listOfProducts: ExceptionProducts,
  rating: 'Excellent',
  image: "assets/images/exception.png",
);
Bakery Etoile = Bakery(
  name: 'Etoile',
  listOfProducts: EtoileProducts,
  rating: 'Very Good',
  image: "assets/images/etoile.png",
);
Bakery Mongini = Bakery(
  name: 'Mongini',
  listOfProducts: MonginiProducts,
  rating: 'Good',
  image: "assets/images/monginis.png",
);
List<Product> products = [
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'light',
    title: "Bread",
    price: 2,
    description:
        "a yeast-raised bread made of dough containing water and distinguished by its thick, well-browned crust, usually made in long, slender, tapered loaves.",
    image: 'assets/images/bread.jpg',
  ),
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'light',
    title: "Cake",
    price: 6,
    description:
        " a breadlike food made from a dough or batter that is usually fried or baked in small flat shapes and is often unleavened. : a sweet baked food made from a dough or thick batter usually containing flour and sugar and often shortening, eggs, and a raising agent (such as baking powder)",
    image: "assets/images/cake.jpg",
  ),
  Product(
    // bakery: Exception,
    bakeryName: 'Exception',
    type: 'light',
    title: "Cinnabon",
    price: 12,
    description:
        " cinnamon roll is made with a combination of warm dough, legendary Makara cinnamon, and signature cream cheese for a freshly baked, irresistible sweet treat.",
    image: "assets/images/cinnabon.jpg",
  ),
  Product(
    // bakery: Exception,
    bakeryName: 'Exception',
    type: 'light',
    title: "Cookies",
    price: 8,
    description:
        "a baked or cooked snack or dessert that is typically small, flat and sweet.",
    image: "assets/images/cookies.jpg",
  ),
  Product(
    // bakery: Mongini,
    bakeryName: 'Mongini',
    type: 'sweet',
    title: "Donuts",
    price: 6,
    description:
        "a type of food made from leavened fried dough. It is popular in many countries and is prepared in various forms as a sweet snack that can be homemade or purchased in bakeries, supermarkets, food stalls, and franchised specialty vendors.",
    image: "assets/images/donuts.jpg",
  ),
  Product(
    // bakery: Exception,
    bakeryName: 'Exception',
    type: 'light',
    title: "Croissant",
    price: 4,
    description:
        "the dough is layered with butter, rolled and folded several times in succession, then rolled into a thin sheet, in a technique called laminating. The process results in a layered, flaky texture, similar to a puff pastry.",
    image: "assets/images/croissant.jpg",
  ),
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'light',
    title: "Cupcake",
    price: 5,
    description:
        "a small cake designed to serve one person, which may be baked in a small thin paper or aluminum cup.",
    image: "assets/images/cupcake.jpg",
  ),
  Product(
    // bakery: Exception,
    bakeryName: 'Exception',
    type: 'sweet',
    title: "Waffle",
    price: 10,
    description:
        "crisp raised cake baked in a waffle iron, a hinged metal griddle with a honeycombed or fancifully engraved surface that allows a thin layer of batter to cook evenly and crisply.",
    image: "assets/images/waffle.jpg",
  ),
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'sweet',
    title: "Cheesecake",
    price: 8,
    description:
        "a dessert consisting of a thick, creamy filling of cheese, eggs, and sugar over a thinner crust and topped with sweet or sometimes salty items.",
    image: "assets/images/cheesecake.jpg",
  ),
  Product(
    // bakery: Mongini,
    bakeryName: 'Mongini',
    type: 'sweet',
    title: "Pie",
    price: 8,
    description:
        "dish made by lining a shallow container with pastry and filling the container with a sweet or savoury mixture. A top crust may be added; the pie is baked until the crust is crisp and the filling is cooked through",
    image: "assets/images/pie.jpg",
  ),
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'sweet',
    title: "Tart",
    price: 9,
    description:
        "a baked dish consisting of a filling over a pastry base with an open top not covered with pastry. The pastry is usually shortcrust pastry; the filling may be sweet or savoury, though modern tarts are usually fruit-based, sometimes with custard.",
    image: "assets/images/tart.jpg",
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
