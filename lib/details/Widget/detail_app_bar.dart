import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_app/models/product_model.dart';
import 'package:food_app/provider/favorite_provider.dart';

class DetailAppBar extends StatefulWidget {
  final Product product;
  const DetailAppBar({
    super.key,
    required this.product,
  });

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
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
            onPressed: () {
              provider.toggleFavorite(widget.product);
            },
            icon: Icon(
              provider.isExist(widget.product)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
          ),
        ],
      ),
    );
  }
}
