// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import '../util/flutter_architecture_samples.dart';
import 'package:scoped_model_sample/util/flutter_architecture_samples.dart';
import 'package:scoped_model_sample/customer_models.dart';

class CustomerItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  // final ValueChanged<bool> onCheckboxChanged;
  final Customer customer;

  CustomerItem({
    @required this.onDismissed,
    @required this.onTap,
    // @required this.onCheckboxChanged,
    @required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ArchSampleKeys.customerItem(customer.id),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        // leading: Checkbox(
        //   key: ArchSampleKeys.customerItemCheckbox(customer.id),
        //   value: customer.complete,
        //   onChanged: onCheckboxChanged,
        // ),
        leading: CircleAvatar(child: Text(customer.name[0],style: TextStyle(color: Colors.white),),),
        title: Text(
          customer.name,
          key: ArchSampleKeys.customerItemName(customer.id),
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          customer.info,
          key: ArchSampleKeys.customerItemInfo(customer.id),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subhead,
        ),
      ),
    );
  }
}
