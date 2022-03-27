import 'package:injectable/injectable.dart';

import 'package:stacked_demo/common/network_common.dart';
import 'package:stacked_demo/market/domain/entities/Product.dart';
import 'package:stacked_demo/market/infraestructure/models/ProductModel.dart';

@lazySingleton
class ProductRemoteDataProvider {
  final _dio = NetworkCommon().dio;

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get('products');

      if (response.statusCode == 200 && response.data != null)
        return (response.data as List)
          .map((p) => ProductModel.fromJson(p))
          .toList();
    } catch (error) {
      print(error);
    }

    return null;
  }
}
