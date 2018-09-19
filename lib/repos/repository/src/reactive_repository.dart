// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:core';

import 'todo_entity.dart';
import 'customer_entity.dart';
import 'product_entity.dart';
import 'account_entity.dart';

/// A data layer class works with reactive data sources, such as Firebase. This
/// class emits a Stream of TodoEntities. The data layer of the app.
///
/// How and where it stores the entities should defined in a concrete
/// implementation, such as firebase_repository_flutter.
///
/// The domain layer should depend on this abstract class, and each app can
/// inject the correct implementation depending on the environment, such as
/// web or Flutter.
abstract class ReactiveTodosRepository {
  Future<void> addNewTodo(TodoEntity todo);

  Future<void> deleteTodo(List<String> idList);

  Stream<List<TodoEntity>> todos();

  Future<void> updateTodo(TodoEntity todo);
}

abstract class ReactiveCustomersRepository {
  Future<void> addNewCustomer(CustomerEntity customer);

  Future<void> deleteCustomer(List<String> idList);

  Stream<List<CustomerEntity>> customers();

  Future<void> updateCustomer(CustomerEntity customer);
}

abstract class ReactiveProductsRepository {
  Future<void> addNewProduct(ProductEntity product);

  Future<void> deleteProduct(List<String> idList);

  Stream<List<ProductEntity>> products();

  Future<void> updateProduct(ProductEntity product);
}

abstract class ReactiveAccountsRepository {
  Future<void> addNewAccount(AccountEntity account);

  Future<void> deleteAccount(List<String> idList);

  Stream<List<AccountEntity>> accounts();

  Future<void> updateAccount(AccountEntity account);
}
