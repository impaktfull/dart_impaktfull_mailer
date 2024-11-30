import 'package:impaktfull_mailer/src/service/sender/mail_sender_service.dart';
import 'package:mailer/smtp_server.dart';

abstract class SmtpMailSenderService extends MailSenderService {
  const SmtpMailSenderService();

  SmtpServer get smtpServer;
}
