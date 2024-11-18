import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/details/Widget/detail_app_bar.dart';
import 'package:food_app/details/Widget/image_slider.dart';
import 'package:food_app/details/Widget/item_detail.dart';
import 'package:food_app/models/product_model.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DetailAppBar(),
              MyImageSlider(
                image: widget.product.image,
                onChange: (index) {
                  setState(() {
                    currentImage = index;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    width: currentImage == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentImage == index
                          ? Colors.black
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemDetail(product: widget.product),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
