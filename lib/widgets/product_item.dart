// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import '../util/flutter_architecture_samples.dart';
import 'package:scoped_model_sample/util/flutter_architecture_samples.dart';
import 'package:scoped_model_sample/product_models.dart';

class ProductItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  // final ValueChanged<bool> onCheckboxChanged;
  final Product product;

  ProductItem({
    @required this.onDismissed,
    @required this.onTap,
    // @required this.onCheckboxChanged,
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ArchSampleKeys.productItem(product.id),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(child: Text(product.name[0]),),
        title: Text(
          product.name,
          key: ArchSampleKeys.productItemName(product.id),
          // style: Theme.of(context).textTheme.title,
        ),
        // subtitle: Text(
        //   product.description,
        //   key: ArchSampleKeys.productItemDescription(product.id),
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        //   // style: Theme.of(context).textTheme.subhead,
        // ),
        trailing: Text(
          product.quantity.toString(),
          key: ArchSampleKeys.productItemQuantity(product.id),
        ),
      ),
    );
  }
}
