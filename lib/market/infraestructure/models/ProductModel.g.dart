// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    category: json['category'] as String,
    description: json['description'] as String,
    id: json['id'] as int,
    image: json['image'] as String,
    name: json['title'] as String,
    price: (json['price'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'id': instance.id,
      'image': instance.image,
      'title': instance.name,
      'price': instance.price,
    };
