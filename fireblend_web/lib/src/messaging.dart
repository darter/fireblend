import 'package:firebase/firebase.dart' as fb;

import 'package:fireblend_web/src/temp/fireblend.dart';

class FireblendMessagingWeb extends FireblendMessaging {
  fb.Messaging _messaging;

  FireblendMessagingWeb(fb.App app) : _messaging = fb.messaging(app);

  fb.Messaging get messaging => _messaging;

  @override
  Future<String> getToken() {
    return _messaging.getToken();
  }

  @override
  Stream<Map<String, dynamic>> get onMessage =>
      _messaging.onMessage.map((payload) => payload.data);

  @override
  Stream get onTokenRefresh => _messaging.onTokenRefresh;
}