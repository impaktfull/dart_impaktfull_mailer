# impaktfull_mailer

A dart library for sending emails on backend with a template engine.

## Disclaimer

**impaktfull_mailer is still in unstable & untested. everything under <1.0.0 should not be used unless you want to test it**

## Setup

### Add dependency to pubspec

[![pub package](https://img.shields.io/pub/v/impaktfull_mailer.svg)](https://pub.dartlang.org/packages/impaktfull_mailer)

```
dependencies:
  impaktfull_mailer: `latest_version`
```

### Send an email

```dart
/// Create the mailer
final mailer = ImpaktfullMailer(
  mailSenderService: BrevoMailSenderService(
    email: 'your_brevo_smtp_email',
    password: 'your_brevo_smtp_password',
  ), // or any other mail sender service
  variableReplacer: DelimiterVariableReplacer(
    prefix: '{{', // default
    suffix: '}}', // default
  ), // default
  defaultLocale: 'en',// default
);
/// Create the template
final template = YourTemplate();
/// Send the email
await mailer.sendEmailTemplate(
  fromEmail: 'hello@impaktfull.com',
  to: ['koen.vanlooveren@impaktfull.com'],
  subject: 'Test from the impaktfull_mailer dart package',
  template: template,
);
```
