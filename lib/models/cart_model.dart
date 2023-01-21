import 'package:bakery_shop_application/models/product_model.dart';
import 'package:flutter/material.dart';

class CartModel {
  Product product;
  int counter;
  CartModel({
    required this.product,
    required this.counter,
  });
}

Iterable<CartModel> temp =
    CartModel(product: products[0], counter: 1) as Iterable<CartModel>;
