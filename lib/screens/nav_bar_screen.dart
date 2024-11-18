import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_app/constant.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 1,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => context.go('/home'), // Home route
            icon: Icon(
              Icons.home_filled,
              size: 30,
              color: currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
            ),
          ),
          IconButton(
            onPressed: () => context.go('/favorite'),
            icon: Icon(
              Icons.favorite_border,
              size: 30,
              color: currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
            ),
          ),
          IconButton(
            onPressed: () => context.go('/cart'),
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: currentIndex == 2 ? kprimaryColor : Colors.grey.shade400,
            ),
          ),
          IconButton(
            onPressed: () => context.go('/profile'), // Placeholder for Profile
            icon: Icon(
              Icons.person,
              size: 30,
              color: currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
