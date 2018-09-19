// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

// import 'util/uuid.dart';
// import 'repos/repository/repository.dart';
import 'package:leads_tracker/util/uuid.dart';
import 'package:leads_tracker/repos/repository/repository.dart';

// enum AppTab { accounts, stats }

// enum ExtraAction { toggleAllComplete, clearCompleted }

class Account {
  final String id;
  final String name;
  final String transType;
  final String description;
  final String price;
  final String quantity;

  Account(this.name, {this.transType = '', this.description = '', this.price = '', this.quantity = '',  String id})
      : this.id = id ?? Uuid().generateV4();

  @override
  int get hashCode =>
      name.hashCode ^ transType.hashCode ^ description.hashCode ^ price.hashCode ^ quantity.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Account &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          transType == other.transType &&
          description == other.description &&
          price == other.price &&
          quantity == other.quantity &&
          id == other.id;

  @override
  String toString() {
    return 'Account{name: $name, transType: $transType, description: $description, price: $price, quantity: $quantity, id: $id}';
  }

  AccountEntity toEntity() {
    return AccountEntity(name, transType, description, price, quantity, id);
  }

  static Account fromEntity(AccountEntity entity) {
    return Account(
      entity.name,
      transType: entity.transType,
      description: entity.description,
      price: entity.price,
      quantity: entity.quantity,
      id: entity.id,
    );
  }

  Account copy({String name, String transType, String description, String price, String quantity, String id}) {
    return Account(
      name ?? this.name,
      transType: transType ?? this.transType,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
    );
  }
}
