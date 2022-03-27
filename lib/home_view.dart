import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_demo/home_viewmodel.dart';
import 'package:stacked_demo/market/presentation/product_list_view.dart';
import 'package:stacked_demo/market/presentation/search_products_view.dart';
import 'package:stacked_demo/market/presentation/sort_products_view.dart';
import 'package:stacked_themes/stacked_themes.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
          actions: <Widget>[
            SearchProductsView(),
            SortProductsView(),
            Icon(FontAwesomeIcons.sun, size: 18),
            Switch(
              value: model.enableDarkTheme,
              onChanged: (value) {
                model.toggleTheme(value);
                getThemeManager(context).toggleDarkLightTheme();
              }
            ),
            Icon(FontAwesomeIcons.moon, size: 18),
          ]
        ),
        body: SafeArea(child: ProductListView()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.refresh(),
          child: Icon(Icons.refresh)
        )
      )
    );
  }
}