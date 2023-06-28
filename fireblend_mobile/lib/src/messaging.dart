import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:fireblend/fireblend.dart';

class FireblendMessagingMobile extends FireblendMessaging {
  FirebaseMessaging _messaging;
  late StreamController<RemoteMessage> _controller;

  FireblendMessagingMobile() : _messaging = FirebaseMessaging.instance {
    _controller = StreamController();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _controller.add(message);
    });
  }

  FirebaseMessaging get messaging => _messaging;

  @override
  Future<String?> getToken() {
    return _messaging.getToken();
  }

  @override
  Stream<Map<String, dynamic>> get onMessage =>
      _controller.stream.map((event) => event.toMap());

  @override
  Stream<dynamic> get onTokenRefresh => _messaging.onTokenRefresh;
}
