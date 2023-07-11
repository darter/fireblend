export 'src/authentication.dart';
export 'src/configuration.dart';
export 'src/database.dart';
export 'src/messaging.dart';
export 'src/storage.dart';

import 'src/authentication.dart';
import 'src/database.dart';
import 'src/messaging.dart';
import 'src/storage.dart';

abstract class Fireblend {
  FireblendAuth get auth;
  FireblendDatabase get database;
  FireblendMessaging get messaging;
  FireblendStorage get storage;
}
