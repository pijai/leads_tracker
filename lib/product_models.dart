// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

// import 'util/uuid.dart';
// import 'repos/repository/repository.dart';
import 'package:scoped_model_sample/util/uuid.dart';
import 'package:scoped_model_sample/repos/repository/repository.dart';

// enum AppTab { products, stats }

// enum ExtraAction { toggleAllComplete, clearCompleted }

class Product {
  final String id;
  final String name;
  final String description;
  final String price;
  final String quantity;
  final int qty;

  Product(this.name, {this.description = '', this.price = '', this.quantity = '', this.qty = 0,  String id})
      : this.id = id ?? Uuid().generateV4();

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ price.hashCode ^ quantity.hashCode ^ qty.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          price == other.price &&
          quantity == other.quantity &&
          qty == other.qty &&
          id == other.id;

  @override
  String toString() {
    return 'Product{name: $name, description: $description, price: $price, quantity: $quantity, qty: $qty id: $id}';
  }

  ProductEntity toEntity() {
    return ProductEntity(name, description, price, quantity, qty, id);
  }

  static Product fromEntity(ProductEntity entity) {
    return Product(
      entity.name,
      description: entity.description,
      price: entity.price,
      quantity: entity.quantity,
      qty: entity.qty,
      id: entity.id,
    );
  }

  Product copy({String name, String description, String price, String quantity, int qty, String id}) {
    return Product(
      name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      qty: qty ?? this.qty,
      id: id ?? this.id,
    );
  }
}
