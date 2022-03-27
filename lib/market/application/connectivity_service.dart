import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ConnectivityService {
  static final ConnectivityService _singleton = new ConnectivityService._internal();

  factory ConnectivityService() {
    return _singleton;
  }

  ConnectivityService._internal();

  Connectivity get connectivity {
    Connectivity connectivity = new Connectivity();
    return connectivity;
  }
}