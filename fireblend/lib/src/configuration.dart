class FireblendConfiguration {
  final String apiKey;
  final String authDomain;
  final String databaseUrl;
  final String storageBucket;
  final String projectId;
  final String iosGoogleAppId;
  final String androidGoogleAppId;
  final String measurementId;
  final String messageSenderId;
  final String bundleId;
  final String appId;

  FireblendConfiguration({
    this.apiKey,
    this.authDomain,
    this.databaseUrl,
    this.storageBucket,
    this.projectId,
    this.iosGoogleAppId,
    this.androidGoogleAppId,
    this.measurementId,
    this.messageSenderId,
    this.bundleId,
    this.appId,
  });

  factory FireblendConfiguration.fromJson(json) => new FireblendConfiguration(
      apiKey: json['apiKey'] as String,
      authDomain: json['authDomain'] as String,
      databaseUrl: json['databaseUrl'] as String,
      storageBucket: json['storageBucket'] as String,
      projectId: json['projectId'] as String,
      androidGoogleAppId: json['androidGoogleAppId'] as String,
      iosGoogleAppId: json['iosGoogleAppId'] as String,
      measurementId: json['measurementId'] as String,
      messageSenderId: json['messageSenderId'] as String,
      bundleId: json['bundleId'] as String,
      appId: json['appId'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'apiKey': apiKey,
    'authDomain': authDomain,
    'databaseUrl': databaseUrl,
    'storageBucket': storageBucket,
    'projectId': projectId,
    'iosGoogleAppId': iosGoogleAppId,
    'androidGoogleAppId': androidGoogleAppId,
    'measurementId': measurementId,
    'messageSenderId': messageSenderId,
    'bundleId': bundleId,
    'appId': appId,
  };
}