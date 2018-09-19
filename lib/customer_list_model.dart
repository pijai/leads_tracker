// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:leads_tracker/customer_models.dart';
// import 'repos/repository/src/repository.dart';
import 'package:leads_tracker/repos/repository/src/repository.dart';

class CustomerListModel extends Model {
  final CustomersRepository repository;

  // VisibilityFilter _activeFilter;

  // VisibilityFilter get activeFilter => _activeFilter;

  // set activeFilter(VisibilityFilter filter) {
  //   _activeFilter = filter;
  //   notifyListeners();
  // }

  List<Customer> get customers => _customers.toList();

  List<Customer> _customers = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  CustomerListModel({@required this.repository});

  /// Wraps [ScopedModel.of] for this [Model]. See [ScopedModel.of] for more
  static CustomerListModel of(BuildContext context) =>
      ScopedModel.of<CustomerListModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    // update data for every subscriber, especially for the first one
    loadCustomers();
  }

  /// Loads remote data
  ///
  /// Call this initially and when the user manually refreshes
  Future loadCustomers() {
    _isLoading = true;
    notifyListeners();

    return repository.loadCustomers().then((loadedCustomers) {
      _customers = loadedCustomers.map(Customer.fromEntity).toList();
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      _customers = [];
      notifyListeners();
    });
  }

  List<Customer> get filteredCustomers => _customers.where((customer) {
        // if (activeFilter == VisibilityFilter.all) {
          return true;
        // } else if (activeFilter == VisibilityFilter.active) {
        //   return !customer.complete;
        // } else if (activeFilter == VisibilityFilter.completed) {
        //   return customer.complete;
        // }
      }).toList();

  // void clearCompleted() {
  //   _customers.removeWhere((customer) => customer.complete);
  //   notifyListeners();
  // }

  // void toggleAll() {
    // var allComplete = customers.every((customer) => customer.complete);
    // _customers = _customers.map((customer) => customer.copy(complete: !allComplete)).toList();
    // notifyListeners();
  //   _uploadItems();
  // }

  /// updates a [Customer] by replacing the item with the same id by the parameter [customer]
  void updateCustomer(Customer customer) {
    assert(customer != null);
    assert(customer.id != null);
    var oldCustomer = _customers.firstWhere((it) => it.id == customer.id);
    var replaceIndex = _customers.indexOf(oldCustomer);
    _customers.replaceRange(replaceIndex, replaceIndex + 1, [customer]);
    notifyListeners();
    _uploadItems();
  }

  void removeCustomer(Customer customer) {
    _customers.removeWhere((it) => it.id == customer.id);
    notifyListeners();
    _uploadItems();
  }

  void addCustomer(Customer customer) {
    _customers.add(customer);
    notifyListeners();
    _uploadItems();
  }

  void _uploadItems() {
    repository.saveCustomers(_customers.map((it) => it.toEntity()).toList());
  }

  Customer customerById(String id) {
    return _customers.firstWhere((it) => it.id == id, orElse: () => null);
  }
}

// enum VisibilityFilter { all, active, completed }
