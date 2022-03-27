import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_demo/home_viewmodel.dart';

class SortProductsView extends ViewModelWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return IconButton(
      icon: Icon(Icons.sort_by_alpha),
      onPressed: () => model.sort()
    );
  }
}