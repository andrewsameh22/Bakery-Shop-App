import 'package:bakery_shop_application/models/product_model.dart';

class Bakery {
  final String name;
  final String rating;
  double ratingNum;
  final Iterable<Product> listOfProducts;
  final String image;
  Bakery({
    required this.name,
    required this.listOfProducts,
    required this.rating,
    required this.ratingNum,
    required this.image,
  });
}

Bakery Exception = Bakery(
  name: 'Exception',
  listOfProducts: ExceptionProducts,
  rating: 'Excellent',
  ratingNum: 5,
  image: "assets/images/exception.png",
);
Bakery Etoile = Bakery(
  name: 'Etoile',
  listOfProducts: EtoileProducts,
  rating: 'Very Good',
  ratingNum: 4,
  image: "assets/images/etoile.png",
);
Bakery Mongini = Bakery(
  name: 'Mongini',
  listOfProducts: MonginiProducts,
  rating: 'Good',
  ratingNum: 3,
  image: "assets/images/monginis.png",
);
