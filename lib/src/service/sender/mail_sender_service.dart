abstract class MailSenderService {
  const MailSenderService();
  Future<void> send({
    required String fromEmail,
    required List<String> to,
    required String subject,
    List<String> bcc,
    List<String> cc,
    String? fromName,
    String? text,
    String? html,
    String? locale,
  });
}
