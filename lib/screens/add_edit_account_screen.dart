// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
// import '../util/flutter_architecture_samples.dart';
import 'package:scoped_model_sample/util/flutter_architecture_samples.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_sample/account_models.dart';
import 'package:scoped_model_sample/account_list_model.dart';

class AddEditAccountScreen extends StatelessWidget {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> nameKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> transTypeKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> descriptionKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> priceKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> quantityKey =
      GlobalKey<FormFieldState<String>>();

  final String accountId;

  AddEditAccountScreen({
    Key key,
    this.accountId,
  }) : super(key: key ?? ArchSampleKeys.addAccountScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing
            ? 'editAccount'
            : 'addAccount'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidate: false,
          onWillPop: () {
            return Future(() => true);
          },
          child: ScopedModelDescendant<AccountListModel>(
            builder: (BuildContext context, Widget child, AccountListModel model) {
              var account = model.accountById(accountId);
              return ListView(
                children: [
                  TextFormField(
                initialValue: account != null ? account.name : '',
                key: nameKey,
                decoration: InputDecoration(
                  icon: const Icon(Icons.person),
                  labelText: 'Name',
                  border: InputBorder.none,
                  filled: false,
                  // hintText: 'Account Name',
                ),
                autofocus: isEditing ? false : true,
                validator: (val) => val.trim().isEmpty
                    ? 'Error client empty'
                    : null,
              ),
              Divider(height: 5.0, color: Colors.grey),
              TextFormField(
                initialValue: account != null ? account.transType : '',
                key: transTypeKey,
                decoration: InputDecoration(
                  icon: const Icon(Icons.person),
                  labelText: 'Transasction Type',
                  hintText: 'debit / credit',
                  border: InputBorder.none,
                  filled: false,
                  // hintText: 'Transaction Type',
                ),
              ),
              Divider(height: 5.0, color: Colors.grey),
              TextFormField(
                initialValue: account != null ? account.description : '',
                key: descriptionKey,
                decoration: InputDecoration(
                  icon: const Icon(Icons.phone),
                  labelText: 'Description',
                  border: InputBorder.none,
                  filled: false,
                  // hintText: 'Description',
                ),
              ),
              Divider(height: 5.0, color: Colors.grey),
              TextFormField(
                initialValue: account != null ? account.price : '',
                key: priceKey,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: const Icon(Icons.ac_unit),
                  labelText: 'Price',
                  border: InputBorder.none,
                  filled: false,
                  // hintText: 'Client Info',
                ),
              ),
              Divider(height: 5.0, color: Colors.grey),
              TextFormField(
                initialValue: account != null ? account.quantity : '',
                key: quantityKey,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: const Icon(Icons.ac_unit),
                  labelText: 'Quantity',
                  border: InputBorder.none,
                  filled: false,
                  // hintText: 'Client Info',
                ),
              ),
              Divider(height: 5.0, color: Colors.grey),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key:
            isEditing ? ArchSampleKeys.saveAccountFab : ArchSampleKeys.saveNewAccount,
        tooltip: isEditing
            ? 'saveChanges'
            : 'addAccount',
        child: Icon(isEditing ? Icons.check : Icons.add),
        onPressed: () {
          final form = formKey.currentState;
          if (form.validate()) {
            final name = nameKey.currentState.value;
            final transType = transTypeKey.currentState.value;
            final description = descriptionKey.currentState.value;
            final price = priceKey.currentState.value;
            final quantity = quantityKey.currentState.value;

            var model = AccountListModel.of(context);
            if (isEditing) {
              var account = model.accountById(accountId);
              model.updateAccount(account.copy(name: name, transType: transType, description: description, price: price, quantity: quantity));
            } else {
              model.addAccount(Account(name, transType: transType, description: description, price: price, quantity: quantity));
            }

            Navigator.pop(context);
          }
        },
      ),
    );
  }

  bool get isEditing => accountId != null;
}
