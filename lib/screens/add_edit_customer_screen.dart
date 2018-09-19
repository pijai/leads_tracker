// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
// import '../util/flutter_architecture_samples.dart';
import 'package:leads_tracker/util/flutter_architecture_samples.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:leads_tracker/customer_models.dart';
import 'package:leads_tracker/customer_list_model.dart';

class AddEditCustomerScreen extends StatelessWidget {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // static final GlobalKey<FormFieldState<String>> taskKey =
  //     GlobalKey<FormFieldState<String>>();
  // static final GlobalKey<FormFieldState<String>> noteKey =
  //     GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> nameKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> infoKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> phoneKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> addressKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> problemKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> problemDescriptionKey =
      GlobalKey<FormFieldState<String>>();

  final String customerId;

  AddEditCustomerScreen({
    Key key,
    this.customerId,
  }) : super(key: key ?? ArchSampleKeys.addCustomerScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing
            ? 'editCustomer'
            : 'addCustomer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidate: false,
          onWillPop: () {
            return Future(() => true);
          },
          child: ScopedModelDescendant<CustomerListModel>(
            builder: (BuildContext context, Widget child, CustomerListModel model) {
              var customer = model.customerById(customerId);
              return ListView(
                children: [
                  // TextFormField(
                  //   initialValue: customer?.task ?? '',
                  //   key: taskKey,
                  //   autofocus: isEditing ? false : true,
                  //   style: Theme.of(context).textTheme.headline,
                  //   decoration: InputDecoration(
                  //       hintText:
                  //           'newCustomerHint'),
                  //   validator: (val) => val.trim().isEmpty
                  //       ? 'emptyCustomerError'
                  //       : null,
                  // ),
                  // TextFormField(
                  //   initialValue: customer?.note ?? '',
                  //   key: noteKey,
                  //   maxLines: 10,
                  //   style: Theme.of(context).textTheme.subhead,
                  //   decoration: InputDecoration(
                  //     hintText: 'notesHint',
                  //   ),
                  // ),
                  TextFormField(
                    initialValue: customer?.name ?? '',
                    key: nameKey,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: 'Name',
                      border: InputBorder.none,
                      filled: false,
                      // hintText: 'Client Name',
                    ),
                    autofocus: isEditing ? false : true,
                    validator: (val) => val.trim().isEmpty
                        ? 'Error client empty'
                        : null,
                  ),
                  Divider(height: 5.0, color: Colors.grey),
                  TextFormField(
                    initialValue: customer?.phone ?? '',
                    key: phoneKey,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.phone),
                      labelText: 'Phone',
                      border: InputBorder.none,
                      filled: false,
                      // hintText: 'Client Phone',
                    ),
                  ),
                  Divider(height: 5.0, color: Colors.grey),
                  TextFormField(
                    initialValue: customer?.info ?? '',
                    key: infoKey,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.info),
                      labelText: 'Info',
                      border: InputBorder.none,
                      filled: false,
                      // hintText: 'Client Info',
                    ),
                  ),
                  Divider(height: 5.0, color: Colors.grey),
                  TextFormField(
                    initialValue: customer?.address ?? '',
                    key: addressKey,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.home),
                      labelText: 'Address',
                      border: InputBorder.none,
                      filled: false,
                      hintText: 'Client Address',
                    ),
                  ),
                  Divider(height: 5.0, color: Colors.grey),
                  TextFormField(
                    initialValue: customer?.problem ?? '',
                    key: problemKey,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.note_add),
                      labelText: 'Problem',
                      border: InputBorder.none,
                      filled: false,
                      hintText: 'Client Problem',
                    ),
                  ),
                  Divider(height: 5.0, color: Colors.grey),
                  TextFormField(
                    initialValue: customer?.problemDescription ?? '',
                    key: problemDescriptionKey,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.note),
                      labelText: 'Problem Description',
                      border: InputBorder.none,
                      filled: false,
                      hintText: 'Client Problem Description',
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
            isEditing ? ArchSampleKeys.saveCustomerFab : ArchSampleKeys.saveNewCustomer,
        tooltip: isEditing
            ? 'saveChanges'
            : 'addCustomer',
        child: Icon(isEditing ? Icons.check : Icons.add),
        onPressed: () {
          final form = formKey.currentState;
          if (form.validate()) {
            // final task = taskKey.currentState.value;
            // final note = noteKey.currentState.value;
            final name = nameKey.currentState.value;
            final info = infoKey.currentState.value;
            final phone = phoneKey.currentState.value;
            final address = addressKey.currentState.value;
            final problem = problemKey.currentState.value;
            final problemDescription = problemDescriptionKey.currentState.value;

            var model = CustomerListModel.of(context);
            if (isEditing) {
              var customer = model.customerById(customerId);
              model.updateCustomer(customer.copy(name: name, info: info, phone: phone, address: address, problem: problem, problemDescription: problemDescription));
              // model.updateCustomer(customer.copy(task: task, note: note, name: name, info: info, phone: phone, address: address, problem: problem, problemDescription: problemDescription));
            } else {
              model.addCustomer(Customer(name, phone: phone, address: address, problem: problem, problemDescription: problemDescription));
              // model.addCustomer(Customer(task, name, note: note, phone: phone, address: address, problem: problem, problemDescription: problemDescription));
            }

            Navigator.pop(context);
          }
        },
      ),
    );
  }

  bool get isEditing => customerId != null;
}
