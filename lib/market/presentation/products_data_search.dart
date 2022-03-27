import 'package:flutter/material.dart';

import 'package:stacked_demo/market/domain/entities/Product.dart';

class ProductsDataSearch extends SearchDelegate<Product> {
  final List<Product> products;

  ProductsDataSearch({this.products});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Product> suggestionList = query.isEmpty ? [] : products.where(
      (s) => s.name.toLowerCase().contains(query)
    ).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        var product = suggestionList[index];
        return ListTile(
          onTap: () => close(context, product),
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
    );
  }
}