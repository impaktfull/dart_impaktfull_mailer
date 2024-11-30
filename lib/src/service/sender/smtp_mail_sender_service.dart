import 'package:impaktfull_mailer/impaktfull_mailer.dart';
import 'package:mailer/smtp_server.dart';

abstract class SmtpMailSenderService extends MailSenderService {
  const SmtpMailSenderService();

  SmtpServer get smtpServer;
}
