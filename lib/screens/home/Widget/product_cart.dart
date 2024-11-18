import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/models/product_model.dart';
import 'package:go_router/go_router.dart';

class ProductCart extends StatelessWidget {
  final Product product;
  const ProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/details', extra: product),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kcontentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset(
                product.image,
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                product.title,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '\$${product.price}',
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
                Row(
                  children: List.generate(
                    product.colors.length,
                    (index) => Container(
                      width: 18,
                      height: 18,
                      margin: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: product.colors[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
