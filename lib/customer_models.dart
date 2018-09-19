// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

// import 'util/uuid.dart';
import 'package:scoped_model_sample/util/uuid.dart';
// import 'repos/repository/repository.dart';
import 'package:scoped_model_sample/repos/repository/repository.dart';

// enum AppTab { customers, stats }

// enum ExtraAction { toggleAllComplete, clearCompleted }

class Customer {
  // final bool complete;
  final String id;
  // final String note;
  // final String task;
  final String name;
  final String info;
  final String phone;
  final String address;
  final String problem;
  final String problemDescription;

  // Customer(this.task, this.name, {this.complete = false, this.note = '', this.info, this.phone, this.address, this.problem, this.problemDescription, String id})
  Customer(this.name, {this.info = '', this.phone, this.address, this.problem, this.problemDescription, String id})
      : this.id = id ?? Uuid().generateV4();

  @override
  int get hashCode =>
      name.hashCode ^ info.hashCode ^ phone.hashCode ^ address.hashCode ^ problem.hashCode ^ problemDescription.hashCode ^ id.hashCode;
      // complete.hashCode ^ task.hashCode ^ note.hashCode ^ name.hashCode ^ info.hashCode ^ phone.hashCode ^ address.hashCode ^ problem.hashCode ^ problemDescription.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Customer &&
          runtimeType == other.runtimeType &&
          // complete == other.complete &&
          // task == other.task &&
          // note == other.note &&
          name == other.name &&
          info == other.info &&
          phone == other.phone &&
          address == other.address &&
          problem == other.problem &&
          problemDescription == other.problemDescription &&
          id == other.id;

  @override
  String toString() {
    return 'Customer{name: $name, info: $info, phone: $phone, address: $address, problem: $problem, problemDescription: $problemDescription, id: $id}';
    // return 'Customer{complete: $complete, task: $task, note: $note,name: $name, info: $info, phone: $phone, address: $address, problem: $problem, problemDescription: $problemDescription, id: $id}';
  }

  CustomerEntity toEntity() {
    return CustomerEntity(id, name, info, phone, address, problem, problemDescription);
    // return CustomerEntity(task, id, note, complete, name, info, phone, address, problem, problemDescription);
  }

  static Customer fromEntity(CustomerEntity entity) {
    return Customer(
      // entity.task,
      entity.name,
      // complete: entity.complete ?? false,
      // note: entity.note,
      info: entity.info,
      phone: entity.phone,
      address: entity.address,
      problem: entity.problem,
      problemDescription: entity.problemDescription,
      id: entity.id,
    );
  }

  // Customer copy({String task, bool complete, String note, String name, String info, String phone, String address, String problem, String problemDescription, String id}) {
  Customer copy({String name, String info, String phone, String address, String problem, String problemDescription, String id}) {
    return Customer(
      // task ?? this.task,
      name ?? this.name,
      // complete: complete ?? this.complete,
      // note: note ?? this.note,
      info: info ?? this.info,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      problem: problem ?? this.problem,
      problemDescription: problemDescription ?? this.problemDescription,
      id: id ?? this.id,
    );
  }
}
