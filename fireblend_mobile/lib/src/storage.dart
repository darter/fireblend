import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:fireblend_mobile/src/temp/fireblend.dart';

class FireblendStorageMobile extends FireblendStorage {
  FirebaseStorage _storage;

  FireblendStorageMobile(FirebaseApp app)
      : _storage = FirebaseStorage(app: app);

  FireblendStorageMobile._internal(this._storage);

  FirebaseStorage get storage => _storage;

  @override
  Future<int> getMaxOperationRetryTime() {
    return _storage.getMaxOperationRetryTimeMillis();
  }

  @override
  Future<int> getMaxUploadRetryTime() {
    return _storage.getMaxUploadRetryTimeMillis();
  }

  @override
  FireblendStorageReference ref([String path]) {
    StorageReference reference = _storage.ref();
    if (path != null)
      return FireblendStorageReferenceMobile._internal(reference.child(path));
    return FireblendStorageReferenceMobile._internal(reference);
  }

  @override
  Future setMaxOperationRetryTime(int time) {
    return _storage.setMaxOperationRetryTimeMillis(time);
  }

  @override
  Future setMaxUploadRetryTime(int time) {
    return _storage.setMaxUploadRetryTimeMillis(time);
  }
}

class FireblendStorageReferenceMobile extends FireblendStorageReference {
  StorageReference _reference;

  FireblendStorageReferenceMobile._internal(this._reference);

  StorageReference get reference => _reference;

  @override
  FireblendStorageReference child(String path) {
    return FireblendStorageReferenceMobile._internal(_reference.child(path));
  }

  @override
  Future delete() {
    return _reference.delete();
  }

  @override
  Future<String> getBucket() {
    return _reference.getBucket();
  }

  @override
  Future getDownloadURL() {
    return _reference.getDownloadURL();
  }

  @override
  Future<FireblendStorageMetadata> getMetadata() async {
    StorageMetadata metadata = await _reference.getMetadata();
    return FireblendStorageMetadataMobile._internal(metadata);
  }

  @override
  Future<String> getName() {
    return _reference.getName();
  }

  @override
  Future<String> getPath() {
    return _reference.getPath();
  }

  @override
  FireblendStorage getStorage() {
    return FireblendStorageMobile._internal(_reference.getStorage());
  }

  @override
  FireblendStorageReference parent() {
    return FireblendStorageReferenceMobile._internal(_reference.getParent());
  }

  @override
  FireblendUploadTask put(data, [FireblendStorageMetadata metadata]) {
    StorageMetadata aux = (metadata as FireblendStorageMetadataMobile).metadata;
    if (data is File)
      return FireblendUploadTaskMobile._internal(_reference.putFile(data, aux));
    else if (data is Uint8List)
      return FireblendUploadTaskMobile._internal(_reference.putData(data, aux));
    else
      throw UnsupportedError("Data type is not supported.");
  }

  @override
  FireblendStorageReference root() {
    return FireblendStorageReferenceMobile._internal(_reference.getRoot());
  }

  @override
  Future<FireblendStorageMetadata> updateMetadata(
      FireblendStorageMetadata metadata) async {
    StorageMetadata aux = (metadata as FireblendStorageMetadataMobile).metadata;
    StorageMetadata res = await _reference.updateMetadata(aux);
    return FireblendStorageMetadataMobile._internal(res);
  }
}

class FireblendStorageMetadataMobile extends FireblendStorageMetadata {
  StorageMetadata _metadata;

  FireblendStorageMetadataMobile._internal(this._metadata);

  StorageMetadata get metadata => _metadata;

  FireblendStorageMetadataMobile(
      {String cacheControl,
      String contentDisposition,
      String contentEncoding,
      String contentLanguage,
      String contentType,
      Map<String, String> customMetadata})
      : _metadata = StorageMetadata(
          cacheControl: cacheControl,
          contentDisposition: contentDisposition,
          contentEncoding: contentEncoding,
          contentLanguage: contentLanguage,
          contentType: contentType,
          customMetadata: customMetadata,
        );

  @override
  String get bucket => _metadata.bucket;

  @override
  String get cacheControl => _metadata.cacheControl;

  @override
  String get contentDisposition => _metadata.contentDisposition;

  @override
  String get contentEncoding => _metadata.contentEncoding;

  @override
  String get contentLanguage => _metadata.contentLanguage;

  @override
  String get contentType => _metadata.contentType;

  @override
  Map<String, String> get customMetadata => _metadata.customMetadata;

  @override
  String get generation => _metadata.generation;

  @override
  String get md5Hash => _metadata.md5Hash;

  @override
  String get metadataGeneration => _metadata.metadataGeneration;

  @override
  String get name => _metadata.name;

  @override
  String get path => _metadata.path;

  @override
  int get sizeBytes => _metadata.sizeBytes;

  @override
  int get timeCreated => _metadata.creationTimeMillis;

  @override
  int get timeUpdated => _metadata.updatedTimeMillis;
}

class FireblendUploadTaskMobile extends FireblendUploadTask {
  StorageUploadTask _task;

  FireblendUploadTaskMobile._internal(this._task);

  StorageUploadTask get task => _task;

  @override
  void cancel() {
    _task.cancel();
  }

  @override
  Stream<FireblendUploadSnapshot> get onStateChanged =>
      _task.events.map((event) => FireblendUploadSnapshotMobile._event(event));

  @override
  void pause() {
    _task.pause();
  }

  @override
  Future<FireblendUploadSnapshot> result() async {
    StorageTaskSnapshot snapshot = await _task.onComplete;
    return FireblendUploadSnapshotMobile._snapshot(snapshot);
  }

  @override
  void resume() {
    _task.resume();
  }
}

class FireblendUploadSnapshotMobile extends FireblendUploadSnapshot {
  StorageTaskEvent _event;
  StorageTaskSnapshot _snapshot;

  FireblendUploadSnapshotMobile._event(this._event)
      : _snapshot = _event.snapshot;

  FireblendUploadSnapshotMobile._snapshot(this._snapshot);

  StorageTaskEvent get event => _event;

  StorageTaskSnapshot get snapshot => _snapshot;

  @override
  int get bytesTransferred => _snapshot.bytesTransferred;

  @override
  FireblendStorageMetadata get metadata =>
      FireblendStorageMetadataMobile._internal(_snapshot.storageMetadata);

  @override
  FireblendStorageReference get ref =>
      FireblendStorageReferenceMobile._internal(_snapshot.ref);

  @override
  FireblendUploadTaskState get state {
    if (_event == null) return FireblendUploadTaskState.UNKNOWN;
    switch (_event.type) {
      case StorageTaskEventType.resume:
        return FireblendUploadTaskState.RUNNING;
      case StorageTaskEventType.failure:
        return FireblendUploadTaskState.FAILURE;
      case StorageTaskEventType.pause:
        return FireblendUploadTaskState.PAUSED;
      case StorageTaskEventType.progress:
        return FireblendUploadTaskState.RUNNING;
      case StorageTaskEventType.success:
        return FireblendUploadTaskState.SUCCESS;
      default:
        return FireblendUploadTaskState.UNKNOWN;
    }
  }

  @override
  int get totalBytes => _snapshot.totalByteCount;
}
