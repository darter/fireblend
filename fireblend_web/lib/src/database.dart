import 'package:firebase/firebase.dart' as fb;

import 'package:fireblend_web/src/temp/fireblend.dart';

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
  FireblendDatabaseReference ref([String path]) {
    return FireblendDatabaseReferenceWeb._internal(_database.ref(path));
  }
}

class FireblendDatabaseReferenceWeb extends FireblendQueryWeb
    implements FireblendDatabaseReference {
  final fb.DatabaseReference _reference;

  FireblendDatabaseReferenceWeb._internal(this._reference)
      : super._internal(_reference);

  @override
  FireblendDatabaseReference child(String path) {
    return FireblendDatabaseReferenceWeb._internal(_reference.child(path));
  }

  @override
  String get key => _reference.key;

  @override
  FireblendDatabaseReference parent() {
    return FireblendDatabaseReferenceWeb._internal(_reference.parent);
  }

  @override
  FireblendDatabaseReference push([value]) {
    return FireblendDatabaseReferenceWeb._internal(_reference.push(value));
  }

  @override
  Future remove() {
    return _reference.remove();
  }

  @override
  FireblendDatabaseReference root() {
    return FireblendDatabaseReferenceWeb._internal(_reference.root);
  }

  @override
  Future set(value, {priority}) {
    if (priority == null)
      return _reference.set(value);
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

}

class FireblendQueryWeb extends FireblendQuery {
  final fb.Query _query;

  FireblendQueryWeb._internal(this._query);

  @override
  FireblendQuery endAt(value, {String key}) {
    return FireblendQueryWeb._internal(_query.endAt(value, key));
  }

  @override
  FireblendQuery equalTo(value, {String key}) {
    return FireblendQueryWeb._internal(_query.equalTo(value, key));
  }

  @override
  FireblendQuery limitToFirst(int limit) {
    return FireblendQueryWeb._internal(_query.limitToFirst(limit));
  }

  @override
  FireblendQuery limitToLast(int limit) {
    return FireblendQueryWeb._internal(_query.limitToLast(limit));
  }

  @override
  Stream<FireblendEvent> get onChildAdded => _query.onChildAdded
      .map((fb.QueryEvent event) => FireblendEventWeb._internal(event));

  @override
  Stream<FireblendEvent> get onChildChanged => _query.onChildChanged
      .map((fb.QueryEvent event) => FireblendEventWeb._internal(event));

  @override
  Stream<FireblendEvent> get onChildMoved => _query.onChildMoved
      .map((fb.QueryEvent event) => FireblendEventWeb._internal(event));

  @override
  Stream<FireblendEvent> get onChildRemoved => _query.onChildRemoved
      .map((fb.QueryEvent event) => FireblendEventWeb._internal(event));

  @override
  Stream<FireblendEvent> get onValue => _query.onValue
      .map((fb.QueryEvent event) => FireblendEventWeb._internal(event));

  @override
  Future<FireblendDataSnapshot> once() async {
    fb.QueryEvent event = await _query.once("value");
    return FireblendDataSnapshotWeb._internal(event.snapshot);
  }

  @override
  FireblendQuery orderByChild(String key) {
    return FireblendQueryWeb._internal(_query.orderByChild(key));
  }

  @override
  FireblendQuery orderByKey() {
    return FireblendQueryWeb._internal(_query.orderByKey());
  }

  @override
  FireblendQuery orderByPriority() {
    return FireblendQueryWeb._internal(_query.orderByPriority());
  }

  @override
  FireblendQuery orderByValue() {
    return FireblendQueryWeb._internal(_query.orderByValue());
  }

  @override
  FireblendDatabaseReference reference() {
    return FireblendDatabaseReferenceWeb._internal(_query.ref);
  }

  @override
  FireblendQuery startAt(value, {String key}) {
    return FireblendQueryWeb._internal(_query.startAt(value, key));
  }

}

class FireblendEventWeb extends FireblendEvent {
  final fb.QueryEvent _event;

  FireblendEventWeb._internal(this._event);

  @override
  String get previousSiblingKey => _event.prevChildKey;

  @override
  FireblendDataSnapshot get snapshot =>
      FireblendDataSnapshotWeb._internal(_event.snapshot);
}

class FireblendDataSnapshotWeb extends FireblendDataSnapshot {
  final fb.DataSnapshot _snapshot;

  FireblendDataSnapshotWeb._internal(this._snapshot);

  @override
  String get key => _snapshot.key;

  @override
  dynamic get value => _snapshot.val();

}