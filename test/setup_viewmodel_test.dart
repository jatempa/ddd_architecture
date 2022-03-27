import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_demo/common/locator.dart';
import 'package:stacked_demo/market/application/market_service.dart';

import 'package:stacked_demo/home_viewmodel.dart';

import 'test_helpers.dart';

void main() {

  group('HomeViewModelTest -', () {
    group('initialise -', () {
      test('When called should check hasUser on sharedPreferencesService',
      () async {
        //var productService = ProductServiceMock().getAndRegisterProductServiceMock();
        var model = HomeViewModel();
        await model.initialise();
        verify(model.products.length == 0);
      });
    });
  });
}