import 'package:flutter/material.dart';

import '../../../constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {},
          icon: Image.asset(
            'images/icon.png',
            height: 10,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {},
          iconSize: 20,
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
}
