import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fireblend/fireblend.dart';

class FireblendAuthMobile extends FireblendAuth {
  FirebaseAuth _auth;

  FireblendAuthMobile(FirebaseApp app) : _auth = FirebaseAuth.fromApp(app);

  FirebaseAuth get auth => _auth;

  @override
  Future<FireblendUserMobile> createUserWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile> currentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<List<String>> fetchProvidersForEmail(String email) {
    return _auth.fetchSignInMethodsForEmail(email: email);
  }

  @override
  Future<FireblendUserMobile> linkWithEmailAndPassword(
      String email, String password) async {
    AuthCredential credential = EmailAuthProvider
        .getCredential(email: email, password: password);
    FirebaseUser user = await _auth.linkWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile> linkWithFacebookCredential(
      String accessToken) async {
    AuthCredential credential = FacebookAuthProvider
        .getCredential(accessToken: accessToken);
    FirebaseUser user = await _auth.linkWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile> linkWithGithubCredential(String token) async {
    AuthCredential credential = GithubAuthProvider.getCredential(token: token);
    FirebaseUser user = await _auth.linkWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile> linkWithGoogleCredential(
      String idToken, String accessToken) async {
    AuthCredential credential = GoogleAuthProvider
        .getCredential(idToken: idToken, accessToken: accessToken);
    FirebaseUser user = await _auth.linkWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile> linkWithTwitterCredential(
      String authToken, String authTokenSecret) async {
    AuthCredential credential = TwitterAuthProvider
        .getCredential(authToken: authToken, authTokenSecret: authTokenSecret);
    FirebaseUser user = await _auth.linkWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Stream<FireblendUserMobile> get onAuthStateChanged =>
      _auth.onAuthStateChanged?.map(
          (user) => user != null ? FireblendUserMobile._internal(user) : null);

  @override
  Future reauthenticateWithEmailAndPassword(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future reauthenticateWithFacebookCredential(String accessToken) async {
    FirebaseUser user = await _auth.currentUser();
    AuthCredential credential = FacebookAuthProvider
        .getCredential(accessToken: accessToken);
    user.reauthenticateWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future reauthenticateWithGithubCredential(String token) async {
    FirebaseUser user = await _auth.currentUser();
    AuthCredential credential = GithubAuthProvider.getCredential(token: token);
    user.reauthenticateWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future reauthenticateWithGoogleCredential(
      String idToken, String accessToken) async {
    FirebaseUser user = await _auth.currentUser();
    AuthCredential credential = GoogleAuthProvider
        .getCredential(idToken: idToken, accessToken: accessToken);
    user.reauthenticateWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future reauthenticateWithTwitterCredential(
      String authToken, String authTokenSecret) async {
    FirebaseUser user = await _auth.currentUser();
    AuthCredential credential = TwitterAuthProvider
        .getCredential(authToken: authToken, authTokenSecret: authTokenSecret);
    user.reauthenticateWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
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
  Future<FireblendUserMobile> signInAnonymously() async {
    FirebaseUser user = await _auth.signInAnonymously();
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile> signInWithCustomToken(String token) async {
    FirebaseUser user = await _auth.signInWithCustomToken(token: token);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile> signInWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile> signInWithFacebook(String accessToken) async {
    AuthCredential credential = FacebookAuthProvider
        .getCredential(accessToken: accessToken);
    FirebaseUser user = await _auth.signInWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile> signInWithGithub(String token) async {
    AuthCredential credential = GithubAuthProvider.getCredential(token: token);
    FirebaseUser user = await _auth.signInWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile> signInWithGoogle(
      String idToken, String accessToken) async {
    AuthCredential credential = GoogleAuthProvider
        .getCredential(idToken: idToken, accessToken: accessToken);
    FirebaseUser user = await _auth.signInWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile> signInWithTwitter(
      String authToken, String authTokenSecret) async {
    AuthCredential credential = TwitterAuthProvider
        .getCredential(authToken: authToken, authTokenSecret: authTokenSecret);
    FirebaseUser user = await _auth.signInWithCredential(credential);
    return user != null ? FireblendUserMobile._internal(user) : null;
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
  FireblendUserMetadataMobile get metadata => _user.metadata != null
      ? FireblendUserMetadataMobile._internal(_user.metadata)
      : null;

  @override
  List<FireblendUserInfoMobile> get providerData => _user.providerData
      ?.map((info) =>
          info != null ? FireblendUserInfoMobile._internal(info) : null)
      ?.toList();

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
