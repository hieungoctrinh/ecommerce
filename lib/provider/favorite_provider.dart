import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favoritecarts = [];

  List<Product> get favoritecarts => _favoritecarts;

  void toggleFavorite(Product product) {
    if (_favoritecarts.contains(product)) {
      _favoritecarts.remove(product);
    } else {
      _favoritecarts.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favoritecarts.contains(product);
    return isExist;
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
