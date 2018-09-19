// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/widgets.dart';

class ArchSampleKeys {
  // Home Screens
  static final homeScreen = const Key('__homeScreen__');
  static final addTodoFab = const Key('__addTodoFab__');
  static final addCustomerFab = const Key('__addCustomerFab__');
  static final addProductFab = const Key('__addProductFab__');
  static final addAccountFab = const Key('__addAccountFab__');
  static final snackbar = const Key('__snackbar__');
  static Key snackbarAction(String id) => Key('__snackbar_action_${id}__');

  // Todos
  static final todoList = const Key('__todoList__');
  static final todosLoading = const Key('__todosLoading__');
  static final todoItem = (String id) => Key('TodoItem__${id}');
  static final todoItemCheckbox =
      (String id) => Key('TodoItem__${id}__Checkbox');
  static final todoItemTask = (String id) => Key('TodoItem__${id}__Task');
  static final todoItemNote = (String id) => Key('TodoItem__${id}__Note');
  // customers
  static final customerList = const Key('__customerList__');
  static final customersLoading = const Key('__customersLoading__');
  static final customerItem = (String id) => Key('CustomerItem__${id}');
  // static final customerItemCheckbox =
  //     (String id) => Key('CustomerItem__${id}__Checkbox');
  static final customerItemName = (String id) => Key('CustomerItem__${id}__Name');
  static final customerItemInfo = (String id) => Key('CustomerItem__${id}__Info');
  // products
  static final productList = const Key('__productList__');
  static final productsLoading = const Key('__productsLoading__');
  static final productItem = (String id) => Key('ProductItem__${id}');
  // static final productItemCheckbox =
  //     (String id) => Key('ProductItem__${id}__Checkbox');
  static final productItemName = (String id) => Key('ProductItem__${id}__Name');
  static final productItemDescription = (String id) => Key('ProductItem__${id}__Description');
  static final productItemPrice = (String id) => Key('ProductItem__${id}__Price');
  static final productItemQuantity = (String id) => Key('ProductItem__${id}__Quantity');
  // accounts
  static final accountList = const Key('__accountList__');
  static final accountsLoading = const Key('__accountsLoading__');
  static final accountItem = (String id) => Key('AccountItem__${id}');
  // static final accountItemCheckbox =
  //     (String id) => Key('AccountItem__${id}__Checkbox');
  static final accountItemName = (String id) => Key('AccountItem__${id}__Name');
  static final accountItemDescription = (String id) => Key('AccountItem__${id}__Description');
  static final accountItemPrice = (String id) => Key('AccountItem__${id}__Price');
  static final accountItemQuantity = (String id) => Key('AccountItem__${id}__Quantity');

  // Tabs
  static final tabs = const Key('__tabs__');
  static final todoTab = const Key('__todoTab__');
  static final statsTab = const Key('__statsTab__');
  static final customersTab = const Key('__customersTab__');
  static final productsTab = const Key('__productsTab__');
  static final accountsTab = const Key('__accountsTab__');

  // Extra Actions
  static final extraActionsButton = const Key('__extraActionsButton__');
  static final toggleAll = const Key('__markAllDone__');
  static final clearCompleted = const Key('__clearCompleted__');

  // Filters
  static final filterButton = const Key('__filterButton__');
  static final allFilter = const Key('__allFilter__');
  static final activeFilter = const Key('__activeFilter__');
  static final completedFilter = const Key('__completedFilter__');

  // Stats
  static final statsCounter = const Key('__statsCounter__');
  static final statsLoading = const Key('__statsLoading__');
  static final statsNumActive = const Key('__statsActiveItems__');
  static final statsNumCompleted = const Key('__statsCompletedItems__');

  // Details Screen
  static final editTodoFab = const Key('__editTodoFab__');
  static final deleteTodoButton = const Key('__deleteTodoFab__');
  static final todoDetailsScreen = const Key('__todoDetailsScreen__');
  static final detailsTodoItemCheckbox = Key('DetailsTodo__Checkbox');
  static final detailsTodoItemTask = Key('DetailsTodo__Task');
  static final detailsTodoItemNote = Key('DetailsTodo__Note');

  // Add Screen
  static final addTodoScreen = const Key('__addTodoScreen__');
  static final saveNewTodo = const Key('__saveNewTodo__');
  static final addCustomerScreen = const Key('__addCustomerScreen__');
  static final saveNewCustomer = const Key('__saveNewCustomer__');
  static final addProductScreen = const Key('__addProductScreen__');
  static final saveNewProduct = const Key('__saveNewProduct__');
  static final addAccountScreen = const Key('__addAccountScreen__');
  static final saveNewAccount = const Key('__saveNewAccount__');

  // Edit Screen
  static final editTodoScreen = const Key('__editTodoScreen__');
  static final saveTodoFab = const Key('__saveTodoFab__');
  static final editCustomerScreen = const Key('__editCustomerScreen__');
  static final saveCustomerFab = const Key('__saveCustomerFab__');
  static final editProductScreen = const Key('__editProductScreen__');
  static final saveProductFab = const Key('__saveProductFab__');
  static final editAccountScreen = const Key('__editAccountScreen__');
  static final saveAccountFab = const Key('__saveAccountFab__');
}
