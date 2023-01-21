import 'package:flutter/material.dart';

import 'cart_model.dart';

class OrderModel {
  List<CartModel> products;
  int ordertotalprice;
  double rating;
  bool collected;
  OrderModel({
    required this.products,
    required this.ordertotalprice,
    this.rating = 1,
    this.collected = false,
  });
}
