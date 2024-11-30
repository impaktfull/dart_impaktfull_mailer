import 'package:impaktfull_mailer/src/service/sender/smtp_mail_sender_service.dart';
import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class BrevoMailSenderService extends SmtpMailSenderService {
  final String email;
  final String password;
  SmtpServer? _smtpServer;

  BrevoMailSenderService({
    required this.email,
    required this.password,
  });

  @override
  SmtpServer get smtpServer => _smtpServer ??= SmtpServer(
        'smtp-relay.brevo.com',
        port: 587,
        username: email,
        password: password,
      );

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
    final message = Message()
      ..from = Address(fromEmail, fromName)
      ..recipients.addAll(to)
      ..ccRecipients.addAll(cc)
      ..bccRecipients.addAll(bcc)
      ..subject = subject
      ..text = text
      ..html = html;
    await mailer.send(message, smtpServer);
  }
}
