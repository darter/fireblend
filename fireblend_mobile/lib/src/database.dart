import 'dart:async';

import 'package:collection/collection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:fireblend/fireblend.dart';

class FireblendDatabaseMobile extends FireblendDatabase {
  FirebaseDatabase _database;

  FireblendDatabaseMobile(FirebaseApp app)
      : _database = FirebaseDatabase.instanceFor(app: app);

  FirebaseDatabase get database => _database;

  @override
  Future goOffline() {
    return _database.goOffline();
  }

  @override
  Future goOnline() {
    return _database.goOnline();
  }

  @override
  FireblendDatabaseReferenceMobile? ref([String? path]) {
    DatabaseReference reference = _database.ref();
    if (path != null) reference = reference.child(path);
    return path != null
        ? FireblendDatabaseReferenceMobile._internal(reference)
        : null;
  }
}

class FireblendDatabaseReferenceMobile extends FireblendQueryMobile
    implements FireblendDatabaseReference {
  DatabaseReference _reference;

  FireblendDatabaseReferenceMobile._internal(this._reference)
      : super._internal(_reference);

  @override
  FireblendDatabaseReferenceMobile? child(String path) {
    try {
      DatabaseReference reference = _reference.child(path);
      return FireblendDatabaseReferenceMobile._internal(reference);
    } catch (error) {
      print('AQUI TAMOS!!! -> $error');
      return null;
    }
  }

  @override
  String? get key => _reference.key;

  @override
  FireblendDatabaseReferenceMobile? parent() {
    try {
      DatabaseReference? reference = _reference.parent;
      return reference != null
          ? FireblendDatabaseReferenceMobile._internal(reference)
          : null;
    } catch (error) {
      print('AQUI TAMOS!!! -> $error');
      return null;
    }
  }

  @override
  FireblendDatabaseReferenceMobile? push([value]) {
    try {
      DatabaseReference reference = _reference.push();
      if (value != null) reference.set(value);
      return FireblendDatabaseReferenceMobile._internal(reference);
    } catch (error) {
      print('AQUI TAMOS!!! -> $error');
      return null;
    }
  }

  @override
  Future remove() {
    return _reference.remove();
  }

  @override
  FireblendDatabaseReferenceMobile? root() {
    DatabaseReference reference = _reference.root;
    return FireblendDatabaseReferenceMobile._internal(reference);
  }

  @override
  Future set(value, {priority}) {
    return _reference.setWithPriority(value, priority);
  }

  @override
  Future setPriority(priority) {
    return _reference.setPriority(priority);
  }

  @override
  Future update(Map<String, dynamic> value) {
    return _reference.update(value);
  }

  @override
  Future<FireblendDataSnapshotMobile?> transaction(Function function) async {
    TransactionHandler handler = Transaction.success;

    TransactionResult result = await _reference.runTransaction(handler);
    return FireblendDataSnapshotMobile._internal(result.snapshot);
  }

  @override
  FireblendOnDisconnectMobile? onDisconnect() {
    OnDisconnect onDisconnect = _reference.onDisconnect();
    return FireblendOnDisconnectMobile._internal(onDisconnect);
  }
}

class FireblendQueryMobile extends FireblendQuery {
  final Query _query;
  final Map<String, dynamic> _parameters;

  FireblendQueryMobile._internal(this._query) : _parameters = Map();

  @override
  FireblendQueryMobile? endAt(value, {String? key}) {
    _parameters['endAt'] = value;
    _parameters['endAtKey'] = key;
    Query query = _query.endAt(value, key: key);
    return FireblendQueryMobile._internal(query);
  }

  @override
  FireblendQueryMobile? equalTo(value, {String? key}) {
    _parameters['equalTo'] = value;
    _parameters['equalToKey'] = key;
    Query query = _query.equalTo(value, key: key);
    return FireblendQueryMobile._internal(query);
  }

  @override
  FireblendQueryMobile? limitToFirst(int limit) {
    _parameters['limitToFirst'] = limit;
    Query query = _query.limitToFirst(limit);
    return FireblendQueryMobile._internal(query);
  }

  @override
  FireblendQueryMobile? limitToLast(int limit) {
    _parameters['limitToLast'] = limit;
    Query query = _query.limitToLast(limit);
    return FireblendQueryMobile._internal(query);
  }

  @override
  Stream<FireblendEventMobile?> get onChildAdded => _query.onChildAdded
      .map((DatabaseEvent event) => FireblendEventMobile._internal(event));

  @override
  Stream<FireblendEventMobile?> get onChildChanged => _query.onChildChanged
      .map((DatabaseEvent event) => FireblendEventMobile._internal(event));

  @override
  Stream<FireblendEventMobile?> get onChildMoved => _query.onChildMoved
      .map((DatabaseEvent event) => FireblendEventMobile._internal(event));

  @override
  Stream<FireblendEventMobile?> get onChildRemoved => _query.onChildRemoved
      .map((DatabaseEvent event) => FireblendEventMobile._internal(event));

  @override
  Stream<FireblendEventMobile?> get onValue => _query.onValue
      .map((DatabaseEvent event) => FireblendEventMobile._internal(event));

  @override
  Future<FireblendDataSnapshotMobile?> once() async {
    DatabaseEvent snapshot = await _query.once();
    return FireblendDataSnapshotMobile._internal(snapshot.snapshot);
  }

  @override
  FireblendQueryMobile? orderByChild(String key) {
    _parameters['orderBy'] = 'child';
    _parameters['orderByChildKey'] = key;
    Query query = _query.orderByChild(key);
    return FireblendQueryMobile._internal(query);
  }

  @override
  FireblendQueryMobile? orderByKey() {
    _parameters['orderBy'] = 'key';
    Query query = _query.orderByKey();
    return FireblendQueryMobile._internal(query);
  }

  @override
  FireblendQueryMobile? orderByPriority() {
    _parameters['orderBy'] = 'priority';
    Query query = _query.orderByPriority();
    return FireblendQueryMobile._internal(query);
  }

  @override
  FireblendQueryMobile? orderByValue() {
    _parameters['orderBy'] = 'value';
    Query query = _query.orderByValue();
    return FireblendQueryMobile._internal(query);
  }

  @override
  FireblendDatabaseReferenceMobile? reference() {
    DatabaseReference reference = _query.ref;
    return FireblendDatabaseReferenceMobile._internal(reference);
  }

  @override
  FireblendQueryMobile? startAt(value, {String? key}) {
    _parameters['startAt'] = value;
    _parameters['startAtKey'] = key;
    Query query = _query.startAt(value, key: key);
    return FireblendQueryMobile._internal(query);
  }

  @override
  String getPath() {
    return _query.path;
  }

  @override
  Map<String, dynamic> getParameters() {
    return _parameters;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FireblendQueryMobile &&
          runtimeType == other.runtimeType &&
          getPath() == other.getPath() &&
          MapEquality().equals(_parameters, other._parameters);

  @override
  int get hashCode => getPath().hashCode ^ _parameters.hashCode;
}

class FireblendEventMobile extends FireblendEvent {
  final DatabaseEvent _event;

  FireblendEventMobile._internal(this._event);

  @override
  String? get previousSiblingKey => _event.previousChildKey;

  @override
  FireblendDataSnapshotMobile? get snapshot =>
      FireblendDataSnapshotMobile._internal(_event.snapshot);
}

class FireblendDataSnapshotMobile extends FireblendDataSnapshot {
  final DataSnapshot _snapshot;

  FireblendDataSnapshotMobile._internal(this._snapshot);

  @override
  String? get key => _snapshot.key;

  @override
  dynamic get value => _snapshot.value;
}

class FireblendOnDisconnectMobile extends FireblendOnDisconnect {
  final OnDisconnect _onDisconnect;

  FireblendOnDisconnectMobile._internal(this._onDisconnect);

  @override
  Future set(value, {priority}) {
    return _onDisconnect.setWithPriority(value, priority);
  }

  @override
  Future remove() {
    return _onDisconnect.remove();
  }

  @override
  Future cancel() {
    return _onDisconnect.cancel();
  }

  @override
  Future update(Map<String, dynamic> value) {
    return _onDisconnect.update(value);
  }
}
