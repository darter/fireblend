import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:fireblend/fireblend.dart';

class FireblendDatabaseMobile extends FireblendDatabase {
  FirebaseDatabase _database;

  FireblendDatabaseMobile(FirebaseApp app) : _database = FirebaseDatabase(app: app);

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
  FireblendDatabaseReference ref([String path]) {
    DatabaseReference reference = _database.reference();
    if (path != null) reference = reference.child(path);
    return FireblendDatabaseReferenceMobile._internal(reference);
  }
}

class FireblendDatabaseReferenceMobile extends FireblendQueryMobile
    implements FireblendDatabaseReference {
  DatabaseReference _reference;

  FireblendDatabaseReferenceMobile._internal(this._reference)
      : super._internal(_reference);

  @override
  FireblendDatabaseReference child(String path) {
    return FireblendDatabaseReferenceMobile._internal(_reference.child(path));
  }

  @override
  String get key => _reference.key;

  @override
  FireblendDatabaseReference parent() {
    return FireblendDatabaseReferenceMobile._internal(_reference.parent());
  }

  @override
  FireblendDatabaseReference push([value]) {
    DatabaseReference reference = _reference.push();
    if (value != null) reference.set(value);
    return FireblendDatabaseReferenceMobile._internal(reference);
  }

  @override
  Future remove() {
    return _reference.remove();
  }

  @override
  FireblendDatabaseReference root() {
    return FireblendDatabaseReferenceMobile._internal(_reference.root());
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
  FireblendQuery endAt(value, {String key}) {
    return FireblendQueryMobile._internal(_query.endAt(value, key: key));
  }

  @override
  FireblendQuery equalTo(value, {String key}) {
    return FireblendQueryMobile._internal(_query.equalTo(value, key: key));
  }

  @override
  FireblendQuery limitToFirst(int limit) {
    return FireblendQueryMobile._internal(_query.limitToFirst(limit));
  }

  @override
  FireblendQuery limitToLast(int limit) {
    return FireblendQueryMobile._internal(_query.limitToLast(limit));
  }

  @override
  Stream<FireblendEvent> get onChildAdded => _query.onChildAdded
      .map((Event event) => FireblendEventMobile._internal(event));

  @override
  Stream<FireblendEvent> get onChildChanged => _query.onChildChanged
      .map((Event event) => FireblendEventMobile._internal(event));

  @override
  Stream<FireblendEvent> get onChildMoved => _query.onChildMoved
      .map((Event event) => FireblendEventMobile._internal(event));

  @override
  Stream<FireblendEvent> get onChildRemoved => _query.onChildRemoved
      .map((Event event) => FireblendEventMobile._internal(event));

  @override
  Stream<FireblendEvent> get onValue => _query.onValue
      .map((Event event) => FireblendEventMobile._internal(event));

  @override
  Future<FireblendDataSnapshot> once() async {
    DataSnapshot snapshot = await _query.once();
    return FireblendDataSnapshotMobile._internal(snapshot);
  }

  @override
  FireblendQuery orderByChild(String key) {
    return FireblendQueryMobile._internal(_query.orderByChild(key));
  }

  @override
  FireblendQuery orderByKey() {
    return FireblendQueryMobile._internal(_query.orderByKey());
  }

  @override
  FireblendQuery orderByPriority() {
    return FireblendQueryMobile._internal(_query.orderByPriority());
  }

  @override
  FireblendQuery orderByValue() {
    return FireblendQueryMobile._internal(_query.orderByValue());
  }

  @override
  FireblendDatabaseReference reference() {
    return FireblendDatabaseReferenceMobile._internal(_query.reference());
  }

  @override
  FireblendQuery startAt(value, {String key}) {
    return FireblendQueryMobile._internal(_query.startAt(value, key: key));
  }
}

class FireblendEventMobile extends FireblendEvent {
  final Event _event;

  FireblendEventMobile._internal(this._event);

  @override
  String get previousSiblingKey => _event.previousSiblingKey;

  @override
  FireblendDataSnapshot get snapshot =>
      FireblendDataSnapshotMobile._internal(_event.snapshot);
}

class FireblendDataSnapshotMobile extends FireblendDataSnapshot {
  final DataSnapshot _snapshot;

  FireblendDataSnapshotMobile._internal(this._snapshot);

  @override
  String get key => _snapshot.key;

  @override
  dynamic get value => _snapshot.value;
}