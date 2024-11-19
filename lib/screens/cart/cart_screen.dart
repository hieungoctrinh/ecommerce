import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/provider/cart_provider.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    // productQuantity(IconData icon, int index) {
    //   return GestureDetector(
    //     onTap: () {
    //       icon == Icons.add
    //           ? provider.increment(index)
    //           : provider.decrement(index);
    //     },
    //     child: Icon(icon),
    //   );
    // }

    return Scaffold(
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(10),
                    ),
                    onPressed: () => context.go('/home'),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(width: 90),
                  const Text(
                    "My Cart",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  final cartItems = finalList[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  cartItems.image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItems.title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    cartItems.category,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "\$${cartItems.price}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        right: 35,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                provider.removeFromCart(cartItems);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: kcontentColor,
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      provider.increment(index);
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.red,
                                      size: 25,
                                    ),
                                  ),
                                  Text(
                                    cartItems.quantity.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      provider.decrement(index);
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
