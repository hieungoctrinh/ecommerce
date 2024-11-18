import 'package:flutter/material.dart';
import 'package:food_app/provider/app_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:food_app/constant.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key,
      required int currentIndex,
      required void Function(dynamic index) onTap});

  @override
  Widget build(BuildContext context) {
    // Lấy trạng thái hiện tại từ AppState
    final appState = Provider.of<AppState>(context);

    return BottomAppBar(
      elevation: 1,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              appState.updateIndex(0); // Cập nhật trạng thái
              context.go('/home'); // Chuyển đến trang Home
            },
            icon: Icon(
              Icons.home_filled,
              size: 30,
              color: appState.currentIndex == 0
                  ? kprimaryColor
                  : Colors.grey.shade400,
            ),
          ),
          IconButton(
            onPressed: () {
              appState.updateIndex(1);
              context.go('/favorite');
            },
            icon: Icon(
              Icons.favorite_border,
              size: 30,
              color: appState.currentIndex == 1
                  ? kprimaryColor
                  : Colors.grey.shade400,
            ),
          ),
          IconButton(
            onPressed: () {
              appState.updateIndex(2);
              context.go('/cart');
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: appState.currentIndex == 2
                  ? kprimaryColor
                  : Colors.grey.shade400,
            ),
          ),
          IconButton(
            onPressed: () {
              appState.updateIndex(3);
              context.go('/profile');
            },
            icon: Icon(
              Icons.person,
              size: 30,
              color: appState.currentIndex == 3
                  ? kprimaryColor
                  : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
