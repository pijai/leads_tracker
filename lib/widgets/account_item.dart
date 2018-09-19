// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import '../util/flutter_architecture_samples.dart';
import 'package:leads_tracker/util/flutter_architecture_samples.dart';
import 'package:leads_tracker/account_models.dart';

class AccountItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  // final ValueChanged<bool> onCheckboxChanged;
  final Account account;

  AccountItem({
    @required this.onDismissed,
    @required this.onTap,
    // @required this.onCheckboxChanged,
    @required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ArchSampleKeys.accountItem(account.id),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(child: Text(account.name[0]),),
        title: Text(
          account.name,
          key: ArchSampleKeys.accountItemName(account.id),
          // style: Theme.of(context).textTheme.title,
        ),
        // subtitle: Text(
        //   account.description,
        //   key: ArchSampleKeys.accountItemDescription(account.id),
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        //   // style: Theme.of(context).textTheme.subhead,
        // ),
        trailing: Text(
          "RM ${account.quantity}",
          style: TextStyle(
            color: account.transType == 'debit' ? Colors.green : Colors.red
          ),
          key: ArchSampleKeys.accountItemQuantity(account.id),
        ),
      ),
    );
  }
}
