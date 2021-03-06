// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListStore on _ListStore, Store {
  Computed<bool>? _$newTodoTitleValidIsNotEmptyComputed;

  @override
  bool get newTodoTitleValidIsNotEmpty =>
      (_$newTodoTitleValidIsNotEmptyComputed ??= Computed<bool>(
              () => super.newTodoTitleValidIsNotEmpty,
              name: '_ListStore.newTodoTitleValidIsNotEmpty'))
          .value;

  late final _$newTodoTitleAtom =
      Atom(name: '_ListStore.newTodoTitle', context: context);

  @override
  String get newTodoTitle {
    _$newTodoTitleAtom.reportRead();
    return super.newTodoTitle;
  }

  @override
  set newTodoTitle(String value) {
    _$newTodoTitleAtom.reportWrite(value, super.newTodoTitle, () {
      super.newTodoTitle = value;
    });
  }

  late final _$todoListAtom =
      Atom(name: '_ListStore.todoList', context: context);

  @override
  ObservableList<TodoStore> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableList<TodoStore> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  late final _$_ListStoreActionController =
      ActionController(name: '_ListStore', context: context);

  @override
  void setNewTodoTitle(String value) {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.setNewTodoTitle');
    try {
      return super.setNewTodoTitle(value);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodoList() {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.addTodoList');
    try {
      return super.addTodoList();
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(int index) {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.removeTodo');
    try {
      return super.removeTodo(index);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newTodoTitle: ${newTodoTitle},
todoList: ${todoList},
newTodoTitleValidIsNotEmpty: ${newTodoTitleValidIsNotEmpty}
    ''';
  }
}
