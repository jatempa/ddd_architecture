import 'package:stacked/stacked.dart';

import 'package:stacked_demo/common/locator.dart';
import 'package:stacked_demo/market/application/market_service.dart';
import 'package:stacked_demo/market/domain/entities/Product.dart';

class HomeViewModel extends BaseViewModel {
  final _title = 'Products';
  final _svc = locator<MarketService>();

  String get title => _title;
  List<Product> _products = [];
  bool _isSorted = false;
  bool _enableDarkTheme = false;

  bool get enableDarkTheme => _enableDarkTheme;
  List<Product> get products => _products;

  Future<void> initialise() async {
    try {
      setBusy(true);
      _products = await _svc.getProducts();
    } catch (e) {
      print(e);
    } finally {
      if (isBusy)
        setBusy(false);
    }
  }

  void sort() {
    if (_products != null && _products.length > 0) {
      _products.sort((a, b) => a.name.compareTo(b.name));
      _isSorted = true;
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    await initialise();

    if (_isSorted)
      sort();
  }

  void toggleTheme(bool value) {
    _enableDarkTheme = value;
    notifyListeners();
  }
}