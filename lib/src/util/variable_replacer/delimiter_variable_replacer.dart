import 'package:impaktfull_mailer/src/util/variable_replacer/variable_replacer.dart';

class DelimiterVariableReplacer extends VariableReplacer {
  final String prefix;
  final String suffix;

  const DelimiterVariableReplacer({
    this.prefix = '{{',
    this.suffix = '}}',
  });

  @override
  String replace(String html, Map<String, String> variables) {
    var newHtml = html;
    for (var variable in variables.entries) {
      newHtml = newHtml.replaceAll(
          '$prefix${variable.key.toUpperCase()}$suffix', variable.value);
    }
    return newHtml;
  }
}
