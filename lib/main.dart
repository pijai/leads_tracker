// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:leads_tracker/app.dart';
import 'package:leads_tracker/repos/repository_flutter/repository_flutter.dart';

void main() {
  var todoRepo = const TodosRepositoryFlutter(
    fileStorage: const FileStorage(
      'scoped_model_todos',
      getApplicationDocumentsDirectory,
    ),
  );

  var customerRepo = const CustomersRepositoryFlutter(
    fileStorage: const FileStorage(
      'scoped_model_customers',
      getApplicationDocumentsDirectory,
    ),
  );

  var productRepo = const ProductsRepositoryFlutter(
    fileStorage: const FileStorage(
      'scoped_model_products',
      getApplicationDocumentsDirectory,
    ),
  );

  var accountRepo = const AccountsRepositoryFlutter(
    fileStorage: const FileStorage(
      'scoped_model_accounts',
      getApplicationDocumentsDirectory,
    ),
  );

  runApp(ScopedModelApp(
    repository: todoRepo,
    customerRepository: customerRepo,
    productRepository: productRepo,
    accountRepository: accountRepo,
  ));
}
