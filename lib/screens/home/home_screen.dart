import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/screens/home/Widget/category.dart';
import 'package:food_app/screens/home/Widget/home_appbar.dart';
import 'package:food_app/screens/home/Widget/image_slider.dart';
import 'package:food_app/screens/home/Widget/product_cart.dart';
import 'package:food_app/screens/home/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const CustomAppBar(),
              const SizedBox(height: 10),
              const MySearchBAR(),
              const SizedBox(height: 10),
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(
                    () {
                      currentSlider = value;
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              const Categories(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: all.length,
                itemBuilder: (context, index) {
                  return ProductCart(
                    product: all[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
