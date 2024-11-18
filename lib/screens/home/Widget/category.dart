import 'package:flutter/material.dart';
import 'package:food_app/models/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(categoriesList[index].image),
                      fit: BoxFit.fill),
                ),
              ),
              Text(
                categoriesList[index].title,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: categoriesList.length,
      ),
    );
  }
}
