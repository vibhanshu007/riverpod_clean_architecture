import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_architecture/data/models/product.dart';
import 'package:riverpod_clean_architecture/screens/widget/product_list_item_widget.dart';

class ProductCustomScrollViewWidget extends ConsumerStatefulWidget {
  const ProductCustomScrollViewWidget({super.key, required this.products});

  final List<Product> products;

  @override
  _ProductCustomScrollViewWidget createState() => _ProductCustomScrollViewWidget();
}

class _ProductCustomScrollViewWidget extends ConsumerState<ProductCustomScrollViewWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
            mainAxisExtent: 300
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return ProductListItemWidget(product: widget.products[index]);
            },
            childCount: widget.products.length,
          ),
        ),
      ],
    );
  }

}