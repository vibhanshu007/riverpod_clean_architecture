import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_clean_architecture/data/network/api_service.dart';

import '../models/product.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = Dio();
  return ApiService(dio);
});

class ProductRepository {
  ProductRepository(this.ref);

  final Ref ref;

  Future<List<Product>> getProducts() async {
    final apiService = ref.read(apiServiceProvider);
    try {
      final products = await apiService.getProducts();
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }
}
