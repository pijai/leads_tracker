// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
// import '../util/flutter_architecture_samples.dart';
import 'package:leads_tracker/util/flutter_architecture_samples.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:leads_tracker/models.dart';
import 'package:leads_tracker/todo_list_model.dart';

class AddEditScreen extends StatelessWidget {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> taskKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> noteKey =
      GlobalKey<FormFieldState<String>>();

  final String todoId;

  AddEditScreen({
    Key key,
    this.todoId,
  }) : super(key: key ?? ArchSampleKeys.addTodoScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing
            ? 'editTodo'
            : 'addTodo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidate: false,
          onWillPop: () {
            return Future(() => true);
          },
          child: ScopedModelDescendant<TodoListModel>(
            builder: (BuildContext context, Widget child, TodoListModel model) {
              var task = model.todoById(todoId);
              return ListView(
                children: [
                  TextFormField(
                    initialValue: task?.task ?? '',
                    key: taskKey,
                    autofocus: isEditing ? false : true,
                    style: Theme.of(context).textTheme.headline,
                    decoration: InputDecoration(
                        hintText:
                            'newTodoHint'),
                    validator: (val) => val.trim().isEmpty
                        ? 'emptyTodoError'
                        : null,
                  ),
                  TextFormField(
                    initialValue: task?.note ?? '',
                    key: noteKey,
                    maxLines: 10,
                    style: Theme.of(context).textTheme.subhead,
                    decoration: InputDecoration(
                      hintText: 'notesHint',
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key:
            isEditing ? ArchSampleKeys.saveTodoFab : ArchSampleKeys.saveNewTodo,
        tooltip: isEditing
            ? 'saveChanges'
            : 'addTodo',
        child: Icon(isEditing ? Icons.check : Icons.add),
        onPressed: () {
          final form = formKey.currentState;
          if (form.validate()) {
            final task = taskKey.currentState.value;
            final note = noteKey.currentState.value;

            var model = TodoListModel.of(context);
            if (isEditing) {
              var todo = model.todoById(todoId);
              model.updateTodo(todo.copy(task: task, note: note));
            } else {
              model.addTodo(Todo(task, note: note));
            }

            Navigator.pop(context);
          }
        },
      ),
    );
  }

  bool get isEditing => todoId != null;
}
