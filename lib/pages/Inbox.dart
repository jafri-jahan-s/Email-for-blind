import 'package:flutter/material.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:googleapis/gmail/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class Inbox extends StatelessWidget {
  const Inbox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Inbox"),
    ));
  }
}

// Future<void> fetchInboxMessages() async {
//   const String url = 'https://gmail.googleapis.com/gmail/v1/users/me/messages';
//   final response = await http.get(Uri.parse(url));
//   final List<dynamic> messages = jsonDecode(response.body)['messages'];
//   for (final message in messages) {
//     final messageId = message['id'];
//     final messageUrl =
//         'https://gmail.googleapis.com/gmail/v1/users/me/messages/$messageId';
//     final messageResponse = await http.get(Uri.parse(messageUrl));
//     final messageJson = jsonDecode(messageResponse.body);
//     print('From: ${messageJson['payload']['headers'][17]['value']}');
//     print('Subject: ${messageJson['payload']['headers'][19]['value']}');
//     print('Snippet: ${messageJson['snippet']}');
//   }
// }

// final _credentials = new ServiceAccountCredentials.fromJson(
//     r'''
// {
//   "private_key_id": ...,
//   "private_key": ...,
//   "client_email": ...,
//   "client_id": ...,
//   "type": "service_account"
// }
// ''');

// final _scopes = [GmailApi.gmailReadonlyScope];
// fetch() async {
//   final _client = await clientViaServiceAccount(_credentials, _scopes);
//   final _gmail = new GmailApi(_client);

//   final ListThreadsResponse threads =
//       await _gmail.users.threads.list('me', maxResults: 10);

//   print('Threads:');
//   threads.threads?.forEach((Thread t) => print('${t.id} - ${t.snippet}'));
// }
