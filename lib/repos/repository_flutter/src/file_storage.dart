// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import '../../repository/repository.dart';
import 'package:leads_tracker/repos/repository/repository.dart';

/// Loads and saves a List of Todos using a text file stored on the device.
///
/// Note: This class has no direct dependencies on any Flutter dependencies.
/// Instead, the `getDirectory` method should be injected. This allows for
/// testing.
class FileStorage {
  final String tag;
  final Future<Directory> Function() getDirectory;

  const FileStorage(
    this.tag,
    this.getDirectory,
  );

  Future<List<TodoEntity>> loadTodos() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final todos = (json['todos'])
        .map<TodoEntity>((todo) => TodoEntity.fromJson(todo))
        .toList();

    return todos;
  }

  Future<File> saveTodos(List<TodoEntity> todos) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      'todos': todos.map((todo) => todo.toJson()).toList(),
    }));
  }

  Future<List<CustomerEntity>> loadCustomers() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final customers = (json['customers'])
        .map<CustomerEntity>((customer) => CustomerEntity.fromJson(customer))
        .toList();

    return customers;
  }

  Future<File> saveCustomers(List<CustomerEntity> customers) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      'customers': customers.map((customer) => customer.toJson()).toList(),
    }));
  }

  Future<List<ProductEntity>> loadProducts() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final products = (json['products'])
        .map<ProductEntity>((product) => ProductEntity.fromJson(product))
        .toList();

    return products;
  }

  Future<File> saveProducts(List<ProductEntity> products) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      'products': products.map((product) => product.toJson()).toList(),
    }));
  }

  Future<List<AccountEntity>> loadAccounts() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final accounts = (json['accounts'])
        .map<AccountEntity>((account) => AccountEntity.fromJson(account))
        .toList();

    return accounts;
  }

  Future<File> saveAccounts(List<AccountEntity> accounts) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      'accounts': accounts.map((account) => account.toJson()).toList(),
    }));
  }

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();

    return File('${dir.path}/ArchSampleStorage__$tag.json');
  }

  Future<FileSystemEntity> clean() async {
    final file = await _getLocalFile();

    return file.delete();
  }
}
