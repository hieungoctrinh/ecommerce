import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class DetailAppBar extends StatefulWidget {
  const DetailAppBar({super.key});

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
