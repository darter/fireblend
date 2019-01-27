import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fireblend/fireblend.dart';

class FireblendAuthMobile extends FireblendAuth {
  FirebaseAuth _auth;

  FireblendAuthMobile(FirebaseApp app) : _auth = FirebaseAuth.fromApp(app);

  FirebaseAuth get auth => _auth;

  @override
  Future<FireblendUser> createUserWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<FireblendUser> currentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<List<String>> fetchProvidersForEmail(String email) {
    return _auth.fetchProvidersForEmail(email: email);
  }

  @override
  Future<FireblendUser> linkWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user =
        await _auth.linkWithEmailAndPassword(email: email, password: password);
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<FireblendUser> linkWithFacebookCredential(String accessToken) async {
    FirebaseUser user =
        await _auth.linkWithFacebookCredential(accessToken: accessToken);
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<FireblendUser> linkWithGithubCredential(String token) async {
    FirebaseUser user = await _auth.linkWithGithubCredential(token: token);
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<FireblendUser> linkWithGoogleCredential(
      String idToken, String accessToken) async {
    FirebaseUser user = await _auth.linkWithGoogleCredential(
        idToken: idToken, accessToken: accessToken);
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<FireblendUser> linkWithTwitterCredential(
      String authToken, String authTokenSecret) async {
    FirebaseUser user = await _auth.linkWithTwitterCredential(
        authToken: authToken, authTokenSecret: authTokenSecret);
    return FireblendUserMobile._internal(user);
  }

  @override
  Stream<FireblendUser> get onAuthStateChanged => _auth.onAuthStateChanged
      .map((user) => FireblendUserMobile._internal(user));

  @override
  Future reauthenticateWithEmailAndPassword(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future reauthenticateWithFacebookCredential(String accessToken) {
    return _auth.reauthenticateWithFacebookCredential(accessToken: accessToken);
  }

  @override
  Future reauthenticateWithGithubCredential(String token) {
    return _auth.reauthenticateWithGithubCredential(token: token);
  }

  @override
  Future reauthenticateWithGoogleCredential(
      String idToken, String accessToken) {
    return _auth.reauthenticateWithGoogleCredential(
        idToken: idToken, accessToken: accessToken);
  }

  @override
  Future reauthenticateWithTwitterCredential(
      String authToken, String authTokenSecret) {
    return _auth.reauthenticateWithTwitterCredential(
        authToken: authToken, authTokenSecret: authTokenSecret);
  }

  @override
  Future sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future setLanguageCode(String language) {
    return _auth.setLanguageCode(language);
  }

  @override
  Future<FireblendUser> signInAnonymously() async {
    FirebaseUser user = await _auth.signInAnonymously();
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<FireblendUser> signInWithCustomToken(String token) async {
    FirebaseUser user = await _auth.signInWithCustomToken(token: token);
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<FireblendUser> signInWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<FireblendUser> signInWithFacebook(String accessToken) async {
    FirebaseUser user =
        await _auth.signInWithFacebook(accessToken: accessToken);
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<FireblendUser> signInWithGithub(String token) async {
    FirebaseUser user = await _auth.signInWithGithub(token: token);
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<FireblendUser> signInWithGoogle(
      String idToken, String accessToken) async {
    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: idToken, accessToken: accessToken);
    return FireblendUserMobile._internal(user);
  }

  @override
  Future<FireblendUser> signInWithTwitter(
      String authToken, String authTokenSecret) async {
    FirebaseUser user = await _auth.signInWithTwitter(
        authToken: authToken, authTokenSecret: authTokenSecret);
    return FireblendUserMobile._internal(user);
  }

  @override
  Future signOut() {
    return _auth.signOut();
  }
}

class FireblendUserMobile extends FireblendUserInfoMobile
    implements FireblendUser {
  FirebaseUser _user;

  FireblendUserMobile._internal(this._user) : super._internal(_user);

  @override
  Future delete() {
    return _user.delete();
  }

  @override
  Future<String> getIdToken({bool refresh = false}) {
    return _user.getIdToken(refresh: refresh);
  }

  @override
  bool get isAnonymous => _user.isAnonymous;

  @override
  bool get isEmailVerified => _user.isEmailVerified;

  @override
  FireblendUserMetadata get metadata =>
      FireblendUserMetadataMobile._internal(_user.metadata);

  @override
  List<FireblendUserInfo> get providerData => _user.providerData
      .map((info) => FireblendUserInfoMobile._internal(info))
      .toList();

  @override
  Future reload() {
    return _user.reload();
  }

  @override
  Future sendEmailVerification() {
    return _user.sendEmailVerification();
  }

  @override
  Future updateEmail(String email) {
    return _user.updateEmail(email);
  }

  @override
  Future updatePassword(String password) {
    return _user.updatePassword(password);
  }

  @override
  Future updateProfile(FireblendUserProfile userProfile) {
    UserUpdateInfo userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = userProfile.displayName;
    userUpdateInfo.photoUrl = userProfile.photoUrl;
    return _user.updateProfile(userUpdateInfo);
  }
}

class FireblendUserInfoMobile extends FireblendUserInfo {
  UserInfo _info;

  FireblendUserInfoMobile._internal(this._info);

  @override
  String get displayName => _info.displayName;

  @override
  String get email => _info.email;

  @override
  String get phoneNumber => _info.phoneNumber;

  @override
  String get photoUrl => _info.photoUrl;

  @override
  String get providerId => _info.providerId;

  @override
  String get uid => _info.uid;
}

class FireblendUserMetadataMobile extends FireblendUserMetadata {
  FirebaseUserMetadata _metadata;

  FireblendUserMetadataMobile._internal(this._metadata);

  @override
  int get creationTimestamp => _metadata.creationTimestamp;

  @override
  int get lastSignInTimestamp => _metadata.lastSignInTimestamp;
}
