abstract class FireblendMessaging {
  Stream<Map<String, dynamic>> get onMessage;
  Stream<dynamic> get onTokenRefresh;
  Future<String> getToken();
}