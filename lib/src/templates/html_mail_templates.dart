class HtmlTemplates {
  const HtmlTemplates._();
  static void addTemplate(String name, String locale, String htmlContent) {
    templates[name] ??= {};
    templates[name]![locale] = htmlContent;
  }

  static void removeTemplate(String name, [String? locale]) {
    if (locale == null) {
      templates.remove(name);
    } else {
      templates[name]?.remove(locale);
    }
  }

  static final templates = {
    "order_confirmation": {
      "en": """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{TITLE}}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        .email-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #1a1a1a;
            padding: 20px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }
        .content {
            padding: 20px;
        }
        .content h1 {
            margin: 0;
            font-size: 24px;
            color: #ffffff;
        }
        .content h2 {
            font-size: 18px;
            color: #ffffff;
        }
        .content p {
            font-size: 16px;
            color: #ededed;
            line-height: 1.6;
        }
        .order-details {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 15px;
            box-sizing: border-box;
        }
        .order-details h3 {
            font-size: 18px;
            margin: 0;
            margin-bottom: 20px;
        }
        .order-details table {
            width: 100%;
            border-collapse: collapse;
        }
        .order-details table th,
        .order-details table td {
            text-align: left;
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        .order-details table th {
            background-color: #f0f0f0;
        }
        a {
            color: #ededed;
        }
        .footer {
            text-align: center;
            font-size: 14px;
            color: #888;
            margin-top: 20px;
        }

        /* Media queries for responsiveness */
        @media only screen and (max-width: 600px) {
            .email-container {
                padding: 10px;
            }
            .content {
                padding: 10px;
            }
            .content h1 {
                font-size: 20px;
            }
            .content h2 {
                font-size: 16px;
            }
            .content p {
                font-size: 14px;
            }
            .order-details {
                padding: 10px;
            }
            .order-details h3 {
                font-size: 16px;
            }
            .order-details table th,
            .order-details table td {
                font-size: 14px;
                padding: 5px;
            }
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="content">
            <h1>Hi {{CUSTOMER NAME}},</h1>
            <h2>{{SUBTITLE}}</h2>
            <p>Below you can see a summary of your order.</p>
            <div class="order-details">
                <h3>Your order</h3>
                <table>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
{{ORDER LINES}}
                    <tr>
                        <td colspan="2" style="text-align: right;"><strong>Total:</strong></td>
                        <td>{{TOTAL PRICE}}</td>
                    </tr>
                </table>
            </div>
            <p>Your order number is <strong>{{ORDER NUMMER}}</strong>.</p>
            <p>If you still have questions, please do not hesitate to <a href="{{CONTACT US URL}}">contact us</a>.</p>
        </div>
        <div class="footer">
            <p>{{COPYRIGHT}}</p>
            <p><a href="{{PRIVACY URL}}">Privacy Policy</a></p>
        </div>
    </div>
</body>
</html>""",
    },
  };
}
