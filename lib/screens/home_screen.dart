import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_architecture/data/models/product.dart';
import 'package:riverpod_clean_architecture/data/repositories/product_repository.dart';
import 'package:riverpod_clean_architecture/screens/widget/product_custom_scroll_view_widget.dart';

import '../providers/shared_pref_provider.dart';

final productRepository = Provider<ProductRepository>((ref) {
  return ProductRepository(ref);
});

final sharedPrefProvider = Provider<SharedPref>((ref) {
  throw UnimplementedError();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productRepository);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
      ),
      body: FutureBuilder<List<Product>>(
        future: product.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            print("products = $products");
            //print("user = ${ref.watch(sharePreferencesUtils).getUserData()}");
            print("token = ${ref.watch(sharePreferencesUtils).getSavedLoginToken()}");
            print("isLoggedInUser = ${ref.watch(sharePreferencesUtils).isLoggedInUser()}");
            return ProductCustomScrollViewWidget(products: products);
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
