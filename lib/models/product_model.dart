import 'dart:math';

import 'package:flutter/material.dart';

import '../styles/colours.dart';

var randomColor = (Colours..shuffle()).first;
int randomIndex = Random().nextInt(Colours.length);

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

// Iterable<Product> sweetproducts =
//     products.where((element) => element.type == 'sweet');
// Iterable<Product> lightproducts =
//     products.where((element) => element.type == 'light');

Iterable<Product> cheesecakes =
    products.where((element) => element.type == 'cheesecake');

Iterable<Product> cinnabons =
    products.where((element) => element.type == 'cinnabon');

Iterable<Product> donuts =
    products.where((element) => element.type == 'donuts');

Iterable<Product> pancakes =
    products.where((element) => element.type == 'pancake');

Iterable<Product> basic = products.where((element) =>
    element.type == 'bread' ||
    element.type == 'cake' ||
    element.type == 'croissant');

Iterable<Product> piesandtarts = products
    .where((element) => element.type == 'pies' || element.type == 'tarts');

//Brands
Iterable<Product> EtoileProducts =
    products.where((element) => element.bakeryName == 'Etoile');

Iterable<Product> MonginiProducts =
    products.where((element) => element.bakeryName == 'Mongini');

Iterable<Product> ExceptionProducts =
    products.where((element) => element.bakeryName == 'Exception');

List<Product> products = [
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'bread',
    title: "Bread",
    price: 2,
    description:
        "a yeast-raised bread made of dough containing water and distinguished by its thick, well-browned crust, usually made in long, slender, tapered loaves.",
    image: 'assets/images/base/bread.jpg',
  ),
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'cake',
    title: "Cake",
    price: 6,
    description:
        "a breadlike food made from a dough or batter that is usually fried or baked in small flat shapes and is often unleavened. : a sweet baked food made from a dough or thick batter usually containing flour and sugar and often shortening, eggs, and a raising agent (such as baking powder)",
    image: "assets/images/base/cake.jpg",
  ),
  Product(
    // bakery: Exception,
    bakeryName: 'Exception',
    type: 'cinnabon',
    title: "Cinnabon Cake",
    price: 12,
    description:
        "multi cinnamon roll is made with a combination of warm dough, legendary Makara cinnamon, and signature cream cheese for a freshly baked, irresistible sweet treat forming a shape of cake.",
    image: "assets/images/cinnabon/cakeCinnabon.jpg",
  ),
  Product(
    // bakery: Exception,
    bakeryName: 'Exception',
    type: 'cinnabon',
    title: "Almond Cinnabon",
    price: 8,
    description:
        "cinnamon roll is made with a combination of warm dough, legendary Makara cinnamon, and signature cream cheese for a freshly baked, irresistible sweet treat with almonds.",
    image: "assets/images/cinnabon/almondCinnabon.jpg",
  ),
  Product(
    // bakery: Exception,
    bakeryName: 'Exception',
    type: 'cinnabon',
    title: "Chocolate Cinnabon",
    price: 7,
    description:
        "cinnamon roll is made with a combination of warm dough, legendary Makara cinnamon, and signature cream cheese for a freshly baked, irresistible sweet treat forming a shape of cake with chocolate.",
    image: "assets/images/cinnabon/chocolateCinnabon.jpg",
  ),
  // Product(
  //   // bakery: Exception,
  //   bakeryName: 'Exception',
  //   type: 'light',
  //   title: "Cookies",
  //   price: 8,
  //   description:
  //       "a baked or cooked snack or dessert that is typically small, flat and sweet.",
  //   image: "assets/images/cookies.jpg",
  // ),
  Product(
    // bakery: Mongini,
    bakeryName: 'Mongini',
    type: 'donuts',
    title: "Chocolate Donuts",
    price: 6,
    description:
        "a type of food made from leavened fried dough. It is popular in many countries and is prepared in various forms as a sweet snack that can be homemade or purchased in bakeries, supermarkets, food stalls, and franchised specialty vendors with chocolate.",
    image: "assets/images/donuts/chocolateDonuts.jpg",
  ),
  Product(
    // bakery: Mongini,
    bakeryName: 'Mongini',
    type: 'donuts',
    title: "Hazelnut Donuts",
    price: 6,
    description:
        "a type of food made from leavened fried dough. It is popular in many countries and is prepared in various forms as a sweet snack that can be homemade or purchased in bakeries, supermarkets, food stalls, and franchised specialty vendors with chocolate and hazelnut.",
    image: "assets/images/donuts/hazelnutDonuts.jpg",
  ),
  Product(
    // bakery: Mongini,
    bakeryName: 'Mongini',
    type: 'donuts',
    title: "Chocolate Donuts",
    price: 6,
    description:
        "a type of food made from leavened fried dough. It is popular in many countries and is prepared in various forms as a sweet snack that can be homemade or purchased in bakeries, supermarkets, food stalls, and franchised specialty vendors with chocolate.",
    image: "assets/images/donuts/chocolateDonuts.jpg",
  ),
  Product(
    // bakery: Mongini,
    bakeryName: 'Mongini',
    type: 'donuts',
    title: "Chocolate and Sprinkles Donuts",
    price: 6,
    description:
        "a type of food made from leavened fried dough. It is popular in many countries and is prepared in various forms as a sweet snack that can be homemade or purchased in bakeries, supermarkets, food stalls, and franchised specialty vendors with chocolate and sprinkles.",
    image: "assets/images/donuts/chocolateSprinklesDonuts.jpg",
  ),
  Product(
    // bakery: Exception,
    bakeryName: 'Exception',
    type: 'croissant',
    title: "Croissant",
    price: 4,
    description:
        "the dough is layered with butter, rolled and folded several times in succession, then rolled into a thin sheet, in a technique called laminating. The process results in a layered, flaky texture, similar to a puff pastry.",
    image: "assets/images/base/croissant.jpg",
  ),
  // Product(
  //   // bakery: Etoile,
  //   bakeryName: 'Etoile',
  //   type: 'light',
  //   title: "Cupcake",
  //   price: 5,
  //   description:
  //       "a small cake designed to serve one person, which may be baked in a small thin paper or aluminum cup.",
  //   image: "assets/images/cupcake.jpg",
  // ),
  // Product(
  //   // bakery: Exception,
  //   bakeryName: 'Exception',
  //   type: 'sweet',
  //   title: "Waffle",
  //   price: 10,
  //   description:
  //       "crisp raised cake baked in a waffle iron, a hinged metal griddle with a honeycombed or fancifully engraved surface that allows a thin layer of batter to cook evenly and crisply.",
  //   image: "assets/images/waffle.jpg",
  // ),
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'cheesecake',
    title: "Blueberry Cheesecake",
    price: 8,
    description:
        "a dessert consisting of a thick, creamy filling of cheese, eggs, and sugar over a thinner crust and topped with sweet or sometimes salty items with blueberry.",
    image: "assets/images/cheesecakes/blueberryCheesecake.jpg",
  ),
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'cheesecake',
    title: "Butter Cheesecake",
    price: 7,
    description:
        "a dessert consisting of a thick, creamy filling of cheese, eggs, and sugar over a thinner crust and topped with sweet or sometimes salty items with butter.",
    image: "assets/images/cheesecakes/butterCheesecake.jpg",
  ),
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'cheesecake',
    title: "Plain Cheesecake",
    price: 5,
    description:
        "a plain dessert consisting of a thick, creamy filling of cheese, eggs, and sugar over a thinner crust and topped with sweet or sometimes salty items.",
    image: "assets/images/cheesecakes/plainCheesecake.jpg",
  ),
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'cheesecake',
    title: "Strawberry Cheesecake",
    price: 5,
    description:
        "a dessert consisting of a thick, creamy filling of cheese, eggs, and sugar over a thinner crust and topped with sweet or sometimes salty items with strawberry.",
    image: "assets/images/cheesecakes/strawberryCheesecake.jpg",
  ),
  Product(
    // bakery: Mongini,
    bakeryName: 'Mongini',
    type: 'pancake',
    title: "Blueberry Pancakes",
    price: 8,
    description:
        "a thin, flat, usually round cake made from a mixture of flour, milk, and egg that is fried on both sides and usually eaten for breakfast with blueberry.",
    image: "assets/images/pancakes/blueberryPancake.jpg",
  ),
  Product(
    // bakery: Mongini,
    bakeryName: 'Mongini',
    type: 'pancake',
    title: "Honey Pancakes",
    price: 6,
    description:
        "a thin, flat, usually round cake made from a mixture of flour, milk, and egg that is fried on both sides and usually eaten for breakfast with honey.",
    image: "assets/images/pancakes/honeyPancake.jpg",
  ),
  Product(
    // bakery: Mongini,
    bakeryName: 'Mongini',
    type: 'pancake',
    title: "Strawberry Pancakes",
    price: 8,
    description:
        "a thin, flat, usually round cake made from a mixture of flour, milk, and egg that is fried on both sides and usually eaten for breakfast with strawberry.",
    image: "assets/images/pancakes/strawberryPancake.jpg",
  ),

  Product(
    // bakery: Mongini,
    bakeryName: 'Mongini',
    type: 'pies',
    title: "Pie",
    price: 8,
    description:
        "dish made by lining a shallow container with pastry and filling the container with a sweet or savoury mixture. A top crust may be added; the pie is baked until the crust is crisp and the filling is cooked through",
    image: "assets/images/piesandtarts/pie.jpg",
  ),
  Product(
    // bakery: Etoile,
    bakeryName: 'Etoile',
    type: 'tarts',
    title: "Tart",
    price: 9,
    description:
        "a baked dish consisting of a filling over a pastry base with an open top not covered with pastry. The pastry is usually shortcrust pastry; the filling may be sweet or savoury, though modern tarts are usually fruit-based, sometimes with custard.",
    image: "assets/images/piesandtarts/tart.jpg",
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
