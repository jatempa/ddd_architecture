import 'package:json_annotation/json_annotation.dart';

import 'package:stacked_demo/market/domain/entities/Product.dart';

part 'ProductModel.g.dart';

@JsonSerializable(nullable: false)
class ProductModel extends Product {
  ProductModel({
    this.category,
    this.description,
    this.id,
    this.image,
    this.name,
    this.price
  }) : super(
    category: category,
    description: description,
    id: id,
    image: image,
    name: name,
    price: price
  );

  final String category;
  final String description;
  final int id;
  final String image;
  @JsonKey(name: 'title')
  final String name;
  final double price;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  String toString() => "$name";
}