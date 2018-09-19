// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
// import '../util/flutter_architecture_samples.dart';
import 'package:scoped_model_sample/util/flutter_architecture_samples.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_sample/account_models.dart';
import 'package:scoped_model_sample/screens/add_edit_account_screen.dart';
import 'package:scoped_model_sample/account_list_model.dart';
import 'package:scoped_model_sample/widgets/account_item.dart';

class AccountList extends StatelessWidget {
  AccountList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<AccountListModel>(
      builder: (context, child, model) {
        return Container(
          child: model.isLoading ? _buildLoading : _accountPage(model),
        );
      },
    );
  }

  Center get _buildLoading {
    return Center(
      child: CircularProgressIndicator(
        key: ArchSampleKeys.accountsLoading,
      ),
    );
  }

  Column _accountPage(AccountListModel model) {
    return Column(
      children: <Widget>[
        _accountSummary(model),
        _titleHistory(),
        _buildList(model),
      ],
    );
  }

  Column _accountSummary(AccountListModel model) {

    Column buildValueColumn(String label, String value, MaterialColor color) {
      final incomes = model.debitAccounts;
      print(incomes);
      // Color colorTitle = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            padding: EdgeInsets.only(top: 16.0),
            child: new Text(
              label,
              style: new TextStyle(
                color: color,
              ),
            ),
          ),
          new Container(
            child: new Text(
              value,
              style: new TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w400,
                color: color,
                
              ),
            ),
          ),
        ],
      );
    }

    Widget valueSection = new Container(      
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildValueColumn('Income', 'RM 1220', Colors.green),
          buildValueColumn('Expenses', 'RM 100', Colors.red),
        ],
      ),
    );

    return Column(
      children: <Widget>[
        buildValueColumn('Balance', 'RM 600', Colors.orange),
        valueSection,
        Padding(padding: EdgeInsets.only(bottom: 16.0))
      ],
    );
  }

  Container _titleHistory() {
    return Container(
      color: Colors.grey,
      height: 26.0,
        // decoration: new BoxDecoration(
        //   color: Colors.grey,
        // ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new Text(
            'Transaction History',
              style: new TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      )
    );
  }
          

  Expanded _buildList(AccountListModel model) {
    final accounts = model.filteredAccounts;

    return Expanded(
      child: ListView.builder(
        key: ArchSampleKeys.accountList,
        itemCount: accounts.length,
        itemBuilder: (BuildContext context, int index) {
          final account = accounts[index];

          return AccountItem(
            account: account,
            onDismissed: (direction) {
              _removeAccount(context, account);
            },
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return AddEditAccountScreen(
                      accountId: account.id,
                    );
                  },
                ),
              ).then((account) {
                if (account is Account) {
                  _showUndoSnackbar(context, account);
                }
              });
            },
            // onCheckboxChanged: (complete) {
            //   var toggled = account.copy(complete: !account.complete);
            //   model.updateAccount(toggled);
            // },
          );
        },
      )
    );
  }

  void _removeAccount(BuildContext context, Account account) {
    AccountListModel.of(context).removeAccount(account);

    _showUndoSnackbar(context, account);
  }

  void _showUndoSnackbar(BuildContext context, Account account) {
    Scaffold.of(context).showSnackBar(
          SnackBar(
            key: ArchSampleKeys.snackbar,
            duration: Duration(seconds: 2),
            backgroundColor: Theme.of(context).backgroundColor,
            content: Text(
              account.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            action: SnackBarAction(
              key: ArchSampleKeys.snackbarAction(account.id),
              label: 'undo',
              onPressed: () {
                AccountListModel.of(context).addAccount(account);
              },
            ),
          ),
        );
  }
}
