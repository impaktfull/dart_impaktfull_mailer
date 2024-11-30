import 'package:impaktfull_mailer/src/util/variable_replacer/variable_replacer.dart';

class BracketVariableReplacer extends VariableReplacer {
  const BracketVariableReplacer();
  @override
  String replace(String html, Map<String, String> variables) {
    var newHtml = html;
    for (var variable in variables.entries) {
      newHtml = newHtml.replaceAll('{{${variable.key}}}', variable.value);
    }
    return newHtml;
  }
}
