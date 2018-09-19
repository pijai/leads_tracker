// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
// import '../util/flutter_architecture_samples.dart';
import 'package:leads_tracker/util/flutter_architecture_samples.dart';
import 'package:leads_tracker/screens/app_tab.dart';
import 'package:leads_tracker/widgets/extra_actions_button.dart';
import 'package:leads_tracker/widgets/filter_button.dart';
import 'package:leads_tracker/widgets/stats_counter.dart';
import 'package:leads_tracker/widgets/todo_list.dart';
import 'package:leads_tracker/widgets/customer_list.dart';
import 'package:leads_tracker/widgets/product_list.dart';
import 'package:leads_tracker/widgets/account_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() : super(key: ArchSampleKeys.homeScreen);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  AppTab _activeTab = AppTab.todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _updateTab(AppTab tab) {
    setState(() {
      _activeTab = tab;
    });
  }

  Widget _buildAppBar() {
    if (_activeTab == AppTab.todos) {
      return AppBar(
        title: Text('Leads Tracker'),
        actions: [
          FilterButton(isActive: _activeTab == AppTab.todos),
          ExtraActionsButton()
        ],
      );
    }
    else {
      return AppBar(
        title: Text('Leads Tracker'),
      );
    }
  }

  Widget _buildBody() {
    if (_activeTab == AppTab.todos) { return TodoList(); } 
    else if (_activeTab == AppTab.stats) { return StatsCounter(); }
    else if (_activeTab == AppTab.customers) { return CustomerList(); }
    else if (_activeTab == AppTab.products) { return ProductList(); }
    else if (_activeTab == AppTab.accounts) { return AccountList(); }
    else return null;
  }

  Widget _buildFloatingActionButton() {
    if (_activeTab == AppTab.todos) {
      return FloatingActionButton(
        key: ArchSampleKeys.addTodoFab,
        onPressed: () {
          Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
        },
        child: Icon(Icons.add),
        tooltip: 'addTodo',
      );
    } else if (_activeTab == AppTab.customers) {
      return FloatingActionButton(
        key: ArchSampleKeys.addCustomerFab,
        onPressed: () {
          Navigator.pushNamed(context, ArchSampleRoutes.addCustomer);
        },
        child: Icon(Icons.add),
        tooltip: 'addCustomer',
      );
    } else if (_activeTab == AppTab.products) {
      return FloatingActionButton(
        key: ArchSampleKeys.addProductFab,
        onPressed: () {
          Navigator.pushNamed(context, ArchSampleRoutes.addProduct);
        },
        child: Icon(Icons.add),
        tooltip: 'addProduct',
      );
    } else if (_activeTab == AppTab.accounts) {
      return FloatingActionButton(
        key: ArchSampleKeys.addAccountFab,
        onPressed: () {
          Navigator.pushNamed(context, ArchSampleRoutes.addAccount);
        },
        child: Icon(Icons.add),
        tooltip: 'add account',
      );
    } else return null;
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
        key: ArchSampleKeys.tabs,
        type: BottomNavigationBarType.fixed,
        currentIndex: AppTab.values.indexOf(_activeTab),
        onTap: (index) {
          _updateTab(AppTab.values[index]);
        },
        items: AppTab.values.map((tab) {
          return BottomNavigationBarItem(
            icon: _buildIcon(tab),
            title: _buildTitle(tab),
          );
        }).toList(),
      );
  }

  Widget _buildIcon(tab) {
    if(tab == AppTab.todos) {
      return Icon(
        Icons.list,
        key: ArchSampleKeys.todoTab,
      );
    } else  if(tab == AppTab.stats) {
      return Icon(
        Icons.show_chart,
        key: ArchSampleKeys.statsTab,
      );
    } else  if(tab == AppTab.customers) {
      return Icon(
        Icons.list,
        key: ArchSampleKeys.customersTab,
      );
    } else  if(tab == AppTab.products) {
      return Icon(
        Icons.list,
        key: ArchSampleKeys.productsTab,
      );
    } else  if(tab == AppTab.accounts) {
      return Icon(
        Icons.list,
        key: ArchSampleKeys.accountsTab,
      );
    } else return null;
  }

  Widget _buildTitle(tab) {
    if (tab == AppTab.todos) { return Text('Todos'); } 
    else if (tab == AppTab.stats) { return Text('Stats'); } 
    else if (tab == AppTab.customers) { return Text('Customers'); }
    else if (tab == AppTab.products) { return Text('Products'); }
    else if (tab == AppTab.accounts) { return Text('Accounts'); }
    else return null;
  }
}
