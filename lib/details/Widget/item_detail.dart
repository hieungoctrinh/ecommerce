import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/models/product_model.dart';

class ItemDetail extends StatelessWidget {
  final Product product;
  const ItemDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        Row(
          children: [
            Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 60,
              height: 23,
              decoration: BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 15,
                  ),
                  Text(
                    '\$${product.rate}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              product.review,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
