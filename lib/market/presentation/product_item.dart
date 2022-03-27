import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_demo/market/domain/entities/Product.dart';
import 'package:stacked_demo/market/presentation/product_item_alert_dialog.dart';
import 'package:stacked_demo/home_viewmodel.dart';

class ProductItemView extends ViewModelWidget<HomeViewModel> {
  final Product product;

  const ProductItemView({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return ListTile(
      onTap: () async => await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => ProductItemAlertDialog(product: product)
      ),
      leading: (product.image != null)
      ? ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 100,
          maxWidth: 100
        ),
        child: Container(
            height: 50,
            width: 50,
            child: Image.network(
              product.image,
              fit: BoxFit.contain
            )
          )
        )
      : null,
      title: Text(product.name),
      subtitle: Text("${product.category}", style: TextStyle(fontSize: 12)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("Price", style: TextStyle(fontSize: 12)),
          Text("\$${product.price}", style: TextStyle(fontSize: 12)),
        ]
      )
    );
  }
}