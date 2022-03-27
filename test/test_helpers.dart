
import 'package:mockito/mockito.dart';
import 'package:stacked_demo/common/locator.dart';

import 'package:stacked_demo/market/application/market_service.dart';

class MarketServiceMock extends Mock implements MarketService {

  MarketService getAndRegisterMarketServiceMock() {
    var service = MarketServiceMock();

    //when(service.Markets).thenReturn([]);

    locator.registerSingleton<MarketService>(service);
    return service;
  }
}