import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthApi {
  static final _googleSingIn =
      GoogleSignIn(scopes: ['https://mail.google.com/']);
  static Future<GoogleSignInAccount?> signIn() async {
    if (await _googleSingIn.isSignedIn()) {
      return _googleSingIn.currentUser;
    } else {
      return await _googleSingIn.signIn();
    }
  }

  static Future signOut() => _googleSingIn.signOut();

  static authenticatedClient() {}
}
