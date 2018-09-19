// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

// import '../../repository/repository.dart';
import 'package:scoped_model_sample/repos/repository/repository.dart';

/// A class that is meant to represent a Client that would be used to call a Web
/// Service. It is responsible for fetching and persisting Todos to and from the
/// cloud.
///
/// Since we're trying to keep this example simple, it doesn't communicate with
/// a real server but simply emulates the functionality.
class WebClient {
  final Duration delay;

  const WebClient([this.delay = const Duration(milliseconds: 3000)]);

  /// Mock that "fetches" some Todos from a "web service" after a short delay
  Future<List<TodoEntity>> fetchTodos() async {
    return Future.delayed(
        delay,
        () => [
              TodoEntity(
                'Buy food for da kitty',
                '1',
                'With the chickeny bits!',
                false,
              ),
              TodoEntity(
                'Find a Red Sea dive trip',
                '2',
                'Echo vs MY Dream',
                false,
              ),
              // TodoEntity(
              //   'Book flights to Egypt',
              //   '3',
              //   '',
              //   true,
              // ),
              // TodoEntity(
              //   'Decide on accommodation',
              //   '4',
              //   '',
              //   false,
              // ),
              // TodoEntity(
              //   'Sip Margaritas',
              //   '5',
              //   'on the beach',
              //   true,
              // ),
            ]);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postTodos(List<TodoEntity> todos) async {
    return Future.value(true);
  }

  /// Mock that "fetches" some Customers from a "web service" after a short delay
  Future<List<CustomerEntity>> fetchCustomers() async {
    return Future.delayed(
        delay,
        () => [
              CustomerEntity(
                // 'Customer Buy food for da kitty',
                '1',
                // 'With the chickeny bits!',
                // false,
                'nik',
                'cool',
                'phone',
                'address',
                'problem',
                'problem description'
              ),
              CustomerEntity(
                // 'Customer Find a Red Sea dive trip',
                '2',
                // 'Echo vs MY Dream',
                // false,
                'nik1',
                'cool1',
                'phone',
                'address',
                'problem',
                'problem description'
              ),
              CustomerEntity(
                // 'Customer Book flights to Egypt',
                '3',
                // '',
                // true,
                'nik2',
                'cool2',
                'phone',
                'address',
                'problem',
                'problem description'
              ),
              CustomerEntity(
                // 'Decide on accommodation',
                '4',
                // '',
                // false,
                'nik3',
                'cool3',
                'phone',
                'address',
                'problem',
                'problem description'
              ),
              CustomerEntity(
                // 'Sip Margaritas',
                '5',
                // 'on the beach',
                // true,
                'nik4',
                'cool4',
                'phone',
                'address',
                'problem',
                'problem description'
              ),
            ]);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postCustomers(List<CustomerEntity> customers) async {
    return Future.value(true);
  }

  /// Mock that "fetches" some Customers from a "web service" after a short delay
  Future<List<ProductEntity>> fetchProducts() async {
    return Future.delayed(
        delay,
        () => [
              ProductEntity(
                'Product Buy food for da kitty',
                '1234',
                '10',
                '5',
                1,
                '1',
              ),
              ProductEntity(
                'Product Find a Red Sea dive trip',
                'testing',
                '12',
                '10',
                2,
                '2',
              ),
            ]);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postProducts(List<ProductEntity> products) async {
    return Future.value(true);
  }

  /// Mock that "fetches" some Customers from a "web service" after a short delay
  Future<List<AccountEntity>> fetchAccounts() async {
    return Future.delayed(
        delay,
        () => [
              AccountEntity(
                'Account Buy food for da kitty',
                'Debit',
                '1234',
                '10',
                '5',
                '1'
              ),
              AccountEntity(
                'Account Find a Red Sea dive trip',
                'Credit',
                'testing',
                '12',
                '10',
                '2'
              ),
            ]);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postAccounts(List<AccountEntity> accounts) async {
    return Future.value(true);
  }
}
