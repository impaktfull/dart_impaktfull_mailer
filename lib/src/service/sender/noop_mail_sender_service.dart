import 'dart:convert';

import 'package:impaktfull_mailer/src/service/sender/mail_sender_service.dart';

class NoopMailSenderService extends MailSenderService {
  final void Function(NoopMailSenderServiceCallbackData)? callback;

  NoopMailSenderService({
    required this.callback,
  });

  @override
  Future<void> send({
    required String fromEmail,
    required List<String> to,
    required String subject,
    List<String> cc = const [],
    List<String> bcc = const [],
    String? fromName,
    String? text,
    String? html,
    String? locale,
  }) async {
    final callbackData = NoopMailSenderServiceCallbackData(
      fromEmail: fromEmail,
      to: to,
      cc: cc,
      bcc: bcc,
      subject: subject,
      text: text,
      html: html,
    );
    if (callback == null) {
      final jsonData = callbackData.toJson();
      final jsonString = jsonEncode(jsonData);
      print(jsonString);
    } else {
      callback!(callbackData);
    }
  }
}

class NoopMailSenderServiceCallbackData {
  final String fromEmail;
  final List<String> to;
  final List<String> cc;
  final List<String> bcc;
  final String subject;
  final String? text;
  final String? html;

  const NoopMailSenderServiceCallbackData({
    required this.fromEmail,
    required this.to,
    required this.cc,
    required this.bcc,
    required this.subject,
    required this.text,
    required this.html,
  });

  Map<String, dynamic> toJson() => {
        'fromEmail': fromEmail,
        'to': to,
        'cc': cc,
        'bcc': bcc,
        'subject': subject,
        'text': text,
        'html': html,
      };
}
