// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
// import '../../repository/repository.dart';
import 'package:leads_tracker/repos/repository/repository.dart';

/// A class that glues together our local file storage and web client. It has a
/// clear responsibility: Load Todos and Persist todos.
class ReactiveTodosRepositoryFlutter implements ReactiveTodosRepository {
  final TodosRepository _repository;
  final BehaviorSubject<List<TodoEntity>> _subject;
  bool _loaded = false;

  ReactiveTodosRepositoryFlutter({
    @required TodosRepository repository,
    List<TodoEntity> seedValue,
  })  : this._repository = repository,
        this._subject = BehaviorSubject<List<TodoEntity>>(seedValue: seedValue);

  @override
  Future<void> addNewTodo(TodoEntity todo) async {
    _subject.add(List.unmodifiable([]
      ..addAll(_subject.value ?? [])
      ..add(todo)));

    await _repository.saveTodos(_subject.value);
  }

  @override
  Future<void> deleteTodo(List<String> idList) async {
    _subject.add(
      List<TodoEntity>.unmodifiable(_subject.value.fold<List<TodoEntity>>(
        <TodoEntity>[],
        (prev, entity) {
          return idList.contains(entity.id) ? prev : (prev..add(entity));
        },
      )),
    );

    await _repository.saveTodos(_subject.value);
  }

  @override
  Stream<List<TodoEntity>> todos() {
    if (!_loaded) _loadTodos();

    return _subject.stream;
  }

  void _loadTodos() {
    _loaded = true;

    _repository.loadTodos().then((entities) {
      _subject.add(List<TodoEntity>.unmodifiable(
        []..addAll(_subject.value ?? [])..addAll(entities),
      ));
    });
  }

  @override
  Future<void> updateTodo(TodoEntity update) async {
    _subject.add(
      List<TodoEntity>.unmodifiable(_subject.value.fold<List<TodoEntity>>(
        <TodoEntity>[],
        (prev, entity) => prev..add(entity.id == update.id ? update : entity),
      )),
    );

    await _repository.saveTodos(_subject.value);
  }
}


/// A class that glues together our local file storage and web client. It has a
/// clear responsibility: Load Todos and Persist todos.
class ReactiveCustomersRepositoryFlutter implements ReactiveCustomersRepository {
  final CustomersRepository _repository;
  final BehaviorSubject<List<CustomerEntity>> _subjectCustomer;
  bool _loaded = false;

  ReactiveCustomersRepositoryFlutter({
    @required CustomersRepository repository,
    List<CustomerEntity> seedValue,
  })  : this._repository = repository,
        this._subjectCustomer = BehaviorSubject<List<CustomerEntity>>(seedValue: seedValue);

  @override
  Future<void> addNewCustomer(CustomerEntity customer) async {
    _subjectCustomer.add(List.unmodifiable([]
      ..addAll(_subjectCustomer.value ?? [])
      ..add(customer)));

    await _repository.saveCustomers(_subjectCustomer.value);
  }

  @override
  Future<void> deleteCustomer(List<String> idList) async {
    _subjectCustomer.add(
      List<CustomerEntity>.unmodifiable(_subjectCustomer.value.fold<List<CustomerEntity>>(
        <CustomerEntity>[],
        (prev, entity) {
          return idList.contains(entity.id) ? prev : (prev..add(entity));
        },
      )),
    );

    await _repository.saveCustomers(_subjectCustomer.value);
  }

  @override
  Stream<List<CustomerEntity>> customers() {
    if (!_loaded) _loadCustomers();

    return _subjectCustomer.stream;
  }

  void _loadCustomers() {
    _loaded = true;

    _repository.loadCustomers().then((entities) {
      _subjectCustomer.add(List<CustomerEntity>.unmodifiable(
        []..addAll(_subjectCustomer.value ?? [])..addAll(entities),
      ));
    });
  }

  @override
  Future<void> updateCustomer(CustomerEntity update) async {
    _subjectCustomer.add(
      List<CustomerEntity>.unmodifiable(_subjectCustomer.value.fold<List<CustomerEntity>>(
        <CustomerEntity>[],
        (prev, entity) => prev..add(entity.id == update.id ? update : entity),
      )),
    );

    await _repository.saveCustomers(_subjectCustomer.value);
  }
}

/// A class that glues together our local file storage and web client. It has a
/// clear responsibility: Load Todos and Persist todos.
class ReactiveProductsRepositoryFlutter implements ReactiveProductsRepository {
  final ProductsRepository _repository;
  final BehaviorSubject<List<ProductEntity>> _subjectProduct;
  bool _loaded = false;

  ReactiveProductsRepositoryFlutter({
    @required ProductsRepository repository,
    List<ProductEntity> seedValue,
  })  : this._repository = repository,
        this._subjectProduct = BehaviorSubject<List<ProductEntity>>(seedValue: seedValue);

  @override
  Future<void> addNewProduct(ProductEntity product) async {
    _subjectProduct.add(List.unmodifiable([]
      ..addAll(_subjectProduct.value ?? [])
      ..add(product)));

    await _repository.saveProducts(_subjectProduct.value);
  }

  @override
  Future<void> deleteProduct(List<String> idList) async {
    _subjectProduct.add(
      List<ProductEntity>.unmodifiable(_subjectProduct.value.fold<List<ProductEntity>>(
        <ProductEntity>[],
        (prev, entity) {
          return idList.contains(entity.id) ? prev : (prev..add(entity));
        },
      )),
    );

    await _repository.saveProducts(_subjectProduct.value);
  }

  @override
  Stream<List<ProductEntity>> products() {
    if (!_loaded) _loadProducts();

    return _subjectProduct.stream;
  }

  void _loadProducts() {
    _loaded = true;

    _repository.loadProducts().then((entities) {
      _subjectProduct.add(List<ProductEntity>.unmodifiable(
        []..addAll(_subjectProduct.value ?? [])..addAll(entities),
      ));
    });
  }

  @override
  Future<void> updateProduct(ProductEntity update) async {
    _subjectProduct.add(
      List<ProductEntity>.unmodifiable(_subjectProduct.value.fold<List<ProductEntity>>(
        <ProductEntity>[],
        (prev, entity) => prev..add(entity.id == update.id ? update : entity),
      )),
    );

    await _repository.saveProducts(_subjectProduct.value);
  }
}

/// A class that glues together our local file storage and web client. It has a
/// clear responsibility: Load Todos and Persist todos.
class ReactiveAccountsRepositoryFlutter implements ReactiveAccountsRepository {
  final AccountsRepository _repository;
  final BehaviorSubject<List<AccountEntity>> _subjectAccount;
  bool _loaded = false;

  ReactiveAccountsRepositoryFlutter({
    @required AccountsRepository repository,
    List<AccountEntity> seedValue,
  })  : this._repository = repository,
        this._subjectAccount = BehaviorSubject<List<AccountEntity>>(seedValue: seedValue);

  @override
  Future<void> addNewAccount(AccountEntity account) async {
    _subjectAccount.add(List.unmodifiable([]
      ..addAll(_subjectAccount.value ?? [])
      ..add(account)));

    await _repository.saveAccounts(_subjectAccount.value);
  }

  @override
  Future<void> deleteAccount(List<String> idList) async {
    _subjectAccount.add(
      List<AccountEntity>.unmodifiable(_subjectAccount.value.fold<List<AccountEntity>>(
        <AccountEntity>[],
        (prev, entity) {
          return idList.contains(entity.id) ? prev : (prev..add(entity));
        },
      )),
    );

    await _repository.saveAccounts(_subjectAccount.value);
  }

  @override
  Stream<List<AccountEntity>> accounts() {
    if (!_loaded) _loadAccounts();

    return _subjectAccount.stream;
  }

  void _loadAccounts() {
    _loaded = true;

    _repository.loadAccounts().then((entities) {
      _subjectAccount.add(List<AccountEntity>.unmodifiable(
        []..addAll(_subjectAccount.value ?? [])..addAll(entities),
      ));
    });
  }

  @override
  Future<void> updateAccount(AccountEntity update) async {
    _subjectAccount.add(
      List<AccountEntity>.unmodifiable(_subjectAccount.value.fold<List<AccountEntity>>(
        <AccountEntity>[],
        (prev, entity) => prev..add(entity.id == update.id ? update : entity),
      )),
    );

    await _repository.saveAccounts(_subjectAccount.value);
  }
}