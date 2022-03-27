import 'package:flutter/material.dart';

import 'package:stacked_demo/market/domain/entities/Product.dart';

class ProductItemAlertDialog extends StatelessWidget {
  final Product product;

  const ProductItemAlertDialog({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(product.name),
      content: Wrap(
        children: [
          (product.image != null)
          ? Center(
              child: Container(
                height: 250,
                width: 250,
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain
                )
              )
            )
          : SizedBox(),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(product.description),
          )
        ]
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cerrar'),
          onPressed: () {
            Navigator.pop(context);
          }
        )
      ]
    );
  }
}