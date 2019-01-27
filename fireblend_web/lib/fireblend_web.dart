library fireblend_web;

export 'src/authentication.dart';
export 'src/database.dart';
export 'src/messaging.dart';
export 'src/storage.dart';

import 'package:firebase/firebase.dart' as fb;
import 'package:fireblend/fireblend.dart';

import 'src/authentication.dart';
import 'src/database.dart';
import 'src/messaging.dart';
import 'src/storage.dart';

class FireblendWeb extends Fireblend{
  fb.App _app;

  FireblendWeb._internal(this._app);

  fb.App get app => _app;

  static Future<FireblendWeb> initialize([FireblendConfiguration config]) async {
    fb.App app;
    try {
      app = fb.app(config.projectId);
    } catch (e) {
      app = fb.initializeApp(
          apiKey: config.apiKey,
          authDomain: config.authDomain,
          databaseURL: config.databaseUrl,
          projectId: config.projectId,
          storageBucket: config.storageBucket,
          messagingSenderId: config.messageSenderId,
          name: config.projectId
      );
    }
    return FireblendWeb._internal(app);
  }

  @override
  FireblendAuth get auth => FireblendAuthWeb(_app);

  @override
  FireblendDatabase get database => FireblendDatabaseWeb(_app);

  @override
  FireblendMessaging get messaging => FireblendMessagingWeb(_app);

  @override
  FireblendStorage get storage => FireblendStorageWeb(_app);
}