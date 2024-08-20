import 'package:flutter/foundation.dart';

class CartProvider extends ValueNotifier<int> {
  CartProvider() : super(0);

  void addToCart() {
    value++;
  }
}
