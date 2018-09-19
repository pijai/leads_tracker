// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:scoped_model_sample/models.dart';
import 'package:scoped_model_sample/customer_models.dart';
import 'package:scoped_model_sample/product_models.dart';
import 'package:scoped_model_sample/account_models.dart';

typedef TodoAdder(Todo todo);

typedef TodoRemover(Todo todo);

typedef TodoUpdater(
  Todo todo, {
  bool complete,
  String id,
  String note,
  String task,
});

typedef CustomerAdder(Customer customer);

typedef CustomerRemover(Customer customer);

typedef CustomerUpdater(
  Customer customer, {
  String id,
  String name,
  String info,
  String phone,
  String address,
  String problem,
  String problemDescription,
});

typedef ProductAdder(Product product);

typedef ProductRemover(Product product);

typedef ProductUpdater(
  Product product, {
  String id,
  String name,
  String description,
  String price,
  String quantity,
});

typedef AccountAdder(Account account);

typedef AccountRemover(Account account);

typedef AccountUpdater(
  Account account, {
  String id,
  String name,
  String description,
  String price,
  String quantity,
});
