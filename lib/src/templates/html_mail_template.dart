import 'package:impaktfull_mailer/src/templates/html_mail_templates.dart';
import 'package:impaktfull_mailer/src/templates/mail_template.dart';

abstract class HtmlMailTemplate extends MailTemplate {
  final String templateName;

  const HtmlMailTemplate({
    required this.templateName,
  });

  @override
  Future<String> generateHtml({String? locale}) async {
    final template = HtmlTemplates.templates[templateName];
    if (template == null) {
      throw Exception('Template $templateName not found');
    }
    final supportedLocales = template.keys.toList();
    if (!supportedLocales.contains(locale)) {
      throw Exception(
          'Locale $locale is not supported. Supported locales: ${supportedLocales.join(', ')}');
    }
    return HtmlTemplates.templates[templateName]![locale]!;
  }
}
