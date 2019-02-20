import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:fireblend/fireblend.dart';

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
  FireblendStorageReferenceMobile ref([String path]) {
    StorageReference reference = _storage.ref();
    if (reference == null) return null;
    if (path != null) {
      StorageReference aux = reference.child(path);
      return aux != null
          ? FireblendStorageReferenceMobile._internal(aux)
          : null;
    }
    return FireblendStorageReferenceMobile._internal(reference);
  }

  @override
  FireblendStorageReferenceMobile refFromUrl(String url) {
    int startIndex = url.indexOf("/o/") + 3;
    int endIndex = url.indexOf("?");
    String trimmed = url.substring(startIndex, endIndex);
    String filename = trimmed.replaceAll("%3A", ":").replaceAll("%2F", "/");
    StorageReference reference = _storage.ref().child(filename);
    return reference != null
        ? FireblendStorageReferenceMobile._internal(reference)
        : null;
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
  FireblendStorageReferenceMobile child(String path) {
    StorageReference reference = _reference.child(path);
    return reference != null
        ? FireblendStorageReferenceMobile._internal(reference)
        : null;
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
  Future<FireblendStorageMetadataMobile> getMetadata() async {
    StorageMetadata metadata = await _reference.getMetadata();
    return metadata != null
        ? FireblendStorageMetadataMobile._internal(metadata)
        : null;
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
  FireblendStorageMobile getStorage() {
    FirebaseStorage storage = _reference.getStorage();
    return storage != null ? FireblendStorageMobile._internal(storage) : null;
  }

  @override
  FireblendStorageReferenceMobile parent() {
    StorageReference reference = _reference.getParent();
    return reference != null
        ? FireblendStorageReferenceMobile._internal(reference)
        : null;
  }

  @override
  FireblendUploadTaskMobile put(data, [FireblendStorageMetadata metadata]) {
    StorageMetadata aux = StorageMetadata(
      cacheControl: metadata?.cacheControl,
      contentDisposition: metadata?.contentDisposition,
      contentEncoding: metadata?.contentEncoding,
      contentLanguage: metadata?.contentLanguage,
      contentType: metadata?.contentType,
      customMetadata: metadata?.customMetadata,
    );
    if (!(data is File || data is List<int>))
      throw UnsupportedError("Data type is not supported.");
    StorageUploadTask task = _reference.putFile(data, aux);
    return task != null ? FireblendUploadTaskMobile._internal(task) : null;
  }

  @override
  FireblendStorageReferenceMobile root() {
    StorageReference reference = _reference.getRoot();
    return reference != null
        ? FireblendStorageReferenceMobile._internal(reference)
        : null;
  }

  @override
  Future<FireblendStorageMetadataMobile> updateMetadata(
      FireblendStorageMetadata metadata) async {
    StorageMetadata aux = StorageMetadata(
      cacheControl: metadata?.cacheControl,
      contentDisposition: metadata?.contentDisposition,
      contentEncoding: metadata?.contentEncoding,
      contentLanguage: metadata?.contentLanguage,
      contentType: metadata?.contentType,
      customMetadata: metadata?.customMetadata,
    );
    StorageMetadata res = await _reference.updateMetadata(aux);
    return res != null ? FireblendStorageMetadataMobile._internal(res) : null;
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
        ),
        super(
            md5Hash: null,
            cacheControl: cacheControl,
            contentDisposition: contentDisposition,
            contentEncoding: contentEncoding,
            contentLanguage: contentLanguage,
            contentType: contentType,
            customMetadata: customMetadata);

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
  Stream<FireblendUploadSnapshotMobile> get onStateChanged =>
      _task.events?.map((event) =>
          event != null ? FireblendUploadSnapshotMobile._event(event) : null);

  @override
  void pause() {
    _task.pause();
  }

  @override
  Future<FireblendUploadSnapshotMobile> result() async {
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
  FireblendStorageMetadataMobile get metadata =>
      _snapshot.storageMetadata != null
          ? FireblendStorageMetadataMobile._internal(_snapshot.storageMetadata)
          : null;

  @override
  FireblendStorageReferenceMobile get ref => _snapshot.ref != null
      ? FireblendStorageReferenceMobile._internal(_snapshot.ref)
      : null;

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
