// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

class ProductEntity {
  final String id;
  final String name;
  final String description;
  final String price;
  final String quantity;
  final int qty;

  ProductEntity(this.name, this.description, this.price, this.quantity,this.qty, this.id);

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ price.hashCode ^ quantity.hashCode ^ qty.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          price == other.price &&
          quantity == other.quantity &&
          qty == other.qty &&
          id == other.id;

  Map<String, Object> toJson() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "quantity": quantity,
      "qty": qty,
      "id": id,
    };
  }

  @override
  String toString() {
    return 'ProductEntity{name: $name, description: $description, price: $price, quantity: $quantity, qty: $qty, id: $id}';
  }

  static ProductEntity fromJson(Map<String, Object> json) {
    return ProductEntity(
      json["name"] as String,
      json["description"] as String,
      json["price"] as String,
      json["quantity"] as String,
      json["qty"] as int,
      json["id"] as String,
    );
  }
}
