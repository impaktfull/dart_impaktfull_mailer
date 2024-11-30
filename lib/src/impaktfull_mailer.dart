import 'package:impaktfull_mailer/src/service/sender/mail_sender_service.dart';
import 'package:impaktfull_mailer/src/templates/mail_template.dart';
import 'package:impaktfull_mailer/src/util/variable_replacer/bracket_variable_replacer.dart';
import 'package:impaktfull_mailer/src/util/variable_replacer/variable_replacer.dart';

class ImpaktfullMailer {
  final VariableReplacer variableReplacer;
  final MailSenderService mailSenderService;
  String _defaultLocale;

  ImpaktfullMailer({
    required this.mailSenderService,
    this.variableReplacer = const BracketVariableReplacer(),
    String defaultLocale = 'en',
  }) : _defaultLocale = defaultLocale;

  Future<void> sendEmail({
    required String fromEmail,
    required List<String> to,
    required String subject,
    required MailTemplate template,
    List<String> cc = const [],
    List<String> bcc = const [],
  }) async {
    final html = await template.generateHtml();
    await mailSenderService.send(
      fromEmail: fromEmail,
      to: to,
      cc: cc,
      bcc: bcc,
      subject: subject,
      html: html,
    );
  }

  Future<void> sendEmailTemplate({
    required String fromEmail,
    required List<String> to,
    required String subject,
    required MailTemplate template,
    List<String> cc = const [],
    List<String> bcc = const [],
    String? fromName,
    String? locale,
  }) async {
    final html = await template.generateHtml(
      locale: locale ?? _defaultLocale,
    );
    final variables = template.getVariables();
    final htmlWithVariablesReplaced = variableReplacer.replace(html, variables);
    await mailSenderService.send(
      fromEmail: fromEmail,
      fromName: fromName,
      to: to,
      cc: cc,
      bcc: bcc,
      subject: subject,
      html: htmlWithVariablesReplaced,
    );
  }

  void setDefaultLocale(String locale) {
    _defaultLocale = locale;
  }
}
