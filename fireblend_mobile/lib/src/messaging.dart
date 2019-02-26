import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:fireblend/fireblend.dart';

class FireblendMessagingMobile extends FireblendMessaging {
  FirebaseMessaging _messaging;
  StreamController<Map<String, dynamic>> _controller;

  FireblendMessagingMobile() : _messaging = FirebaseMessaging() {
    _controller = StreamController();
    _messaging.configure(
      onMessage: (Map<String, dynamic> content) async {
        _controller.add(content);
      },
      onLaunch: (Map<String, dynamic> content) async {
        _controller.add(content);
      },
      onResume: (Map<String, dynamic> content) async {
        _controller.add(content);
      },
    );
  }

  FirebaseMessaging get messaging => _messaging;

  @override
  Future<String> getToken() {
    return _messaging.getToken();
  }

  @override
  Stream<Map<String, dynamic>> get onMessage => _controller.stream;

  @override
  Stream<dynamic> get onTokenRefresh => _messaging.onTokenRefresh;
}
