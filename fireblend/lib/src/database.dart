abstract class FireblendDatabase {
  FireblendDatabaseReference ref([String path]);
  Future goOnline();
  Future goOffline();
}

abstract class FireblendDatabaseReference extends FireblendQuery {
  FireblendDatabaseReference child(String path);
  FireblendDatabaseReference parent();
  FireblendDatabaseReference root();
  FireblendDatabaseReference push([value]);
  Future set(value, {dynamic priority});
  Future remove();
  Future update(Map<String, dynamic> value);
  Future setPriority(priority);
  String get key;
}

abstract class FireblendQuery {
  Stream<FireblendEvent> get onChildAdded;
  Stream<FireblendEvent> get onChildRemoved;
  Stream<FireblendEvent> get onChildChanged;
  Stream<FireblendEvent> get onChildMoved;
  Stream<FireblendEvent> get onValue;
  FireblendDatabaseReference reference();
  Future<FireblendDataSnapshot> once();
  FireblendQuery startAt(dynamic value, {String key});
  FireblendQuery endAt(dynamic value, {String key});
  FireblendQuery equalTo(dynamic value, {String key});
  FireblendQuery limitToFirst(int limit);
  FireblendQuery limitToLast(int limit);
  FireblendQuery orderByChild(String key);
  FireblendQuery orderByKey();
  FireblendQuery orderByValue();
  FireblendQuery orderByPriority();
  Map<String, dynamic> getParameters();
  String getPath();
}

abstract class FireblendEvent {
  FireblendDataSnapshot get snapshot;
  String get previousSiblingKey;
}

abstract class FireblendDataSnapshot {
  String get key;
  dynamic get value;
}