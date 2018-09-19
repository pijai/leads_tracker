// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
// import '../util/flutter_architecture_samples.dart';
import 'package:leads_tracker/util/flutter_architecture_samples.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:leads_tracker/product_models.dart';
import 'package:leads_tracker/product_list_model.dart';

class AddEditProductScreen extends StatelessWidget {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> nameKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> descriptionKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> priceKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> quantityKey =
      GlobalKey<FormFieldState<String>>();

  final String productId;

  AddEditProductScreen({
    Key key,
    this.productId,
  }) : super(key: key ?? ArchSampleKeys.addProductScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing
            ? 'editProduct'
            : 'addProduct'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidate: false,
          onWillPop: () {
            return Future(() => true);
          },
          child: ScopedModelDescendant<ProductListModel>(
            builder: (BuildContext context, Widget child, ProductListModel model) {
              var product = model.productById(productId);
              return ListView(
                children: [
                  TextFormField(
                    initialValue: product != null ? product.name : '',
                    key: nameKey,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: 'Name',
                      border: InputBorder.none,
                      filled: false,
                      // hintText: 'Product Name',
                    ),
                    autofocus: isEditing ? false : true,
                    validator: (val) => val.trim().isEmpty
                        ? 'Error client empty'
                        : null,
                  ),
                  Divider(height: 5.0, color: Colors.grey),
                  TextFormField(
                    initialValue: product != null ? product.description : '',
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
                    initialValue: product != null ? product.price : '',
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
                    initialValue: product != null ? product.quantity : '',
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
            isEditing ? ArchSampleKeys.saveProductFab : ArchSampleKeys.saveNewProduct,
        tooltip: isEditing
            ? 'saveChanges'
            : 'addProduct',
        child: Icon(isEditing ? Icons.check : Icons.add),
        onPressed: () {
          final form = formKey.currentState;
          if (form.validate()) {
            final name = nameKey.currentState.value;
            final description = descriptionKey.currentState.value;
            final price = priceKey.currentState.value;
            final quantity = quantityKey.currentState.value;

            var model = ProductListModel.of(context);
            if (isEditing) {
              var product = model.productById(productId);
              model.updateProduct(product.copy(name: name, description: description, price: price, quantity: quantity));
            } else {
              model.addProduct(Product(name, description: description, price: price, quantity: quantity));
            }

            Navigator.pop(context);
          }
        },
      ),
    );
  }

  bool get isEditing => productId != null;
}

class CounterFormField extends FormField<int> {

  CounterFormField({
    Key key,
    FormFieldSetter<int> onSaved,
    FormFieldValidator<int> validator,
    int initialValue = 0,
    bool autovalidate = false
  }) : super(
    onSaved: onSaved,
    validator: validator,
    initialValue: initialValue,
    autovalidate: autovalidate,
    builder: (FormFieldState<int> state) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              state.didChange(state.value - 1);
            },
          ),
          Text(
            state.value.toString()
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              state.didChange(state.value + 1);
            },
          ),
        ],
      );
    }
  );
}