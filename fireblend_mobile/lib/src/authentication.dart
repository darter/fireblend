import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fireblend/fireblend.dart';

class FireblendAuthMobile extends FireblendAuth {
  FirebaseAuth _auth;

  FireblendAuthMobile(FirebaseApp app)
      : _auth = FirebaseAuth.instanceFor(app: app);

  FirebaseAuth get auth => _auth;

  @override
  Future<FireblendUserMobile?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    User? user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile?> currentUser() async {
    User? user = _auth.currentUser;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<List<String>?> fetchSignInMethodsForEmail(String email) =>
      _auth.fetchSignInMethodsForEmail(email);

  @override
  Stream<FireblendUserMobile?> get onAuthStateChanged => _auth
      .authStateChanges()
      .map((user) => user != null ? FireblendUserMobile._internal(user) : null);

  @override
  Future sendPasswordResetEmail(String email) =>
      _auth.sendPasswordResetEmail(email: email);

  @override
  Future setLanguageCode(String language) => _auth.setLanguageCode(language);

  @override
  Future<FireblendUserMobile?> signInAnonymously() async {
    User? user = (await _auth.signInAnonymously()).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile?> signInWithCustomToken(String token) async {
    User? user = (await _auth.signInWithCustomToken(token)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    User? user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile?> signInWithFacebook(String accessToken) async {
    AuthCredential credential = FacebookAuthProvider.credential(accessToken);
    User? user = (await _auth.signInWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile?> signInWithGithub(String token) async {
    AuthCredential credential = GithubAuthProvider.credential(token);
    User? user = (await _auth.signInWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile?> signInWithGoogle(
    String idToken,
    String accessToken,
  ) async {
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: idToken,
      accessToken: accessToken,
    );
    User? user = (await _auth.signInWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile?> signInWithTwitter(
    String authToken,
    String authTokenSecret,
  ) async {
    AuthCredential credential = TwitterAuthProvider.credential(
      accessToken: authToken,
      secret: authTokenSecret,
    );
    User? user = (await _auth.signInWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future signOut() => _auth.signOut();
}

class FireblendUserMobile extends FireblendUserInfoMobile
    implements FireblendUser {
  User _user;

  FireblendUserMobile._internal(this._user)
      : super._internal(_user.providerData.first);

  @override
  Future delete() => _user.delete();

  @override
  Future<String?> getIdToken({bool refresh = false}) async {
    return (await _user.getIdTokenResult(refresh)).token;
  }

  @override
  bool get isAnonymous => _user.isAnonymous;

  @override
  bool get isEmailVerified => _user.emailVerified;

  @override
  FireblendUserMetadataMobile? get metadata =>
      FireblendUserMetadataMobile._internal(_user.metadata);

  @override
  List<FireblendUserInfoMobile?>? get providerData => _user.providerData
      .map((info) => FireblendUserInfoMobile._internal(info))
      .toList();

  @override
  Future reload() => _user.reload();

  @override
  Future sendEmailVerification() => _user.sendEmailVerification();

  @override
  Future updateEmail(String email) => _user.updateEmail(email);

  @override
  Future updatePassword(String password) => _user.updatePassword(password);

  @override
  Future updateProfile(FireblendUserProfile userProfile) async {
    await _user.updateDisplayName(userProfile.displayName);
    await _user.updatePhotoURL(userProfile.photoUrl);
    return _user;
  }

  @override
  Future<FireblendUserMobile?> linkWithEmailAndPassword(
    String email,
    String password,
  ) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    User? user = (await _user.linkWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile?> linkWithFacebookCredential(
    String accessToken,
  ) async {
    AuthCredential credential = FacebookAuthProvider.credential(accessToken);
    User? user = (await _user.linkWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile?> linkWithGithubCredential(String token) async {
    AuthCredential credential = GithubAuthProvider.credential(token);
    User? user = (await _user.linkWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile?> linkWithGoogleCredential(
    String idToken,
    String accessToken,
  ) async {
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: idToken,
      accessToken: accessToken,
    );
    User? user = (await _user.linkWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future<FireblendUserMobile?> linkWithTwitterCredential(
    String authToken,
    String authTokenSecret,
  ) async {
    AuthCredential credential = TwitterAuthProvider.credential(
      accessToken: authToken,
      secret: authTokenSecret,
    );
    User? user = (await _user.linkWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future reauthenticateWithEmailAndPassword(
    String email,
    String password,
  ) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    User? user = (await _user.reauthenticateWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future reauthenticateWithFacebookCredential(String accessToken) async {
    AuthCredential credential = FacebookAuthProvider.credential(accessToken);
    User? user = (await _user.reauthenticateWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future reauthenticateWithGithubCredential(String token) async {
    AuthCredential credential = GithubAuthProvider.credential(token);
    User? user = (await _user.reauthenticateWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future reauthenticateWithGoogleCredential(
    String idToken,
    String accessToken,
  ) async {
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: idToken,
      accessToken: accessToken,
    );
    User? user = (await _user.reauthenticateWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }

  @override
  Future reauthenticateWithTwitterCredential(
    String authToken,
    String authTokenSecret,
  ) async {
    AuthCredential credential = TwitterAuthProvider.credential(
      accessToken: authToken,
      secret: authTokenSecret,
    );
    User? user = (await _user.reauthenticateWithCredential(credential)).user;
    return user != null ? FireblendUserMobile._internal(user) : null;
  }
}

class FireblendUserInfoMobile extends FireblendUserInfo {
  UserInfo _info;

  FireblendUserInfoMobile._internal(this._info);

  @override
  String? get displayName => _info.displayName;

  @override
  String? get email => _info.email;

  @override
  String? get phoneNumber => _info.phoneNumber;

  @override
  String? get photoUrl => _info.photoURL;

  @override
  String? get providerId => _info.providerId;

  @override
  String? get uid => _info.uid;
}

class FireblendUserMetadataMobile extends FireblendUserMetadata {
  UserMetadata _metadata;

  FireblendUserMetadataMobile._internal(this._metadata);

  @override
  int? get creationTimestamp => _metadata.creationTime?.millisecondsSinceEpoch;

  @override
  int? get lastSignInTimestamp =>
      _metadata.lastSignInTime?.millisecondsSinceEpoch;
}
