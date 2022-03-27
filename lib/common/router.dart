import 'package:auto_route/auto_route_annotations.dart';

import 'package:stacked_demo/home_view.dart';

@MaterialAutoRouter(
  routes:  <AutoRoute>[
    MaterialRoute(page: HomeView, initial: true),
  ]
)
class $Router {}