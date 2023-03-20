import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

import 'google_auth.dart';

final _googleSingIn =
      GoogleSignIn(scopes: ['https://mail.google.com/']);
final authHeaders = await _googleSingIn.currentUser!.authHeaders;
final credentials = AccessCredentials(
  AccessToken(
    'Bearer',
    authHeaders['Authorization']!.split(' ')[1],
    DateTime.now().add(Duration(hours: 1)),
  ),
  null
);

final gmail = GmailApi(credentials.accessToken.data);
