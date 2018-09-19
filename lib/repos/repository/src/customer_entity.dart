// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

class CustomerEntity {
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

  CustomerEntity(this.id, this.name, this.info, this.phone, this.address, this.problem, this.problemDescription);
  // CustomerEntity(this.task, this.id, this.note, this.complete, this.name, this.info, this.phone, this.address, this.problem, this.problemDescription,);

  @override
  int get hashCode =>
      name.hashCode ^ info.hashCode ^ phone.hashCode ^ address.hashCode ^ problem.hashCode ^ problemDescription.hashCode ^ id.hashCode;
      // complete.hashCode ^ task.hashCode ^ note.hashCode ^ name.hashCode ^ info.hashCode ^ phone.hashCode ^ address.hashCode ^ problem.hashCode ^ problemDescription.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerEntity &&
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

  Map<String, Object> toJson() {
    return {
      // "complete": complete,
      // "task": task,
      // "note": note,
      "name": name,
      "info": info,
      "phone": phone,
      "address": address,
      "problem": problem,
      "problemDescription": problemDescription,
      "id": id,
    };
  }

  @override
  String toString() {
    return 'CustomerEntity{name: $name, info: $info, phone: $phone, address: $address, prblem: $problem, problemDescription: $problemDescription, id: $id}';
    // return 'CustomerEntity{complete: $complete, task: $task, note: $note, name: $name, info: $info, phone: $phone, address: $address, prblem: $problem, problemDescription: $problemDescription, id: $id}';
  }

  static CustomerEntity fromJson(Map<String, Object> json) {
    return CustomerEntity(
      // json["task"] as String,
      json["id"] as String,
      // json["note"] as String,
      // json["complete"] as bool,
      json["name"] as String,
      json["info"] as String,
      json["phone"] as String,
      json["address"] as String,
      json["problem"] as String,
      json["problemDescription"] as String,
    );
  }
}
