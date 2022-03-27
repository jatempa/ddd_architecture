import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// Important. Import the locator.iconfig.dart file
import 'package:stacked_demo/common/locator.config.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);