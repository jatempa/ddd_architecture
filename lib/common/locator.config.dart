// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i4;

import '../market/application/connectivity_service.dart' as _i3;
import '../market/application/market_service.dart' as _i9;
import '../market/domain/interfaces/IProductRepository.dart' as _i7;
import '../market/infraestructure/data_sources/ProductLocalDataProvider.dart'
    as _i5;
import '../market/infraestructure/data_sources/ProductRemoteDataProvider.dart'
    as _i6;
import '../market/infraestructure/repositories/ProductRepository.dart' as _i8;
import 'third_party_services_module.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.ConnectivityService>(() => _i3.ConnectivityService());
  gh.factory<_i4.DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.factory<_i4.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<_i5.ProductLocalDataProvider>(
      () => _i5.ProductLocalDataProvider());
  gh.lazySingleton<_i6.ProductRemoteDataProvider>(
      () => _i6.ProductRemoteDataProvider());
  gh.factory<_i4.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  gh.lazySingleton<_i7.IProductRepository>(() => _i8.ProductRepository(
      connectivityService: get<_i3.ConnectivityService>(),
      localDataProvider: get<_i5.ProductLocalDataProvider>(),
      remoteDataProvider: get<_i6.ProductRemoteDataProvider>()));
  gh.lazySingleton<_i9.MarketService>(() =>
      _i9.MarketService(productRepository: get<_i7.IProductRepository>()));
  return get;
}

class _$ThirdPartyServicesModule extends _i10.ThirdPartyServicesModule {
  @override
  _i4.DialogService get dialogService => _i4.DialogService();
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
  @override
  _i4.SnackbarService get snackBarService => _i4.SnackbarService();
}
