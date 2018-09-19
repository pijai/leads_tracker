// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:core';

import 'todo_entity.dart';
import 'customer_entity.dart';
import 'product_entity.dart';
import 'account_entity.dart';

/// A class that Loads and Persists todos. The data layer of the app.
///
/// How and where it stores the entities should defined in a concrete
/// implementation, such as todos_repository_flutter or todos_repository_web.
///
/// The domain layer should depend on this abstract class, and each app can
/// inject the correct implementation depending on the environment, such as
/// web or Flutter.
abstract class TodosRepository {
  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  Future<List<TodoEntity>> loadTodos();

  // Persists todos to local disk and the web
  Future saveTodos(List<TodoEntity> todos);
}

abstract class CustomersRepository {
  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  Future<List<CustomerEntity>> loadCustomers();

  // Persists todos to local disk and the web
  Future saveCustomers(List<CustomerEntity> customers);
}

abstract class ProductsRepository {
  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  Future<List<ProductEntity>> loadProducts();

  // Persists todos to local disk and the web
  Future saveProducts(List<ProductEntity> products);
}

abstract class AccountsRepository {
  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  Future<List<AccountEntity>> loadAccounts();

  // Persists todos to local disk and the web
  Future saveAccounts(List<AccountEntity> accounts);
}
