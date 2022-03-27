import 'package:injectable/injectable.dart';
import 'package:sp_util/sp_util.dart';

import 'package:stacked_demo/market/domain/entities/Product.dart';
import 'package:stacked_demo/market/infraestructure/models/ProductModel.dart';

@lazySingleton
class ProductLocalDataProvider {


  Future<void> cacheProducts(List<Product> products) async {
    try {
      await SpUtil.getInstance();
      SpUtil.putObjectList("products", products);
    } catch (error) {
      print(error);
    }

    return null;
  }

  Future<List<Product>> fetchProducts() async {
    try {
      print("Obteniendo productos desde cache");
      await SpUtil.getInstance();
      var _products = SpUtil.getObjList("products", (product) => ProductModel.fromJson(product));

      return _products.map((product) => Product(
        category: product.category,
        description: product.description,
        id: product.id,
        image: null,
        name: product.name,
        price: product.price
      )).toList();
    } catch (error) {
      print(error);
    }

    return null;
  }
}
