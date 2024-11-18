import 'package:flutter/material.dart';
import 'package:food_app/details/detail_screen.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/screens/nav_bar_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:food_app/screens/cart/cart_screen.dart';
import 'package:food_app/screens/favorite.dart';
import 'package:food_app/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GoRouter _router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavBar(
              currentIndex: _getCurrentIndex(state.location),
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/favorite',
            builder: (context, state) => const Favorite(),
          ),
          GoRoute(
            path: '/cart',
            builder: (context, state) => const CartScreen(),
          ),
          GoRoute(
            path: '/details',
            builder: (context, state) {
              // Lấy đối tượng product từ state hoặc từ tham số
              final product = state.extra
                  as Product; // Giả sử bạn đã truyền product thông qua extra
              return DetailScreen(
                  product: product); // Truyền product vào constructor
            },
          ),
        ],
      ),
    ],
  );

  static int _getCurrentIndex(String location) {
    switch (location) {
      case '/favorite':
        return 1;
      case '/cart':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0; // Default to home
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
