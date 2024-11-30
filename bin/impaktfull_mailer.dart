import 'package:impaktfull_mailer/impaktfull_mailer.dart';

import 'impaktfull_mailer_secrets.dart';

Future<void> main(List<String> arguments) async {
  try {
    // Step 1: Initialize the mailer
    final mailer = ImpaktfullMailer(
      mailSenderService: BrevoMailSenderService(
        email: ImpaktfullMailerSecrets.brevoEmail,
        password: ImpaktfullMailerSecrets.brevoPassword,
      ),
      variableReplacer: DelimiterVariableReplacer(),
    );
    // Step 2: Create an html template
    final template = OrderConfirmationMailTemplate(
      title: 'Order Confirmation',
      customerName: 'Koen Vanlooveren',
      subtitle: 'Order summary',
      orderId: '1234567890',
      orderDate: '2024-01-01',
      orderTotal: '100.00',
      orderLines: [
        MailTemplateOrderConfirmationOrderLine(
          productName: 'Product 1',
          quantity: 1,
          price: '10.00',
        ),
        MailTemplateOrderConfirmationOrderLine(
          productName: 'Product 2',
          quantity: 4,
          price: '10.00',
        ),
        MailTemplateOrderConfirmationOrderLine(
          productName: 'Product 3',
          quantity: 1,
          price: '50.00',
        ),
      ],
      contactUsUrl: 'https://impaktfull.com/contact',
      privacyUrl: 'https://impaktfull.com/privacy-policy',
      unsubscribeUrl: 'https://impaktfull.com/unsubscribe',
      copyright: '© 2024 - Impaktfull',
    );
    // Step 3: Send the email
    await mailer.sendEmailTemplate(
      fromEmail: 'hello@impaktfull.com',
      to: ['koen.vanlooveren@impaktfull.com'],
      subject: 'Test from the impaktfull_mailer dart package',
      template: template,
    );
    print('Email successfully sent');
  } catch (e) {
    print('Error sending email: $e');
  }
}
