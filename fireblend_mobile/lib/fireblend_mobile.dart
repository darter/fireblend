library fireblend_mobile;

export 'src/authentication.dart';
export 'src/database.dart';
export 'src/messaging.dart';
export 'src/storage.dart';

import 'dart:io' show Platform;
import 'package:firebase_core/firebase_core.dart';
import 'package:fireblend/fireblend.dart';

import 'src/authentication.dart';
import 'src/database.dart';
import 'src/messaging.dart';
import 'src/storage.dart';

class FireblendMobile extends Fireblend{
  FirebaseApp _app;

  FireblendMobile._internal(this._app);

  static Future<FireblendMobile> initialize([FireblendConfiguration config]) async {
    FirebaseApp app = config == null ? FirebaseApp.instance
        : FirebaseApp.appNamed(config.projectId);
    if (app == null) {
      var googleApiKey = Platform.isAndroid
          ? config.androidGoogleAppId
          : config.iosGoogleAppId;
      app = await FirebaseApp.configure(
        name: config.projectId,
        options: new FirebaseOptions(
          googleAppID: googleApiKey,
          gcmSenderID: config.messageSenderId,
          projectID: config.projectId,
          databaseURL: config.databaseUrl,
          storageBucket: config.storageBucket,
          apiKey: config.apiKey,
          bundleID: config.bundleId,
        ),
      );
    }
    return FireblendMobile._internal(app);
  }

  @override
  FireblendAuth get auth => FireblendAuthMobile(_app);

  @override
  FireblendDatabase get database => FireblendDatabaseMobile(_app);

  @override
  FireblendMessaging get messaging => FireblendMessagingMobile();

  @override
  FireblendStorage get storage => FireblendStorageMobile(_app);
}