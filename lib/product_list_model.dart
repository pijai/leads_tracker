// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:leads_tracker/product_models.dart';
// import 'repos/repository/src/repository.dart';
import 'package:leads_tracker/repos/repository/src/repository.dart';

class ProductListModel extends Model {
  final ProductsRepository repository;

  // VisibilityFilter _activeFilter;

  // VisibilityFilter get activeFilter => _activeFilter;

  // set activeFilter(VisibilityFilter filter) {
  //   _activeFilter = filter;
  //   notifyListeners();
  // }

  List<Product> get products => _products.toList();

  List<Product> _products = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ProductListModel({@required this.repository});
      // : this._activeFilter = activeFilter ?? VisibilityFilter.all;

  /// Wraps [ScopedModel.of] for this [Model]. See [ScopedModel.of] for more
  static ProductListModel of(BuildContext context) =>
      ScopedModel.of<ProductListModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    // update data for every subscriber, especially for the first one
    loadProducts();
  }

  /// Loads remote data
  ///
  /// Call this initially and when the user manually refreshes
  Future loadProducts() {
    _isLoading = true;
    notifyListeners();

    return repository.loadProducts().then((loadedProducts) {
      _products = loadedProducts.map(Product.fromEntity).toList();
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      _products = [];
      notifyListeners();
    });
  }

  List<Product> get filteredProducts => _products.where((product) {
        // if (activeFilter == VisibilityFilter.all) {
          return true;
        // } else if (activeFilter == VisibilityFilter.active) {
        //   return !product.complete;
        // } else if (activeFilter == VisibilityFilter.completed) {
        //   return product.complete;
        // }
      }).toList();

  // void clearCompleted() {
  //   _products.removeWhere((product) => product.complete);
  //   notifyListeners();
  // }

  // void toggleAll() {
  //   var allComplete = products.every((product) => product.complete);
  //   _products = _products.map((product) => product.copy(complete: !allComplete)).toList();
  //   notifyListeners();
  //   _uploadItems();
  // }

  /// updates a [Product] by replacing the item with the same id by the parameter [product]
  void updateProduct(Product product) {
    assert(product != null);
    assert(product.id != null);
    var oldProduct = _products.firstWhere((it) => it.id == product.id);
    var replaceIndex = _products.indexOf(oldProduct);
    _products.replaceRange(replaceIndex, replaceIndex + 1, [product]);
    notifyListeners();
    _uploadItems();
  }

  void removeProduct(Product product) {
    _products.removeWhere((it) => it.id == product.id);
    notifyListeners();
    _uploadItems();
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
    _uploadItems();
  }

  void _uploadItems() {
    repository.saveProducts(_products.map((it) => it.toEntity()).toList());
  }

  Product productById(String id) {
    return _products.firstWhere((it) => it.id == id, orElse: () => null);
  }
}

// enum VisibilityFilter { all, active, completed }
