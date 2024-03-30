import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_architecture/data/models/product.dart';
import 'package:riverpod_clean_architecture/screens/widget/add_button_widget.dart';
import 'package:riverpod_clean_architecture/screens/widget/time_duration_widget.dart';

class ProductListItemWidget extends ConsumerStatefulWidget {
  const ProductListItemWidget({super.key, required this.product});

  final Product product;

  @override
  _ProductView createState() => _ProductView();
}

class _ProductView extends ConsumerState<ProductListItemWidget> {
  onAddButtonClick() {
    print('Button is clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // if you need this
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Image(
              image: AssetImage('assets/images/products.png'),
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 4),
            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TimeDurationWidget(time: 13),
              const SizedBox(height: 4),
              Text(
                textAlign: TextAlign.left,
                widget.product.title,
                maxLines: 2,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                textAlign: TextAlign.left,
                '1 Kg',
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 4),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text(
                      textAlign: TextAlign.left,
                      '\u{20B9} 300',
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      textAlign: TextAlign.left,
                      '\u{20B9} 339',
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                AddButtonWidget(
                  text: 'ADD',
                  onPressed: () => {},
                  borderColor: Colors.green.shade700,
                  backgroundColor: Colors.green.shade50,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
