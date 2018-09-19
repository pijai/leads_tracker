// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
// import 'util/flutter_architecture_samples.dart';
import 'package:scoped_model_sample/util/flutter_architecture_samples.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_sample/screens/add_edit_screen.dart';
import 'package:scoped_model_sample/screens/add_edit_customer_screen.dart';
import 'package:scoped_model_sample/screens/add_edit_product_screen.dart';
import 'package:scoped_model_sample/screens/add_edit_account_screen.dart';
import 'package:scoped_model_sample/screens/home_screen.dart';
import 'package:scoped_model_sample/todo_list_model.dart';
import 'package:scoped_model_sample/customer_list_model.dart';
import 'package:scoped_model_sample/product_list_model.dart';
import 'package:scoped_model_sample/account_list_model.dart';
// import 'repos/repository/src/repository.dart';
import 'package:scoped_model_sample/repos/repository/src/repository.dart';

class ScopedModelApp extends StatelessWidget {
  final TodosRepository repository;
  final CustomersRepository customerRepository;
  final ProductsRepository productRepository;
  final AccountsRepository accountRepository;

  ScopedModelApp({
    @required this.repository,
    @required this.customerRepository,
    @required this.productRepository,
    @required this.accountRepository
  });

  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      title: 'Leads Tracker',
      theme: ThemeData.light(),
      // theme: ArchSampleTheme.theme,
      routes: {
        ArchSampleRoutes.home: (context) => HomeScreen(),
        ArchSampleRoutes.addTodo: (context) => AddEditScreen(),
        ArchSampleRoutes.addCustomer: (context) => AddEditCustomerScreen(),
        ArchSampleRoutes.addProduct: (context) => AddEditProductScreen(),
        ArchSampleRoutes.addAccount: (context) => AddEditAccountScreen()
      },
    );

    return ScopedModel<TodoListModel>(
      model: TodoListModel(
        repository: repository,
      ),
      child: ScopedModel<CustomerListModel>(
        model: CustomerListModel(
          repository: customerRepository
        ),
        child: ScopedModel<ProductListModel>(
          model: ProductListModel(
            repository: productRepository
          ),
          child: ScopedModel<AccountListModel>(
            model: AccountListModel(
              repository: accountRepository
            ),
            child: app,
          ),
        )
      ),
    );
  }
}
