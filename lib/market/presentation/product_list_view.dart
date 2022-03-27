import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_demo/market/presentation/product_item.dart';
import 'package:stacked_demo/home_viewmodel.dart';

class ProductListView extends ViewModelWidget<HomeViewModel> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    if (model.isBusy)
      return Center(child: CircularProgressIndicator());

    if (model.products == null || model.products.length == 0)
      return Center(child: Text("No se encontraron productos"));

    return RefreshIndicator(
      onRefresh: () => model.refresh(),
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ListView.separated(
            controller: _scrollController,
            itemCount: model.products.length,
            itemBuilder: (context, index) => ProductItemView(product: model.products[index]),
            separatorBuilder: (context, index) => Divider(),
          )
        )
      )
    );
  }
}