import 'package:flutter/material.dart';
import 'package:food_app/provider/app_provider.dart';
import 'package:food_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import 'package:food_app/screens/nav_bar_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/screens/favorite.dart';
import 'package:food_app/screens/cart/cart_screen.dart';
import 'package:food_app/details/detail_screen.dart';
import 'package:food_app/models/product_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    final GoRouter router = GoRouter(
      initialLocation: '/home',
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            // Đồng bộ currentIndex với AppState khi điều hướng
            final currentIndex = _getCurrentIndex(state.location);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              appState.updateIndex(currentIndex);
            });

            return Scaffold(
              body: child,
              bottomNavigationBar: BottomNavBar(
                currentIndex: appState.currentIndex,
                onTap: (index) {
                  appState.updateIndex(index);
                  _onNavBarTap(index, context);
                },
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
                final product = state.extra as Product;
                return DetailScreen(product: product);
              },
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }

  static int _getCurrentIndex(String location) {
    switch (location) {
      case '/favorite':
        return 1;
      case '/cart':
        return 2;
      case '/profile':
        return 3; // Nếu có thêm route /profile
      default:
        return 0; // Home là mặc định
    }
  }

  static void _onNavBarTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/favorite');
        break;
      case 2:
        context.go('/cart');
        break;
      case 3:
        context.go('/profile'); // Nếu bạn có route cho /profile
        break;
    }
  }
}
