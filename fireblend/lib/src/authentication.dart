import 'dart:async';

abstract class FireblendAuth {
  Future signOut();
  Future<FireblendUser?> currentUser();
  Stream<FireblendUser?> get onAuthStateChanged;
  Future setLanguageCode(String language);
  Future<FireblendUser?> signInAnonymously();
  Future<FireblendUser?> createUserWithEmailAndPassword(
      String email, String password);
  Future<List<String>?> fetchSignInMethodsForEmail(String email);
  Future sendPasswordResetEmail(String email);
  Future<FireblendUser?> signInWithEmailAndPassword(
      String email, String password);
  Future<FireblendUser?> signInWithFacebook(String accessToken);
  Future<FireblendUser?> signInWithTwitter(
      String authToken, String authTokenSecret);
  Future<FireblendUser?> signInWithGithub(String token);
  Future<FireblendUser?> signInWithGoogle(String idToken, String accessToken);
  Future<FireblendUser?> signInWithCustomToken(String token);
  // TODO: Implement methods involving phone numbers.
}

abstract class FireblendUser extends FireblendUserInfo {
  FireblendUserMetadata? get metadata;
  List<FireblendUserInfo?>? get providerData;
  bool? get isAnonymous;
  bool? get isEmailVerified;
  Future<String?> getIdToken({bool refresh = false});
  Future sendEmailVerification();
  Future reload();
  Future delete();
  Future updateEmail(String email);
  Future updatePassword(String password);
  Future updateProfile(FireblendUserProfile userProfile);
  Future<FireblendUser?> linkWithEmailAndPassword(
      String email, String password);
  Future<FireblendUser?> linkWithGoogleCredential(
      String idToken, String accessToken);
  Future<FireblendUser?> linkWithFacebookCredential(String accessToken);
  Future<FireblendUser?> linkWithTwitterCredential(
      String authToken, String authTokenSecret);
  Future<FireblendUser?> linkWithGithubCredential(String token);
  Future reauthenticateWithEmailAndPassword(String email, String password);
  Future reauthenticateWithGoogleCredential(String idToken, String accessToken);
  Future reauthenticateWithFacebookCredential(String accessToken);
  Future reauthenticateWithTwitterCredential(
      String authToken, String authTokenSecret);
  Future reauthenticateWithGithubCredential(String token);
}

abstract class FireblendUserInfo {
  String? get providerId;
  String? get uid;
  String? get displayName;
  String? get photoUrl;
  String? get email;
  String? get phoneNumber;
}

abstract class FireblendUserMetadata {
  int? get creationTimestamp;
  int? get lastSignInTimestamp;
}

class FireblendUserProfile {
  String? displayName, photoUrl;
  FireblendUserProfile({this.displayName, this.photoUrl});
}
