import 'package:equatable/equatable.dart';

class Product extends Equatable {
  Product({
    this.category,
    this.description,
    this.id,
    this.image,
    this.name,
    this.price
  });

  final String category;
  final String description;
  final int id;
  final String image;
  final String name;
  final double price;

  @override
  List<Object> get props => [
    category,
    description,
    id,
    image,
    name,
    price
  ];
}