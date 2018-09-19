// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

class AccountEntity {
  final String id;
  final String transType;
  final String name;
  final String description;
  final String price;
  final String quantity;

  AccountEntity(this.name, this.transType, this.description, this.price, this.quantity, this.id);

  @override
  int get hashCode =>
      name.hashCode ^ transType.hashCode ^ description.hashCode ^ price.hashCode ^ quantity.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          transType == other.transType &&
          description == other.description &&
          price == other.price &&
          quantity == other.quantity &&
          id == other.id;

  Map<String, Object> toJson() {
    return {
      "name": name,
      "transType": transType,
      "description": description,
      "price": price,
      "quantity": quantity,
      "id": id,
    };
  }

  @override
  String toString() {
    return 'AccountEntity{name: $name, transType: $transType, description: $description, price: $price, quantity: $quantity, id: $id}';
  }

  static AccountEntity fromJson(Map<String, Object> json) {
    return AccountEntity(
      json["name"] as String,
      json["transType"] as String,
      json["description"] as String,
      json["price"] as String,
      json["quantity"] as String,
      json["id"] as String,
    );
  }
}
