import 'dart:async';

import 'package:collection/collection.dart';
import 'package:firebase/firebase.dart' as fb;

import 'package:fireblend/fireblend.dart';

class FireblendDatabaseWeb extends FireblendDatabase {
  fb.Database _database;

  FireblendDatabaseWeb(fb.App app) : _database = fb.database(app);

  fb.Database get database => _database;

  @override
  Future goOffline() async {
    return _database.goOffline();
  }

  @override
  Future goOnline() async {
    return _database.goOnline();
  }

  @override
  FireblendDatabaseReferenceWeb ref([String path]) {
    fb.DatabaseReference reference = _database.ref(path);
    return reference != null
        ? FireblendDatabaseReferenceWeb._internal(reference)
        : null;
  }
}

class FireblendDatabaseReferenceWeb extends FireblendQueryWeb
    implements FireblendDatabaseReference {
  final fb.DatabaseReference _reference;

  FireblendDatabaseReferenceWeb._internal(this._reference)
      : super._internal(_reference);

  @override
  FireblendDatabaseReferenceWeb child(String path) {
    fb.DatabaseReference reference = _reference.child(path);
    return reference != null
        ? FireblendDatabaseReferenceWeb._internal(reference)
        : null;
  }

  @override
  String get key => _reference.key;

  @override
  FireblendDatabaseReferenceWeb parent() {
    fb.DatabaseReference reference = _reference.parent;
    return reference != null
        ? FireblendDatabaseReferenceWeb._internal(reference)
        : null;
  }

  @override
  FireblendDatabaseReferenceWeb push([value]) {
    fb.DatabaseReference reference = _reference.push(value);
    return reference != null
        ? FireblendDatabaseReferenceWeb._internal(reference)
        : null;
  }

  @override
  Future remove() {
    return _reference.remove();
  }

  @override
  FireblendDatabaseReferenceWeb root() {
    fb.DatabaseReference reference = _reference.root;
    return reference != null
        ? FireblendDatabaseReferenceWeb._internal(reference)
        : null;
  }

  @override
  Future set(value, {priority}) {
    if (priority == null) return _reference.set(value);
    else return _reference.setWithPriority(value, priority);
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
  Future<FireblendDataSnapshotWeb> transaction(Function function) async {
    fb.Transaction transaction = await _reference.transaction(function);
    return transaction.snapshot != null
        ? FireblendDataSnapshotWeb._internal(transaction.snapshot)
        : null;
  }
}

class FireblendQueryWeb extends FireblendQuery {
  final fb.Query _query;
  final Map<String, dynamic> _parameters;

  FireblendQueryWeb._internal(this._query) : _parameters = Map();

  @override
  FireblendQueryWeb endAt(value, {String key}) {
    _parameters["endAt"] = value;
    _parameters["endAtKey"] = key;
    fb.Query query = _query.endAt(value, key);
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb equalTo(value, {String key}) {
    _parameters["equalTo"] = value;
    _parameters["equalToKey"] = key;
    fb.Query query = _query.equalTo(value, key);
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb limitToFirst(int limit) {
    _parameters["limitToFirst"] = limit;
    fb.Query query = _query.limitToFirst(limit);
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb limitToLast(int limit) {
    _parameters["limitToLast"] = limit;
    fb.Query query = _query.limitToLast(limit);
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  Stream<FireblendEventWeb> get onChildAdded =>
      _query.onChildAdded?.map((fb.QueryEvent event) =>
          event != null ? FireblendEventWeb._internal(event) : null);

  @override
  Stream<FireblendEventWeb> get onChildChanged =>
      _query.onChildChanged?.map((fb.QueryEvent event) =>
          event != null ? FireblendEventWeb._internal(event) : null);

  @override
  Stream<FireblendEventWeb> get onChildMoved =>
      _query.onChildMoved?.map((fb.QueryEvent event) =>
          event != null ? FireblendEventWeb._internal(event) : null);

  @override
  Stream<FireblendEventWeb> get onChildRemoved =>
      _query.onChildRemoved?.map((fb.QueryEvent event) =>
          event != null ? FireblendEventWeb._internal(event) : null);

  @override
  Stream<FireblendEventWeb> get onValue =>
      _query.onValue?.map((fb.QueryEvent event) =>
          event != null ? FireblendEventWeb._internal(event) : null);

  @override
  Future<FireblendDataSnapshotWeb> once() async {
    fb.QueryEvent event = await _query.once("value");
    fb.DataSnapshot snapshot = event?.snapshot;
    return snapshot != null
        ? FireblendDataSnapshotWeb._internal(snapshot)
        : null;
  }

  @override
  FireblendQueryWeb orderByChild(String key) {
    _parameters["orderBy"] = "child";
    _parameters["orderByChildKey"] = key;
    fb.Query query = _query.orderByChild(key);
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb orderByKey() {
    _parameters["orderBy"] = "key";
    fb.Query query = _query.orderByKey();
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb orderByPriority() {
    _parameters["orderBy"] = "priority";
    fb.Query query = _query.orderByPriority();
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb orderByValue() {
    _parameters["orderBy"] = "value";
    fb.Query query = _query.orderByValue();
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendDatabaseReferenceWeb reference() {
    fb.DatabaseReference reference = _query.ref;
    return reference != null
        ? FireblendDatabaseReferenceWeb._internal(reference)
        : null;
  }

  @override
  FireblendQueryWeb startAt(value, {String key}) {
    _parameters["startAt"] = value;
    _parameters["startAtKey"] = key;
    fb.Query query = _query.startAt(value, key);
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  String getPath() {
    String url = _query.toString();
    return url.substring(url.indexOf("/", 8) + 1, url.length);
  }

  @override
  Map<String, dynamic> getParameters() {
    return _parameters;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FireblendQueryWeb &&
              runtimeType == other.runtimeType &&
              getPath() == other.getPath() &&
              MapEquality().equals(_parameters, other._parameters);

  @override
  int get hashCode =>
      getPath().hashCode ^
      _parameters.hashCode;
}

class FireblendEventWeb extends FireblendEvent {
  final fb.QueryEvent _event;

  FireblendEventWeb._internal(this._event);

  @override
  String get previousSiblingKey => _event.prevChildKey;

  @override
  FireblendDataSnapshotWeb get snapshot => _event.snapshot != null
      ? FireblendDataSnapshotWeb._internal(_event.snapshot)
      : null;
}

class FireblendDataSnapshotWeb extends FireblendDataSnapshot {
  final fb.DataSnapshot _snapshot;

  FireblendDataSnapshotWeb._internal(this._snapshot);

  @override
  String get key => _snapshot.key;

  @override
  dynamic get value => _snapshot.val();
}
