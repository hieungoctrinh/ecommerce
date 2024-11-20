import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class AddToCard extends StatelessWidget {
  final Product product;

  const AddToCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return FloatingActionButton(
      backgroundColor: kprimaryColor,
      child: const Icon(Icons.add_shopping_cart),
      onPressed: () {
        provider.toggleAddToCart(product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${product.title} added to cart"),
            duration: const Duration(seconds: 1),
          ),
        );
      },
    );
  }
}
