// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
// import '../util/flutter_architecture_samples.dart';
import 'package:leads_tracker/util/flutter_architecture_samples.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:leads_tracker/customer_models.dart';
import 'package:leads_tracker/screens/add_edit_customer_screen.dart';
import 'package:leads_tracker/customer_list_model.dart';
import 'package:leads_tracker/widgets/customer_item.dart';

class CustomerList extends StatelessWidget {
  CustomerList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CustomerListModel>(
      builder: (context, child, model) {
        return Container(
          child: model.isLoading ? _buildLoading : _buildList(model),
        );
      },
    );
  }

  Center get _buildLoading {
    return Center(
      child: CircularProgressIndicator(
        key: ArchSampleKeys.customersLoading,
      ),
    );
  }

  ListView _buildList(CustomerListModel model) {
    final customers = model.filteredCustomers;

    return ListView.builder(
      key: ArchSampleKeys.customerList,
      itemCount: customers.length,
      itemBuilder: (BuildContext context, int index) {
        final customer = customers[index];

        return CustomerItem(
          customer: customer,
          onDismissed: (direction) {
            _removeCustomer(context, customer);
          },
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return AddEditCustomerScreen(
                    customerId: customer.id,
                  );
                },
              ),
            ).then((customer) {
              if (customer is Customer) {
                _showUndoSnackbar(context, customer);
              }
            });
          },
          // onCheckboxChanged: (complete) {
          //   var toggled = customer.copy(complete: !customer.complete);
          //   model.updateCustomer(toggled);
          // },
        );
      },
    );
  }

  void _removeCustomer(BuildContext context, Customer customer) {
    CustomerListModel.of(context).removeCustomer(customer);

    _showUndoSnackbar(context, customer);
  }

  void _showUndoSnackbar(BuildContext context, Customer customer) {
    Scaffold.of(context).showSnackBar(
          SnackBar(
            key: ArchSampleKeys.snackbar,
            duration: Duration(seconds: 2),
            backgroundColor: Theme.of(context).backgroundColor,
            content: Text(
              customer.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            action: SnackBarAction(
              key: ArchSampleKeys.snackbarAction(customer.id),
              label: 'undo',
              onPressed: () {
                CustomerListModel.of(context).addCustomer(customer);
              },
            ),
          ),
        );
  }
}
