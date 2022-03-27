import 'package:injectable/injectable.dart';

import 'package:stacked_demo/market/domain/entities/Product.dart';
import 'package:stacked_demo/market/domain/interfaces/IProductRepository.dart';

@lazySingleton
class MarketService {
  const MarketService({
    this.productRepository,
  });

  final IProductRepository productRepository;

  Future<List<Product>> getProducts() async {
    try {
      return await productRepository.fetchAll();
    } catch (e) {
      print(e);
    }

    return null;
  }
}
