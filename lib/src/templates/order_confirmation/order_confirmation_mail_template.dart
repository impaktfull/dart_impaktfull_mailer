import 'package:impaktfull_mailer/src/templates/html_mail_template.dart';
import 'package:impaktfull_mailer/src/templates/order_confirmation/model/mail_template_order_confirmation_order_line.dart';

export 'model/mail_template_order_confirmation_order_line.dart';

class OrderConfirmationMailTemplate extends HtmlMailTemplate {
  final String title;
  final String customerName;
  final String subtitle;
  final String orderId;
  final String orderDate;
  final String orderTotal;
  final String contactUsUrl;
  final String privacyUrl;
  final String unsubscribeUrl;
  final String copyright;
  final List<MailTemplateOrderConfirmationOrderLine> orderLines;

  const OrderConfirmationMailTemplate({
    required this.title,
    required this.customerName,
    required this.subtitle,
    required this.orderId,
    required this.orderDate,
    required this.orderTotal,
    required this.orderLines,
    required this.contactUsUrl,
    required this.privacyUrl,
    required this.unsubscribeUrl,
    required this.copyright,
  }) : super(
          templateName: 'order_confirmation',
        );

  @override
  Map<String, String> getVariables() {
    Map<String, String> variables = {};
    variables['TITLE'] = title;
    variables['CUSTOMER NAME'] = customerName;
    variables['SUBTITLE'] = subtitle;
    final sb = StringBuffer();
    for (final orderLine in orderLines) {
      sb.writeln('''
      <tr>
        <td>${orderLine.productName}</td>
        <td>${orderLine.quantity}</td>
        <td>${orderLine.price}</td>
      </tr>
      ''');
    }
    variables['ORDER LINES'] = sb.toString();
    variables['TOTAL PRICE'] = orderTotal;
    variables['ORDER NUMMER'] = orderId;
    variables['CONTACT US URL'] = contactUsUrl;
    variables['COPYRIGHT'] = copyright;
    variables['PRIVACY URL'] = privacyUrl;
    return variables;
  }
}
