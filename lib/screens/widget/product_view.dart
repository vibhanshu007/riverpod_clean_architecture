import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_architecture/data/models/product.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key, required this.product});

  final Product product;

  @override
  _ProductView createState() => _ProductView();
}

class _ProductView extends ConsumerState<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Image(
            image: NetworkImage(widget.product.images[0]),
            width: 10,
            height: 10,
          ),
          Text(
            widget.product.title,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
