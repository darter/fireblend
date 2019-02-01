import 'package:firebase/firebase.dart' as fb;

import 'package:fireblend/fireblend.dart';

class FireblendStorageWeb extends FireblendStorage {
  fb.Storage _storage;

  FireblendStorageWeb(fb.App app) : _storage = fb.storage(app);

  FireblendStorageWeb._internal(this._storage);

  fb.Storage get storage => _storage;

  @override
  Future<int> getMaxOperationRetryTime() async {
    return _storage.maxOperationRetryTime;
  }

  @override
  Future<int> getMaxUploadRetryTime() async {
    return _storage.maxUploadRetryTime;
  }

  @override
  FireblendStorageReferenceWeb ref([String path]) {
    fb.StorageReference reference = _storage.ref(path);
    return reference != null
        ? FireblendStorageReferenceWeb._internal(reference)
        : null;
  }

  @override
  FireblendStorageReferenceWeb refFromUrl(String url) {
    fb.StorageReference reference = _storage.refFromURL(url);
    return reference != null
        ? FireblendStorageReferenceWeb._internal(reference)
        : null;
  }

  @override
  Future setMaxOperationRetryTime(int time) async {
    return _storage.setMaxOperationRetryTime(time);
  }

  @override
  Future setMaxUploadRetryTime(int time) async {
    return _storage.setMaxUploadRetryTime(time);
  }
}

class FireblendStorageReferenceWeb extends FireblendStorageReference {
  fb.StorageReference _reference;

  FireblendStorageReferenceWeb._internal(this._reference);

  fb.StorageReference get reference => _reference;

  @override
  FireblendStorageReferenceWeb child(String path) {
    fb.StorageReference reference = _reference.child(path);
    return reference != null
        ? FireblendStorageReferenceWeb._internal(reference)
        : null;
  }

  @override
  Future delete() {
    return _reference.delete();
  }

  @override
  Future<String> getBucket() async {
    return _reference.bucket;
  }

  @override
  Future getDownloadURL() {
    return _reference.getDownloadURL();
  }

  @override
  Future<FireblendStorageMetadataWeb> getMetadata() async {
    fb.FullMetadata metadata = await _reference.getMetadata();
    return metadata != null
        ? FireblendStorageMetadataWeb._full(metadata)
        : null;
  }

  @override
  Future<String> getName() async {
    return _reference.name;
  }

  @override
  Future<String> getPath() async {
    return _reference.fullPath;
  }

  @override
  FireblendStorageWeb getStorage() {
    fb.Storage storage = _reference.storage;
    return storage != null ? FireblendStorageWeb._internal(storage) : null;
  }

  @override
  FireblendStorageReferenceWeb parent() {
    fb.StorageReference reference = _reference.parent;
    return reference != null
        ? FireblendStorageReferenceWeb._internal(reference)
        : null;
  }

  @override
  FireblendUploadTaskWeb put(data, [FireblendStorageMetadata metadata]) {
    fb.UploadMetadata aux = fb.UploadMetadata(
        md5Hash: metadata.md5Hash,
        cacheControl: metadata.cacheControl,
        contentDisposition: metadata.contentDisposition,
        contentEncoding: metadata.contentEncoding,
        contentLanguage: metadata.contentLanguage,
        contentType: metadata.contentType,
        customMetadata: metadata.customMetadata,
    );
    fb.UploadTask task = _reference.put(data, aux);
    return task != null ? FireblendUploadTaskWeb._internal(task) : null;
  }

  @override
  FireblendStorageReferenceWeb root() {
    fb.StorageReference reference = _reference.root;
    return reference != null
        ? FireblendStorageReferenceWeb._internal(reference)
        : null;
  }

  @override
  Future<FireblendStorageMetadataWeb> updateMetadata(
      FireblendStorageMetadata metadata) async {
    fb.SettableMetadata aux = fb.SettableMetadata(
        cacheControl: metadata.cacheControl,
        contentDisposition: metadata.contentDisposition,
        contentEncoding: metadata.contentEncoding,
        contentLanguage: metadata.contentLanguage,
        contentType: metadata.contentType,
        customMetadata: metadata.customMetadata,
    );
    fb.FullMetadata res = await _reference.updateMetadata(aux);
    return res != null ? FireblendStorageMetadataWeb._full(res) : null;
  }
}

class FireblendStorageMetadataWeb extends FireblendStorageMetadata {
  fb.FullMetadata _fullMetadata;
  fb.UploadMetadata _uploadMetadata;
  fb.SettableMetadata _settableMetadata;

  FireblendStorageMetadataWeb._full(this._fullMetadata);

  FireblendStorageMetadataWeb._upload(this._uploadMetadata);

  FireblendStorageMetadataWeb._settable(this._settableMetadata);

  FireblendStorageMetadataWeb(
      {String md5Hash,
      String cacheControl,
      String contentDisposition,
      String contentEncoding,
      String contentLanguage,
      String contentType,
      Map<String, String> customMetadata})
      : _uploadMetadata = fb.UploadMetadata(
          md5Hash: md5Hash,
          cacheControl: cacheControl,
          contentDisposition: contentDisposition,
          contentEncoding: contentEncoding,
          contentLanguage: contentLanguage,
          contentType: contentType,
          customMetadata: customMetadata,
        ),
        _settableMetadata = fb.SettableMetadata(
          cacheControl: cacheControl,
          contentDisposition: contentDisposition,
          contentEncoding: contentEncoding,
          contentLanguage: contentLanguage,
          contentType: contentType,
          customMetadata: customMetadata,
        ),
        super(
            md5Hash: md5Hash,
            cacheControl: cacheControl,
            contentDisposition: contentDisposition,
            contentEncoding: contentEncoding,
            contentLanguage: contentLanguage,
            contentType: contentType,
            customMetadata: customMetadata);

  fb.FullMetadata get fullMetadata => _fullMetadata;

  fb.UploadMetadata get uploadMetadata => _uploadMetadata;

  fb.SettableMetadata get settableMetadata => _settableMetadata;

  @override
  String get bucket => _fullMetadata != null ? _fullMetadata.bucket : null;

  @override
  String get cacheControl => _fullMetadata != null
      ? _fullMetadata.cacheControl
      : _uploadMetadata != null
          ? _uploadMetadata.cacheControl
          : _settableMetadata != null ? _settableMetadata.cacheControl : null;

  @override
  String get contentDisposition => _fullMetadata != null
      ? _fullMetadata.contentDisposition
      : _uploadMetadata != null
          ? _uploadMetadata.contentDisposition
          : _settableMetadata != null
              ? _settableMetadata.contentDisposition
              : null;

  @override
  String get contentEncoding => _fullMetadata != null
      ? _fullMetadata.contentEncoding
      : _uploadMetadata != null
          ? _uploadMetadata.contentEncoding
          : _settableMetadata != null
              ? _settableMetadata.contentEncoding
              : null;

  @override
  String get contentLanguage => _fullMetadata != null
      ? _fullMetadata.contentLanguage
      : _uploadMetadata != null
          ? _uploadMetadata.contentLanguage
          : _settableMetadata != null
              ? _settableMetadata.contentLanguage
              : null;

  @override
  String get contentType => _fullMetadata != null
      ? _fullMetadata.contentType
      : _uploadMetadata != null
          ? _uploadMetadata.contentType
          : _settableMetadata != null ? _settableMetadata.contentType : null;

  @override
  Map<String, String> get customMetadata => _fullMetadata != null
      ? _fullMetadata.customMetadata
      : _uploadMetadata != null
          ? _uploadMetadata.customMetadata
          : _settableMetadata != null ? _settableMetadata.customMetadata : null;

  @override
  String get generation =>
      _fullMetadata != null ? _fullMetadata.generation : null;

  @override
  String get md5Hash => _fullMetadata != null
      ? _fullMetadata.md5Hash
      : _uploadMetadata != null ? _uploadMetadata.md5Hash : null;

  @override
  String get metadataGeneration =>
      _fullMetadata != null ? _fullMetadata.metageneration : null;

  @override
  String get name => _fullMetadata != null ? _fullMetadata.name : null;

  @override
  String get path => _fullMetadata != null ? _fullMetadata.fullPath : null;

  @override
  int get sizeBytes => _fullMetadata != null ? _fullMetadata.size : null;

  @override
  int get timeCreated => _fullMetadata != null
      ? _fullMetadata.timeCreated.millisecondsSinceEpoch
      : null;

  @override
  int get timeUpdated => _fullMetadata != null
      ? _fullMetadata.updated.millisecondsSinceEpoch
      : null;
}

class FireblendUploadTaskWeb extends FireblendUploadTask {
  fb.UploadTask _task;

  FireblendUploadTaskWeb._internal(this._task);

  fb.UploadTask get task => _task;

  @override
  void cancel() {
    _task.cancel();
  }

  @override
  Stream<FireblendUploadSnapshotWeb> get onStateChanged =>
      _task.onStateChanged?.map((snapshot) => snapshot != null
          ? FireblendUploadSnapshotWeb._internal(snapshot)
          : null);

  @override
  void pause() {
    _task.pause();
  }

  @override
  Future<FireblendUploadSnapshotWeb> result() async {
    fb.UploadTaskSnapshot snapshot = await _task.future;
    return snapshot != null
        ? FireblendUploadSnapshotWeb._internal(snapshot)
        : null;
  }

  @override
  void resume() {
    _task.resume();
  }
}

class FireblendUploadSnapshotWeb extends FireblendUploadSnapshot {
  fb.UploadTaskSnapshot _snapshot;

  FireblendUploadSnapshotWeb._internal(this._snapshot);

  fb.UploadTaskSnapshot get snapshot => _snapshot;

  @override
  int get bytesTransferred => _snapshot.bytesTransferred;

  @override
  FireblendStorageMetadataWeb get metadata => _snapshot.metadata != null
      ? FireblendStorageMetadataWeb._full(_snapshot.metadata)
      : null;

  @override
  FireblendStorageReferenceWeb get ref => _snapshot.ref != null
      ? FireblendStorageReferenceWeb._internal(_snapshot.ref)
      : null;

  @override
  FireblendUploadTaskState get state {
    switch (_snapshot.state) {
      case fb.TaskState.RUNNING:
        return FireblendUploadTaskState.RUNNING;
      case fb.TaskState.CANCELED:
        return FireblendUploadTaskState.FAILURE;
      case fb.TaskState.ERROR:
        return FireblendUploadTaskState.FAILURE;
      case fb.TaskState.PAUSED:
        return FireblendUploadTaskState.PAUSED;
      case fb.TaskState.SUCCESS:
        return FireblendUploadTaskState.SUCCESS;
      default:
        return FireblendUploadTaskState.UNKNOWN;
    }
  }

  @override
  int get totalBytes => _snapshot.totalBytes;
}
