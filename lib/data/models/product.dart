import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product{
  final int id;
  final String title;
  final List<String> images;
  final String description;

  Product({required this.id, required this.title, required this.images, required this.description});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson()=> _$ProductToJson(this);
}