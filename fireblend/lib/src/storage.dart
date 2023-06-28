import 'dart:async';

abstract class FireblendStorage {
  FireblendStorageReference? ref([String path]);
  FireblendStorageReference? refFromUrl(String url);
  Future<int?> getMaxOperationRetryTime();
  Future<int?> getMaxUploadRetryTime();
  Future? setMaxUploadRetryTime(int time);
  Future? setMaxOperationRetryTime(int time);
}

abstract class FireblendStorageReference {
  FireblendStorage? getStorage();
  Future<String?> getBucket();
  Future<String?> getPath();
  FireblendStorageReference? child(String path);
  FireblendStorageReference? parent();
  FireblendStorageReference? root();
  FireblendUploadTask? put(dynamic data, [FireblendStorageMetadata metadata]);
  Future? delete();
  Future? getDownloadURL();
  String? getName();
  Future<FireblendStorageMetadata?> getMetadata();
  Future<FireblendStorageMetadata?> updateMetadata(
      FireblendStorageMetadata metadata);
}

class FireblendStorageMetadata {
  final String? bucket;
  final String? generation;
  final String? metadataGeneration;
  final String? path;
  final String? name;
  final int? sizeBytes;
  final int? timeCreated;
  final int? timeUpdated;

  final String? md5Hash;
  final String? cacheControl;
  final String? contentDisposition;
  final String? contentEncoding;
  final String? contentLanguage;
  final String? contentType;
  final Map<String, String>? customMetadata;

  FireblendStorageMetadata(
      {this.md5Hash,
      this.cacheControl,
      this.contentDisposition,
      this.contentEncoding,
      this.contentLanguage,
      this.contentType,
      Map<String, String>? customMetadata})
      : bucket = null,
        generation = null,
        metadataGeneration = null,
        path = null,
        name = null,
        sizeBytes = null,
        timeCreated = null,
        timeUpdated = null,
        customMetadata = customMetadata == null
            ? null
            : Map<String, String>.unmodifiable(customMetadata);
}

abstract class FireblendUploadTask {
  Stream<FireblendUploadSnapshot?> get onStateChanged;
  Future<FireblendUploadSnapshot?> result();
  void pause();
  void resume();
  void cancel();
}

abstract class FireblendUploadSnapshot {
  FireblendUploadTaskState? get state;
  FireblendStorageReference? get ref;
  FireblendStorageMetadata? get metadata;
  int? get bytesTransferred;
  int? get totalBytes;
}

enum FireblendUploadTaskState { RUNNING, PAUSED, SUCCESS, FAILURE, UNKNOWN }
