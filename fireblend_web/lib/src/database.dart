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
    if (priority == null)
      return _reference.set(value);
    else
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
}

class FireblendQueryWeb extends FireblendQuery {
  final fb.Query _query;

  FireblendQueryWeb._internal(this._query);

  @override
  FireblendQueryWeb endAt(value, {String key}) {
    fb.Query query = _query.endAt(value, key);
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb equalTo(value, {String key}) {
    fb.Query query = _query.equalTo(value, key);
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb limitToFirst(int limit) {
    fb.Query query = _query.limitToFirst(limit);
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb limitToLast(int limit) {
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
    fb.Query query = _query.orderByChild(key);
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb orderByKey() {
    fb.Query query = _query.orderByKey();
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb orderByPriority() {
    fb.Query query = _query.orderByPriority();
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  FireblendQueryWeb orderByValue() {
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
    fb.Query query = _query.startAt(value, key);
    return query != null ? FireblendQueryWeb._internal(query) : null;
  }

  @override
  String getPath() {
    String url = _query.toString();
    return url.substring(url.indexOf("/", 8) + 1, url.length);
  }
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
