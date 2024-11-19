import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _carts = [];

  List<Product> get cart => _carts;

  void toggleFavorite(Product product) {
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

  void increment(int index) {
    _carts[index].quantity++;
    notifyListeners();
  }

  void decrement(int index) {
    if (_carts[index].quantity > 1)
      _carts[index].quantity--;
    else
      _carts.removeAt(index);
    notifyListeners();
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
