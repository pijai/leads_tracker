// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
// import '../util/flutter_architecture_samples.dart';
import 'package:leads_tracker/util/flutter_architecture_samples.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:leads_tracker/product_models.dart';
import 'package:leads_tracker/screens/add_edit_product_screen.dart';
import 'package:leads_tracker/product_list_model.dart';
import 'package:leads_tracker/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  ProductList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductListModel>(
      builder: (context, child, model) {
        return Container(
          child: model.isLoading ? _buildLoading : _buildList(model),
        );
      },
    );
  }

  Center get _buildLoading {
    return Center(
      child: CircularProgressIndicator(
        key: ArchSampleKeys.productsLoading,
      ),
    );
  }

  ListView _buildList(ProductListModel model) {
    final products = model.filteredProducts;

    return ListView.builder(
      key: ArchSampleKeys.productList,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];

        return ProductItem(
          product: product,
          onDismissed: (direction) {
            _removeProduct(context, product);
          },
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return AddEditProductScreen(
                    productId: product.id,
                  );
                },
              ),
            ).then((product) {
              if (product is Product) {
                _showUndoSnackbar(context, product);
              }
            });
          },
          // onCheckboxChanged: (complete) {
          //   var toggled = product.copy(complete: !product.complete);
          //   model.updateProduct(toggled);
          // },
        );
      },
    );
  }

  void _removeProduct(BuildContext context, Product product) {
    ProductListModel.of(context).removeProduct(product);

    _showUndoSnackbar(context, product);
  }

  void _showUndoSnackbar(BuildContext context, Product product) {
    Scaffold.of(context).showSnackBar(
          SnackBar(
            key: ArchSampleKeys.snackbar,
            duration: Duration(seconds: 2),
            backgroundColor: Theme.of(context).backgroundColor,
            content: Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            action: SnackBarAction(
              key: ArchSampleKeys.snackbarAction(product.id),
              label: 'undo',
              onPressed: () {
                ProductListModel.of(context).addProduct(product);
              },
            ),
          ),
        );
  }
}
