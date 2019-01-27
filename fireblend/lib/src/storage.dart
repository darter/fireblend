abstract class FireblendStorage {
  FireblendStorageReference ref([String path]);
  Future<int> getMaxOperationRetryTime();
  Future<int> getMaxUploadRetryTime();
  Future setMaxUploadRetryTime(int time);
  Future setMaxOperationRetryTime(int time);
}

abstract class FireblendStorageReference {
  FireblendStorage getStorage();
  Future<String> getBucket();
  Future<String> getPath();
  FireblendStorageReference child(String path);
  FireblendStorageReference parent();
  FireblendStorageReference root();
  FireblendUploadTask put(dynamic data, [FireblendStorageMetadata metadata]);
  Future delete();
  Future getDownloadURL();
  Future<String> getName();
  Future<FireblendStorageMetadata> getMetadata();
  Future<FireblendStorageMetadata> updateMetadata(FireblendStorageMetadata metadata);
}

abstract class FireblendStorageMetadata {
  String get bucket;
  String get generation;
  String get metadataGeneration;
  String get path;
  String get name;
  int get sizeBytes;
  int get timeCreated;
  int get timeUpdated;
  String get md5Hash;

  String get cacheControl;
  String get contentDisposition;
  String get contentEncoding;
  String get contentLanguage;
  String get contentType;
  Map<String, String> get customMetadata;
}

abstract class FireblendUploadTask {
  Stream<FireblendUploadSnapshot> get onStateChanged;
  Future<FireblendUploadSnapshot> result();
  void pause();
  void resume();
  void cancel();
}

abstract class FireblendUploadSnapshot {
  FireblendUploadTaskState get state;
  FireblendStorageReference get ref;
  FireblendStorageMetadata get metadata;
  int get bytesTransferred;
  int get totalBytes;
}

enum FireblendUploadTaskState { RUNNING, PAUSED, SUCCESS, FAILURE, UNKNOWN }