export 'src/authentication.dart';
export 'src/database.dart';
export 'src/messaging.dart';
export 'src/storage.dart';

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:fireblend/fireblend.dart';

import 'package:fireblend_mobile/src/authentication.dart';
import 'package:fireblend_mobile/src/database.dart';
import 'package:fireblend_mobile/src/messaging.dart';
import 'package:fireblend_mobile/src/storage.dart';

class FireblendMobile extends Fireblend {
  FirebaseApp _app;

  FireblendMobile._internal(this._app);

  FirebaseApp get app => _app;

  static Future<FireblendMobile> initialize([
    FireblendConfiguration? config,
  ]) async {
    await Firebase.initializeApp();
    FirebaseApp app = config == null
        ? Firebase.app()
        : await Firebase.initializeApp(name: config.projectId);
    return FireblendMobile._internal(app);
  }

  @override
  FireblendAuthMobile get auth => FireblendAuthMobile(_app);

  @override
  FireblendDatabaseMobile get database => FireblendDatabaseMobile(_app);

  @override
  FireblendMessagingMobile get messaging => FireblendMessagingMobile();

  @override
  FireblendStorageMobile get storage => FireblendStorageMobile(_app);
}
