import 'dart:async';

import 'package:firebase/firebase.dart' as fb;

import 'package:fireblend/fireblend.dart';

class FireblendAuthWeb extends FireblendAuth {
  fb.Auth _auth;

  FireblendAuthWeb(fb.App app) : _auth = fb.auth(app);

  fb.Auth get auth => _auth;

  @override
  Future<FireblendUserWeb> createUserWithEmailAndPassword(String email, String password) async {
    fb.UserCredential credential = await _auth.createUserWithEmailAndPassword(email, password);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future<FireblendUserWeb> currentUser() async {
    fb.User user = _auth.currentUser;
    return user != null ? FireblendUserWeb._internal(user) : null;
  }

  @override
  Future<List<String>> fetchSignInMethodsForEmail(String email) => _auth.fetchSignInMethodsForEmail(email);

  @override
  Stream<FireblendUserWeb> get onAuthStateChanged => _auth.onAuthStateChanged
      ?.map((user) => user != null ? FireblendUserWeb._internal(user) : null);

  @override
  Future sendPasswordResetEmail(String email) => _auth.sendPasswordResetEmail(email);

  @override
  Future setLanguageCode(String language) async => _auth.languageCode = language;

  @override
  Future<FireblendUserWeb> signInAnonymously() async {
    fb.UserCredential credential = await _auth.signInAnonymously();
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future<FireblendUserWeb> signInWithCustomToken(String token) async {
    fb.UserCredential credential = await _auth.signInWithCustomToken(token);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future<FireblendUserWeb> signInWithEmailAndPassword(String email, String password) async {
    fb.UserCredential credential = await _auth.signInWithEmailAndPassword(email, password);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future<FireblendUserWeb> signInWithFacebook(String accessToken) async {
    fb.OAuthCredential auth = fb.FacebookAuthProvider.credential(accessToken);
    fb.UserCredential credential = await _auth.signInWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future<FireblendUserWeb> signInWithGithub(String token) async {
    fb.OAuthCredential auth = fb.GithubAuthProvider.credential(token);
    fb.UserCredential credential = await _auth.signInWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future<FireblendUserWeb> signInWithGoogle(String idToken, String accessToken) async {
    fb.OAuthCredential auth = fb.GoogleAuthProvider.credential(idToken, accessToken);
    fb.UserCredential credential = await _auth.signInWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future<FireblendUserWeb> signInWithTwitter(String authToken, String authTokenSecret) async {
    fb.OAuthCredential auth = fb.TwitterAuthProvider.credential(authToken, authTokenSecret);
    fb.UserCredential credential = await _auth.signInWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future signOut() => _auth.signOut();
}

class FireblendUserWeb extends FireblendUserInfoWeb implements FireblendUser {
  fb.User _user;

  FireblendUserWeb._internal(this._user) : super._internal(_user);

  @override
  Future delete() => _user.delete();

  @override
  Future<String> getIdToken({bool refresh = false}) => _user.getIdToken(refresh);

  @override
  bool get isAnonymous => _user.isAnonymous;

  @override
  bool get isEmailVerified => _user.emailVerified;

  @override
  FireblendUserMetadataWeb get metadata => _user.metadata != null
      ? FireblendUserMetadataWeb._internal(_user.metadata) : null;

  @override
  List<FireblendUserInfoWeb> get providerData => _user?.providerData
      ?.map((info) => info != null ? FireblendUserInfoWeb
      ._internal(info) : null)?.toList();

  @override
  Future reload() => _user.reload();

  @override
  Future sendEmailVerification() => _user.sendEmailVerification();

  @override
  Future updateEmail(String email) => _user.updateEmail(email);

  @override
  Future updatePassword(String password) => _user.updatePassword(password);

  @override
  Future updateProfile(FireblendUserProfile userProfile) {
    fb.UserProfile profile = fb.UserProfile();
    profile.displayName = userProfile.displayName;
    profile.photoURL = userProfile.photoUrl;
    return _user.updateProfile(profile);
  }

  @override
  Future<FireblendUserWeb> linkWithEmailAndPassword(String email, String password) async {
    fb.OAuthCredential auth = fb.EmailAuthProvider.credential(email, password);
    fb.UserCredential credential = await _user.linkWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future<FireblendUserWeb> linkWithFacebookCredential(String accessToken) async {
    fb.OAuthCredential auth = fb.FacebookAuthProvider.credential(accessToken);
    fb.UserCredential credential = await _user.linkWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future<FireblendUserWeb> linkWithGithubCredential(String token) async {
    fb.OAuthCredential auth = fb.GithubAuthProvider.credential(token);
    fb.UserCredential credential = await _user.linkWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future<FireblendUserWeb> linkWithGoogleCredential(String idToken, String accessToken) async {
    fb.OAuthCredential auth = fb.GoogleAuthProvider.credential(idToken, accessToken);
    fb.UserCredential credential = await _user.linkWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future<FireblendUserWeb> linkWithTwitterCredential(String authToken, String authTokenSecret) async {
    fb.OAuthCredential auth = fb.TwitterAuthProvider.credential(authTokenSecret, authTokenSecret);
    fb.UserCredential credential = await _user.linkWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future reauthenticateWithEmailAndPassword(String email, String password) async {
    fb.OAuthCredential auth = fb.EmailAuthProvider.credential(email, password);
    fb.UserCredential credential = await _user.reauthenticateWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future reauthenticateWithFacebookCredential(String accessToken) async {
    fb.OAuthCredential auth = fb.FacebookAuthProvider.credential(accessToken);
    fb.UserCredential credential = await _user.reauthenticateWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future reauthenticateWithGithubCredential(String token) async {
    fb.OAuthCredential auth = fb.GithubAuthProvider.credential(token);
    fb.UserCredential credential = await _user.reauthenticateWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future reauthenticateWithGoogleCredential(String idToken, String accessToken) async {
    fb.OAuthCredential auth = fb.GoogleAuthProvider.credential(idToken, accessToken);
    fb.UserCredential credential = await _user.reauthenticateWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
  }

  @override
  Future reauthenticateWithTwitterCredential(String authToken, String authTokenSecret) async {
    fb.OAuthCredential auth = fb.TwitterAuthProvider.credential(authToken, authTokenSecret);
    fb.UserCredential credential = await _user.reauthenticateWithCredential(auth);
    return credential?.user != null ? FireblendUserWeb._internal(credential.user) : null;
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
  int get creationTimestamp => DateTime.parse(_metadata.creationTime).millisecondsSinceEpoch;

  @override
  int get lastSignInTimestamp => DateTime.parse(_metadata.lastSignInTime).millisecondsSinceEpoch;
}
