// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_sample/account_models.dart';
// import 'repos/repository/src/repository.dart';
import 'package:scoped_model_sample/repos/repository/src/repository.dart';

class AccountListModel extends Model {
  final AccountsRepository repository;

  // VisibilityFilter _activeFilter;

  // VisibilityFilter get activeFilter => _activeFilter;

  // set activeFilter(VisibilityFilter filter) {
  //   _activeFilter = filter;
  //   notifyListeners();
  // }

  List<Account> get accounts => _accounts.toList();

  List<Account> _accounts = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  AccountListModel({@required this.repository});
      // : this._activeFilter = activeFilter ?? VisibilityFilter.all;

  /// Wraps [ScopedModel.of] for this [Model]. See [ScopedModel.of] for more
  static AccountListModel of(BuildContext context) =>
      ScopedModel.of<AccountListModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    // update data for every subscriber, especially for the first one
    loadAccounts();
  }

  /// Loads remote data
  ///
  /// Call this initially and when the user manually refreshes
  Future loadAccounts() {
    _isLoading = true;
    notifyListeners();

    return repository.loadAccounts().then((loadedAccounts) {
      _accounts = loadedAccounts.map(Account.fromEntity).toList();
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      _accounts = [];
      notifyListeners();
    });
  }

  List<Account> get filteredAccounts => _accounts.where((account) {
        // if (activeFilter == VisibilityFilter.all) {
          return true;
        // } else if (activeFilter == VisibilityFilter.active) {
        //   return !account.complete;
        // } else if (activeFilter == VisibilityFilter.completed) {
        //   return account.complete;
        // }
      }).toList();

  List<Account> get debitAccounts => _accounts.where((account) {
        if (account.transType == 'debit') {
          return true;
        }
      }).toList();

  // void clearCompleted() {
  //   _accounts.removeWhere((account) => account.complete);
  //   notifyListeners();
  // }

  // void toggleAll() {
  //   var allComplete = accounts.every((account) => account.complete);
  //   _accounts = _accounts.map((account) => account.copy(complete: !allComplete)).toList();
  //   notifyListeners();
  //   _uploadItems();
  // }

  /// updates a [Account] by replacing the item with the same id by the parameter [account]
  void updateAccount(Account account) {
    assert(account != null);
    assert(account.id != null);
    var oldAccount = _accounts.firstWhere((it) => it.id == account.id);
    var replaceIndex = _accounts.indexOf(oldAccount);
    _accounts.replaceRange(replaceIndex, replaceIndex + 1, [account]);
    notifyListeners();
    _uploadItems();
  }

  void removeAccount(Account account) {
    _accounts.removeWhere((it) => it.id == account.id);
    notifyListeners();
    _uploadItems();
  }

  void addAccount(Account account) {
    _accounts.add(account);
    notifyListeners();
    _uploadItems();
  }

  void _uploadItems() {
    repository.saveAccounts(_accounts.map((it) => it.toEntity()).toList());
  }

  Account accountById(String id) {
    return _accounts.firstWhere((it) => it.id == id, orElse: () => null);
  }

}

// enum VisibilityFilter { all, active, completed }
