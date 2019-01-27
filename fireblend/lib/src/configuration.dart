class FireblendConfiguration {
  final String apiKey;
  final String authDomain;
  final String databaseUrl;
  final String storageBucket;
  final String projectId;
  final String iosGoogleAppId;
  final String androidGoogleAppId;
  final String messageSenderId;
  final String bundleId;

  FireblendConfiguration({
    this.apiKey,
    this.authDomain,
    this.databaseUrl,
    this.storageBucket,
    this.projectId,
    this.androidGoogleAppId,
    this.iosGoogleAppId,
    this.messageSenderId,
    this.bundleId,
  });

  factory FireblendConfiguration.fromJson(json) => new FireblendConfiguration(
      apiKey: json['apiKey'] as String,
      authDomain: json['authDomain'] as String,
      databaseUrl: json['databaseUrl'] as String,
      storageBucket: json['storageBucket'] as String,
      projectId: json['projectId'] as String,
      androidGoogleAppId: json['androidGoogleAppId'] as String,
      iosGoogleAppId: json['iosGoogleAppId'] as String,
      messageSenderId: json['messageSenderId'] as String,
      bundleId: json['bundleId'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'apiKey': apiKey,
    'authDomain': authDomain,
    'databaseUrl': databaseUrl,
    'storageBucket': storageBucket,
    'projectId': projectId,
    'iosGoogleAppId': iosGoogleAppId,
    'androidGoogleAppId': androidGoogleAppId,
    'messageSenderId': messageSenderId,
    'bundleId': bundleId,
  };
}