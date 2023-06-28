import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:fireblend/fireblend.dart';

class FireblendStorageMobile extends FireblendStorage {
  FirebaseStorage? _storage;

  FireblendStorageMobile(FirebaseApp app)
      : _storage = FirebaseStorage.instanceFor(app: app);

  FireblendStorageMobile._internal(this._storage);

  FirebaseStorage? get storage => _storage;

  @override
  Future<int?> getMaxOperationRetryTime() async {
    return _storage?.maxOperationRetryTime.inMilliseconds;
  }

  @override
  Future<int?> getMaxUploadRetryTime() async {
    return _storage?.maxUploadRetryTime.inMilliseconds;
  }

  @override
  FireblendStorageReferenceMobile? ref([String? path]) {
    Reference? reference = _storage?.ref();
    if (path != null) {
      Reference? aux = reference?.child(path);
      return aux != null
          ? FireblendStorageReferenceMobile._internal(aux)
          : null;
    }
    return reference != null
        ? FireblendStorageReferenceMobile._internal(reference)
        : null;
  }

  @override
  FireblendStorageReferenceMobile? refFromUrl(String url) {
    int startIndex = url.indexOf('/o/') + 3;
    int endIndex = url.indexOf('?');
    String trimmed = url.substring(startIndex, endIndex);
    String filename = trimmed.replaceAll('%3A', ':').replaceAll('%2F', '/');
    Reference? reference = _storage?.ref().child(filename);
    return reference != null
        ? FireblendStorageReferenceMobile._internal(reference)
        : null;
  }

  @override
  Future? setMaxOperationRetryTime(int time) async {
    return _storage?.setMaxUploadRetryTime(Duration(milliseconds: time));
  }

  @override
  Future? setMaxUploadRetryTime(int time) async {
    return _storage?.setMaxUploadRetryTime(Duration(milliseconds: time));
  }
}

class FireblendStorageReferenceMobile extends FireblendStorageReference {
  Reference? _reference;

  FireblendStorageReferenceMobile._internal(this._reference);

  Reference? get reference => _reference;

  @override
  FireblendStorageReferenceMobile? child(String path) {
    Reference? reference = _reference?.child(path);
    return reference != null
        ? FireblendStorageReferenceMobile._internal(reference)
        : null;
  }

  @override
  Future? delete() {
    return _reference?.delete();
  }

  @override
  Future<String?> getBucket() async {
    return _reference?.bucket;
  }

  @override
  Future? getDownloadURL() {
    return _reference?.getDownloadURL();
  }

  @override
  Future<FireblendStorageMetadataMobile?> getMetadata() async {
    FullMetadata? metadata = await _reference?.getMetadata();
    return metadata != null
        ? FireblendStorageMetadataMobile._internal(metadata)
        : null;
  }

  @override
  Future<String?> getName() async {
    return _reference?.name;
  }

  @override
  Future<String?> getPath() async {
    return _reference?.fullPath;
  }

  @override
  FireblendStorageMobile? getStorage() {
    FirebaseStorage? storage = _reference?.storage;
    return FireblendStorageMobile._internal(storage);
  }

  @override
  FireblendStorageReferenceMobile? parent() {
    Reference? reference = _reference?.parent;
    return FireblendStorageReferenceMobile._internal(reference);
  }

  @override
  FireblendUploadTaskMobile? put(data, [FireblendStorageMetadata? metadata]) {
    SettableMetadata aux = SettableMetadata(
      cacheControl: metadata?.cacheControl,
      contentDisposition: metadata?.contentDisposition,
      contentEncoding: metadata?.contentEncoding,
      contentLanguage: metadata?.contentLanguage,
      contentType: metadata?.contentType,
      customMetadata: metadata?.customMetadata,
    );
    UploadTask? task;
    if (data is File)
      task = _reference?.putFile(data, aux);
    else if (data is Uint8List)
      task = _reference?.putData(data, aux);
    else
      throw UnsupportedError('Data type is not supported.');
    return task != null ? FireblendUploadTaskMobile._internal(task) : null;
  }

  @override
  FireblendStorageReferenceMobile? root() {
    Reference? reference = _reference?.root;
    return reference != null
        ? FireblendStorageReferenceMobile._internal(reference)
        : null;
  }

  @override
  Future<FireblendStorageMetadataMobile?> updateMetadata(
      FireblendStorageMetadata metadata,) async {
    SettableMetadata aux = SettableMetadata(
      cacheControl: metadata.cacheControl,
      contentDisposition: metadata.contentDisposition,
      contentEncoding: metadata.contentEncoding,
      contentLanguage: metadata.contentLanguage,
      contentType: metadata.contentType,
      customMetadata: metadata.customMetadata,
    );
    FullMetadata? res = await _reference?.updateMetadata(aux);
    return res != null ? FireblendStorageMetadataMobile._internal(res) : null;
  }
}

class FireblendStorageMetadataMobile extends FireblendStorageMetadata {
  FullMetadata? _metadata;

  FireblendStorageMetadataMobile._internal(this._metadata);

  FullMetadata? get metadata => _metadata;

  FireblendStorageMetadataMobile(
      {String? cacheControl,
      String? contentDisposition,
      String? contentEncoding,
      String? contentLanguage,
      String? contentType,
      Map<String, String>? customMetadata,})
      : _metadata = FullMetadata({
          'cacheControl': cacheControl,
          'contentDisposition': contentDisposition,
          'contentEncoding': contentEncoding,
          'contentLanguage': contentLanguage,
          'contentType': contentType,
          'customMetadata': customMetadata,
        }),
        super(
            md5Hash: null,
            cacheControl: cacheControl,
            contentDisposition: contentDisposition,
            contentEncoding: contentEncoding,
            contentLanguage: contentLanguage,
            contentType: contentType,
            customMetadata: customMetadata,);

  @override
  String? get bucket => _metadata?.bucket;

  @override
  String? get cacheControl => _metadata?.cacheControl;

  @override
  String? get contentDisposition => _metadata?.contentDisposition;

  @override
  String? get contentEncoding => _metadata?.contentEncoding;

  @override
  String? get contentLanguage => _metadata?.contentLanguage;

  @override
  String? get contentType => _metadata?.contentType;

  @override
  Map<String, String>? get customMetadata => _metadata?.customMetadata;

  @override
  String? get generation => _metadata?.generation;

  @override
  String? get md5Hash => _metadata?.md5Hash;

  @override
  String? get metadataGeneration => _metadata?.metadataGeneration;

  @override
  String? get name => _metadata?.name;

  @override
  String? get path => _metadata?.fullPath;

  @override
  int? get sizeBytes => _metadata?.size;

  @override
  int? get timeCreated => _metadata?.timeCreated?.millisecondsSinceEpoch;

  @override
  int? get timeUpdated => _metadata?.updated?.millisecondsSinceEpoch;
}

class FireblendUploadTaskMobile extends FireblendUploadTask {
  UploadTask _task;

  FireblendUploadTaskMobile._internal(this._task);

  UploadTask get task => _task;

  @override
  void cancel() {
    _task.cancel();
  }

  @override
  Stream<FireblendUploadSnapshotMobile?> get onStateChanged =>
      _task.snapshotEvents
          .map((event) => FireblendUploadSnapshotMobile._event(event));

  @override
  void pause() {
    _task.pause();
  }

  @override
  Future<FireblendUploadSnapshotMobile> result() async {
    TaskSnapshot snapshot = await _task.whenComplete(() => _task.snapshot);
    return FireblendUploadSnapshotMobile._snapshot(snapshot);
  }

  @override
  void resume() {
    _task.resume();
  }
}

class FireblendUploadSnapshotMobile extends FireblendUploadSnapshot {
  TaskSnapshot? _event;
  TaskSnapshot? _snapshot;

  FireblendUploadSnapshotMobile._event(this._event) : _snapshot = _event;

  FireblendUploadSnapshotMobile._snapshot(this._snapshot);

  TaskSnapshot? get event => _event;

  TaskSnapshot? get snapshot => _snapshot;

  @override
  int? get bytesTransferred => _snapshot?.bytesTransferred;

  @override
  FireblendStorageMetadataMobile? get metadata => _snapshot?.metadata != null
      ? FireblendStorageMetadataMobile._internal(_snapshot?.metadata)
      : null;

  @override
  FireblendStorageReferenceMobile? get ref => _snapshot?.ref != null
      ? FireblendStorageReferenceMobile._internal(_snapshot!.ref)
      : null;

  @override
  FireblendUploadTaskState get state {
    if (_event == null) return FireblendUploadTaskState.UNKNOWN;
    switch (_event?.state) {
      case TaskState.running:
        return FireblendUploadTaskState.RUNNING;
      case TaskState.error:
        return FireblendUploadTaskState.FAILURE;
      case TaskState.paused:
        return FireblendUploadTaskState.PAUSED;
      case TaskState.success:
        return FireblendUploadTaskState.SUCCESS;
      default:
        return FireblendUploadTaskState.UNKNOWN;
    }
  }

  @override
  int? get totalBytes => _snapshot?.bytesTransferred;
}
