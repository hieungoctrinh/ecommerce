import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class AddToCard extends StatelessWidget {
  final Product product;
  final int index;

  const AddToCard({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          provider.decrement(index); // Giảm số lượng sản phẩm
                        },
                        iconSize: 15,
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        product.quantity.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          provider.increment(index); // Tăng số lượng sản phẩm
                          print(index);
                        },
                        iconSize: 15,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    provider
                        .toggleFavorite(product); // Thêm sản phẩm vào giỏ hàng
                    const snackBar = SnackBar(
                      content: Text("Add to cart success!"),
                      duration: Duration(seconds: 1),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: const Text(
                      "Add to cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
