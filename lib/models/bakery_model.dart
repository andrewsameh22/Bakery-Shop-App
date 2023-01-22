import 'package:bakery_shop_application/models/product_model.dart';

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
