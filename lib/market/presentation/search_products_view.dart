import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_demo/market/domain/entities/Product.dart';
import 'package:stacked_demo/market/presentation/product_item_alert_dialog.dart';
import 'package:stacked_demo/market/presentation/products_data_search.dart';
import 'package:stacked_demo/home_viewmodel.dart';

class SearchProductsView extends ViewModelWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () async {
        final product = await showSearch<Product>(
          context: context,
          delegate: ProductsDataSearch(products: model.products)
        );

        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => ProductItemAlertDialog(
            product: product
          )
        );
      }
    );
  }
}