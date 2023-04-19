import 'package:email_for_blind/components/google_auth.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/mailer.dart';
import 'package:http/http.dart' as http;

Future sendmail(String to, String subject, String mailmsg) async {
  final user = await GoogleAuthApi.signIn();
  if (user == null) return;
  final user_email = user.email;
  final auth = await user.authentication;
  final token = auth.accessToken;
  //GoogleAuthApi.signOut()
  final SmtpServer = gmailSaslXoauth2(user_email, token!);
  final message = Message()
    ..from = Address(
      user_email,
    )
    ..recipients = [to]
    ..subject = subject
    ..text = mailmsg;
  try {
    await send(message, SmtpServer);
    print('sucess');
  } on MailerException catch (e) {
    print('Message not sent.');
  }
}



// Future sendmail({
//   required String to_name,
//   required String to_email,
//   required String subject,
//   required String message,
// }) async {
//   final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
//   final response = await http.post(url,
//       headers: {},
//       body: jsonEncode(
//         {
//           'service_id': 'service_iwb04dl',
//           'template_id': 'template_46a5xog',
//           'user_id': 'EzIo5FIZguhayU3Wj',
//           'template_params': {
//             'to_email': 'to_name'
//                 'subject'
//                 'message'
//                 'user_name'
//                 'user_email'
//           }
//         },
//       ));
// }
