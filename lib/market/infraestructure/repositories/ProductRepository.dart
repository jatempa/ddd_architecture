import 'package:auto_route/auto_route.dart';
import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

import 'package:stacked_demo/market/application/connectivity_service.dart';
import 'package:stacked_demo/market/domain/entities/Product.dart';
import 'package:stacked_demo/market/domain/interfaces/IProductRepository.dart';
import 'package:stacked_demo/market/infraestructure/data_sources/ProductLocalDataProvider.dart';
import 'package:stacked_demo/market/infraestructure/data_sources/ProductRemoteDataProvider.dart';

@LazySingleton(as: IProductRepository )
class ProductRepository implements IProductRepository {

  const ProductRepository({
    @required this.connectivityService,
    @required this.localDataProvider,
    @required this.remoteDataProvider
  });

  final ConnectivityService connectivityService;
  final ProductLocalDataProvider localDataProvider;
  final ProductRemoteDataProvider remoteDataProvider;

  @override
  Future<Product> create(Product t) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> fetchAll() async {
    try {
      var connectivityResult = await (connectivityService.connectivity.checkConnectivity());

      if (connectivityResult == ConnectivityResult.none)
        return localDataProvider.fetchProducts();

      final _products = await remoteDataProvider.fetchProducts();

      if (_products != null && _products.isNotEmpty)
        localDataProvider.cacheProducts(_products);
      return _products;
    } catch (e) {
      print(e);
    }

    return null;
  }

  @override
  Future<Product> fetchById(int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<Product> update(Product t) {
    // TODO: implement update
    throw UnimplementedError();
  }
}