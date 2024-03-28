
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../models/product.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.escuelajs.co/api/v1/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("products")
  Future<List<Product>> getProducts();

}