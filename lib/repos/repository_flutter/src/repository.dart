// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';
// import '../../repository/repository.dart';
import 'package:scoped_model_sample/repos/repository/repository.dart';
// import '../repository_flutter.dart';
import 'package:scoped_model_sample/repos/repository_flutter/repository_flutter.dart';

/// A class that glues together our local file storage and web client. It has a
/// clear responsibility: Load Todos and Persist todos.
class TodosRepositoryFlutter implements TodosRepository {
  final FileStorage fileStorage;
  final WebClient webClient;

  const TodosRepositoryFlutter({
    @required this.fileStorage,
    this.webClient = const WebClient(),
  });

  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  @override
  Future<List<TodoEntity>> loadTodos() async {
    try {
      return await fileStorage.loadTodos();
    } catch (e) {
      final todos = await webClient.fetchTodos();

      fileStorage.saveTodos(todos);

      return todos;
    }
  }

  // Persists todos to local disk and the web
  @override
  Future saveTodos(List<TodoEntity> todos) {
    return Future.wait<dynamic>([
      fileStorage.saveTodos(todos),
      webClient.postTodos(todos),
    ]);
  }
}


class CustomersRepositoryFlutter implements CustomersRepository {
  final FileStorage fileStorage;
  final WebClient webClient;

  const CustomersRepositoryFlutter({
    @required this.fileStorage,
    this.webClient = const WebClient(),
  });

  /// Loads customers first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Customers from a Web Client.
  @override
  Future<List<CustomerEntity>> loadCustomers() async {
    try {
      return await fileStorage.loadCustomers();
    } catch (e) {
      final customers = await webClient.fetchCustomers();

      fileStorage.saveCustomers(customers);

      return customers;
    }
  }

  // Persists customers to local disk and the web
  @override
  Future saveCustomers(List<CustomerEntity> customers) {
    return Future.wait<dynamic>([
      fileStorage.saveCustomers(customers),
      webClient.postCustomers(customers),
    ]);
  }
}

class ProductsRepositoryFlutter implements ProductsRepository {
  final FileStorage fileStorage;
  final WebClient webClient;

  const ProductsRepositoryFlutter({
    @required this.fileStorage,
    this.webClient = const WebClient(),
  });

  /// Loads products first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Products from a Web Client.
  @override
  Future<List<ProductEntity>> loadProducts() async {
    try {
      return await fileStorage.loadProducts();
    } catch (e) {
      final products = await webClient.fetchProducts();

      fileStorage.saveProducts(products);

      return products;
    }
  }

  // Persists products to local disk and the web
  @override
  Future saveProducts(List<ProductEntity> products) {
    return Future.wait<dynamic>([
      fileStorage.saveProducts(products),
      webClient.postProducts(products),
    ]);
  }
}

class AccountsRepositoryFlutter implements AccountsRepository {
  final FileStorage fileStorage;
  final WebClient webClient;

  const AccountsRepositoryFlutter({
    @required this.fileStorage,
    this.webClient = const WebClient(),
  });

  /// Loads accounts first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Accounts from a Web Client.
  @override
  Future<List<AccountEntity>> loadAccounts() async {
    try {
      return await fileStorage.loadAccounts();
    } catch (e) {
      final accounts = await webClient.fetchAccounts();

      fileStorage.saveAccounts(accounts);

      return accounts;
    }
  }

  // Persists accounts to local disk and the web
  @override
  Future saveAccounts(List<AccountEntity> accounts) {
    return Future.wait<dynamic>([
      fileStorage.saveAccounts(accounts),
      webClient.postAccounts(accounts),
    ]);
  }
}
