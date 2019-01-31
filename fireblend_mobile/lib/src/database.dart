import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:fireblend/fireblend.dart';

class FireblendDatabaseMobile extends FireblendDatabase {
  FirebaseDatabase _database;

  FireblendDatabaseMobile(FirebaseApp app)
      : _database = FirebaseDatabase(app: app);

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
  FireblendDatabaseReferenceMobile ref([String path]) {
    DatabaseReference reference = _database.reference();
    if (path != null) reference = reference.child(path);
    return reference != null
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
  FireblendDatabaseReferenceMobile child(String path) {
    DatabaseReference reference = _reference.child(path);
    return reference != null
        ? FireblendDatabaseReferenceMobile._internal(reference)
        : null;
  }

  @override
  String get key => _reference.key;

  @override
  FireblendDatabaseReferenceMobile parent() {
    DatabaseReference reference = _reference.parent();
    return reference != null
        ? FireblendDatabaseReferenceMobile._internal(reference)
        : null;
  }

  @override
  FireblendDatabaseReferenceMobile push([value]) {
    DatabaseReference reference = _reference.push();
    if (value != null) reference.set(value);
    return reference != null
        ? FireblendDatabaseReferenceMobile._internal(reference)
        : null;
  }

  @override
  Future remove() {
    return _reference.remove();
  }

  @override
  FireblendDatabaseReferenceMobile root() {
    DatabaseReference reference = _reference.root();
    return reference != null
        ? FireblendDatabaseReferenceMobile._internal(reference)
        : null;
  }

  @override
  Future set(value, {priority}) {
    return _reference.set(value, priority: priority);
  }

  @override
  Future setPriority(priority) {
    return _reference.setPriority(priority);
  }

  @override
  Future update(Map<String, dynamic> value) {
    return _reference.update(value);
  }
}

class FireblendQueryMobile extends FireblendQuery {
  final Query _query;

  FireblendQueryMobile._internal(this._query);

  @override
  FireblendQueryMobile endAt(value, {String key}) {
    Query query = _query.endAt(value, key: key);
    return query != null ? FireblendQueryMobile._internal(query) : null;
  }

  @override
  FireblendQueryMobile equalTo(value, {String key}) {
    Query query = _query.equalTo(value, key: key);
    return query != null ? FireblendQueryMobile._internal(query) : null;
  }

  @override
  FireblendQueryMobile limitToFirst(int limit) {
    Query query = _query.limitToFirst(limit);
    return query != null ? FireblendQueryMobile._internal(query) : null;
  }

  @override
  FireblendQueryMobile limitToLast(int limit) {
    Query query = _query.limitToLast(limit);
    return query != null ? FireblendQueryMobile._internal(query) : null;
  }

  @override
  Stream<FireblendEventMobile> get onChildAdded =>
      _query.onChildAdded?.map((Event event) =>
          event != null ? FireblendEventMobile._internal(event) : null);

  @override
  Stream<FireblendEventMobile> get onChildChanged =>
      _query.onChildChanged?.map((Event event) =>
          event != null ? FireblendEventMobile._internal(event) : null);

  @override
  Stream<FireblendEventMobile> get onChildMoved =>
      _query.onChildMoved?.map((Event event) =>
          event != null ? FireblendEventMobile._internal(event) : null);

  @override
  Stream<FireblendEventMobile> get onChildRemoved =>
      _query.onChildRemoved?.map((Event event) =>
          event != null ? FireblendEventMobile._internal(event) : null);

  @override
  Stream<FireblendEventMobile> get onValue =>
      _query.onValue?.map((Event event) =>
          event != null ? FireblendEventMobile._internal(event) : null);

  @override
  Future<FireblendDataSnapshotMobile> once() async {
    DataSnapshot snapshot = await _query.once();
    return snapshot != null
        ? FireblendDataSnapshotMobile._internal(snapshot)
        : null;
  }

  @override
  FireblendQueryMobile orderByChild(String key) {
    Query query = _query.orderByChild(key);
    return query != null ? FireblendQueryMobile._internal(query) : null;
  }

  @override
  FireblendQueryMobile orderByKey() {
    Query query = _query.orderByKey();
    return query != null ? FireblendQueryMobile._internal(query) : null;
  }

  @override
  FireblendQueryMobile orderByPriority() {
    Query query = _query.orderByPriority();
    return query != null ? FireblendQueryMobile._internal(query) : null;
  }

  @override
  FireblendQueryMobile orderByValue() {
    Query query = _query.orderByValue();
    return query != null ? FireblendQueryMobile._internal(query) : null;
  }

  @override
  FireblendDatabaseReferenceMobile reference() {
    DatabaseReference reference = _query.reference();
    return reference != null
        ? FireblendDatabaseReferenceMobile._internal(reference)
        : null;
  }

  @override
  FireblendQueryMobile startAt(value, {String key}) {
    Query query = _query.startAt(value, key: key);
    return query != null ? FireblendQueryMobile._internal(query) : null;
  }

  @override
  String getPath() {
    return _query.path;
  }
}

class FireblendEventMobile extends FireblendEvent {
  final Event _event;

  FireblendEventMobile._internal(this._event);

  @override
  String get previousSiblingKey => _event.previousSiblingKey;

  @override
  FireblendDataSnapshotMobile get snapshot => _event.snapshot != null
      ? FireblendDataSnapshotMobile._internal(_event.snapshot)
      : null;
}

class FireblendDataSnapshotMobile extends FireblendDataSnapshot {
  final DataSnapshot _snapshot;

  FireblendDataSnapshotMobile._internal(this._snapshot);

  @override
  String get key => _snapshot.key;

  @override
  dynamic get value => _snapshot.value;
}
