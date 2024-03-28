import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_architecture/data/models/product.dart';
import 'package:riverpod_clean_architecture/screens/widget/product_view.dart';

class ProductCustomScrollView extends ConsumerStatefulWidget {
  const ProductCustomScrollView({super.key, required this.products});

  final List<Product> products;

  @override
  _ProductCustomScrollView createState() => _ProductCustomScrollView();
}

class _ProductCustomScrollView extends ConsumerState<ProductCustomScrollView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return ProductView(product: widget.products[index]);
            },
            childCount: widget.products.length,
          ),
        ),
      ],
    );
  }

}