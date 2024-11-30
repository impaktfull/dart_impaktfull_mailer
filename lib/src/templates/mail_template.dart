abstract class MailTemplate {
  const MailTemplate();

  Map<String, String> getVariables();

  Future<String> generateHtml({String? locale});
}
