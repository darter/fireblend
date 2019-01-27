import 'package:firebase/firebase.dart' as fb;

import 'package:fireblend_web/src/temp/fireblend.dart';

class FireblendAuthWeb extends FireblendAuth {
  fb.Auth _auth;

  FireblendAuthWeb(fb.App app) : _auth = fb.auth(app);

  fb.Auth get auth => _auth;

  @override
  Future<FireblendUser> createUserWithEmailAndPassword(
      String email, String password) async {
    fb.UserCredential credential =
        await _auth.createUserWithEmailAndPassword(email, password);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future<FireblendUser> currentUser() async {
    return FireblendUserWeb._internal(_auth.currentUser);
  }

  @override
  Future<List<String>> fetchProvidersForEmail(String email) {
    return _auth.fetchProvidersForEmail(email);
  }

  @override
  Future<FireblendUser> linkWithEmailAndPassword(
      String email, String password) async {
    fb.AuthCredential auth = fb.EmailAuthProvider.credential(email, password);
    fb.UserCredential credential =
        await _auth.currentUser.linkAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future<FireblendUser> linkWithFacebookCredential(String accessToken) async {
    fb.AuthCredential auth = fb.FacebookAuthProvider.credential(accessToken);
    fb.UserCredential credential =
        await _auth.currentUser.linkAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future<FireblendUser> linkWithGithubCredential(String token) async {
    fb.AuthCredential auth = fb.GithubAuthProvider.credential(token);
    fb.UserCredential credential =
        await _auth.currentUser.linkAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future<FireblendUser> linkWithGoogleCredential(
      String idToken, String accessToken) async {
    fb.AuthCredential auth =
        fb.GoogleAuthProvider.credential(idToken, accessToken);
    fb.UserCredential credential =
        await _auth.currentUser.linkAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future<FireblendUser> linkWithTwitterCredential(
      String authToken, String authTokenSecret) async {
    fb.AuthCredential auth =
        fb.TwitterAuthProvider.credential(authTokenSecret, authTokenSecret);
    fb.UserCredential credential =
        await _auth.currentUser.linkAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Stream<FireblendUser> get onAuthStateChanged =>
      _auth.onAuthStateChanged.map((user) => FireblendUserWeb._internal(user));

  @override
  Future reauthenticateWithEmailAndPassword(
      String email, String password) async {
    fb.AuthCredential auth = fb.EmailAuthProvider.credential(email, password);
    fb.UserCredential credential = await _auth.currentUser
        .reauthenticateAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future reauthenticateWithFacebookCredential(String accessToken) async {
    fb.AuthCredential auth = fb.FacebookAuthProvider.credential(accessToken);
    fb.UserCredential credential = await _auth.currentUser
        .reauthenticateAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future reauthenticateWithGithubCredential(String token) async {
    fb.AuthCredential auth = fb.GithubAuthProvider.credential(token);
    fb.UserCredential credential = await _auth.currentUser
        .reauthenticateAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future reauthenticateWithGoogleCredential(
      String idToken, String accessToken) async {
    fb.AuthCredential auth =
        fb.GoogleAuthProvider.credential(idToken, accessToken);
    fb.UserCredential credential = await _auth.currentUser
        .reauthenticateAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future reauthenticateWithTwitterCredential(
      String authToken, String authTokenSecret) async {
    fb.AuthCredential auth =
        fb.TwitterAuthProvider.credential(authToken, authTokenSecret);
    fb.UserCredential credential = await _auth.currentUser
        .reauthenticateAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email);
  }

  @override
  Future setLanguageCode(String language) async {
    _auth.languageCode = language;
  }

  @override
  Future<FireblendUser> signInAnonymously() async {
    fb.UserCredential credential = await _auth.signInAnonymously();
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future<FireblendUser> signInWithCustomToken(String token) async {
    fb.UserCredential credential = await _auth.signInWithCustomToken(token);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future<FireblendUser> signInWithEmailAndPassword(
      String email, String password) async {
    fb.UserCredential credential =
        await _auth.signInWithEmailAndPassword(email, password);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future<FireblendUser> signInWithFacebook(String accessToken) async {
    fb.AuthCredential auth = fb.FacebookAuthProvider.credential(accessToken);
    fb.UserCredential credential =
        await _auth.signInAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future<FireblendUser> signInWithGithub(String token) async {
    fb.AuthCredential auth = fb.GithubAuthProvider.credential(token);
    fb.UserCredential credential =
        await _auth.signInAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future<FireblendUser> signInWithGoogle(
      String idToken, String accessToken) async {
    fb.AuthCredential auth =
        fb.GoogleAuthProvider.credential(idToken, accessToken);
    fb.UserCredential credential =
        await _auth.signInAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future<FireblendUser> signInWithTwitter(
      String authToken, String authTokenSecret) async {
    fb.AuthCredential auth =
        fb.TwitterAuthProvider.credential(authToken, authTokenSecret);
    fb.UserCredential credential =
        await _auth.signInAndRetrieveDataWithCredential(auth);
    return FireblendUserWeb._internal(credential.user);
  }

  @override
  Future signOut() {
    return _auth.signOut();
  }
}

class FireblendUserWeb extends FireblendUserInfoWeb implements FireblendUser {
  fb.User _user;

  FireblendUserWeb._internal(this._user) : super._internal(_user);

  @override
  Future delete() {
    return _user.delete();
  }

  @override
  Future<String> getIdToken({bool refresh = false}) {
    return _user.getIdToken(refresh);
  }

  @override
  bool get isAnonymous => _user.isAnonymous;

  @override
  bool get isEmailVerified => _user.emailVerified;

  @override
  FireblendUserMetadata get metadata =>
      FireblendUserMetadataWeb._internal(_user.metadata);

  @override
  List<FireblendUserInfo> get providerData => _user.providerData
      .map((info) => FireblendUserInfoWeb._internal(info))
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
    fb.UserProfile profile = fb.UserProfile();
    profile.displayName = userProfile.displayName;
    profile.photoURL = userProfile.photoUrl;
    return _user.updateProfile(profile);
  }
}

class FireblendUserInfoWeb extends FireblendUserInfo {
  fb.UserInfo _info;

  FireblendUserInfoWeb._internal(this._info);

  @override
  String get displayName => _info.displayName;

  @override
  String get email => _info.email;

  @override
  String get phoneNumber => _info.phoneNumber;

  @override
  String get photoUrl => _info.photoURL;

  @override
  String get providerId => _info.providerId;

  @override
  String get uid => _info.uid;
}

class FireblendUserMetadataWeb extends FireblendUserMetadata {
  fb.UserMetadata _metadata;

  FireblendUserMetadataWeb._internal(this._metadata);

  @override
  int get creationTimestamp =>
      DateTime.parse(_metadata.creationTime).millisecondsSinceEpoch;

  @override
  int get lastSignInTimestamp =>
      DateTime.parse(_metadata.lastSignInTime).millisecondsSinceEpoch;
}
