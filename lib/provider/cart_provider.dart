import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _carts = [];

  List<Product> get cart => _carts;

  void toggleAddToCart(Product product) {
    if (_carts.contains(product)) {
      for (Product element in _carts) {
        element.quantity++;
      }
    } else {
      _carts.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _carts.remove(product);
    notifyListeners();
  }

  void increment(Product cart) {
    cart.quantity++;
    notifyListeners();
  }

  void decrement(Product cart) {
    cart.quantity--;
    notifyListeners();
  }

  double calculateTotalPrice() {
    return _carts.fold(
      0.0,
      (total, item) => total + (item.price * item.quantity),
    );
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
