import 'dart:io';

import 'package:path/path.dart';

void main() {
  // Check if pubspec.yaml exists in current directory
  if (!File('pubspec.yaml').existsSync()) {
    throw Exception(
        'This script must be run from the root of the project (where pubspec.yaml is located)');
  }
  final templateDirectory = Directory(join('templates'));

  final localesToHtmlContent = <String, Map<String, String>>{};
  for (final template in templateDirectory.listSync()) {
    if (template is! Directory) {
      print('Not a directory: ${template.path}');
      continue;
    }
    final name = basename(template.path);
    final templates = template.listSync();
    for (final templateFile in templates) {
      if (templateFile is! File) {
        print('Not a file: ${templateFile.path}');
        continue;
      }
      final tempalteExtension = extension(templateFile.path);
      if (tempalteExtension != '.html') {
        print('Not an html file: ${templateFile.path}');
        continue;
      }
      final templateName = basenameWithoutExtension(templateFile.path);
      final locale = templateName.replaceAll('${name}_mail_template_', '');
      final htmlContent = templateFile.readAsStringSync();
      localesToHtmlContent[name] = {
        locale: htmlContent,
      };
    }
  }
  copyHtmlToDart(localesToHtmlContent);
}

void copyHtmlToDart(Map<String, Map<String, String>> data) {
  final templateDirectory = Directory(join('lib', 'src', 'templates'));
  if (!templateDirectory.existsSync()) {
    throw Exception(
        'Dart template directory does not exist: ${templateDirectory.path}');
  }
  final templateLocaleFile =
      File(join(templateDirectory.path, 'html_mail_templates.dart'));
  final sb = StringBuffer();
  sb.writeln('class HtmlTemplates {');
  sb.writeln('  const HtmlTemplates._();');
  // Add extra template
  sb.writeln(
      '  static void addTemplate(String name, String locale, String htmlContent) {');
  sb.writeln('    templates[name] ??= {};');
  sb.writeln('    templates[name]![locale] = htmlContent;');
  sb.writeln('  }');
  sb.writeln();
  // Remove template
  sb.writeln('  static void removeTemplate(String name, [String? locale]) {');
  sb.writeln('    if (locale == null) {');
  sb.writeln('      templates.remove(name);');
  sb.writeln('    } else {');
  sb.writeln('      templates[name]?.remove(locale);');
  sb.writeln('    }');
  sb.writeln('  }');
  sb.writeln();
  // Default templates
  sb.writeln('  static final templates = {');
  for (final template in data.entries) {
    final name = template.key;
    final localesToHtmlContent = template.value;
    sb.writeln('    "$name": {');
    for (final entry in localesToHtmlContent.entries) {
      final locale = entry.key;
      final htmlContent = entry.value;
      sb.writeln('      "$locale": """$htmlContent""",');
    }
    sb.writeln('    },');
  }
  sb.writeln('  };');
  sb.writeln('}');
  templateLocaleFile.writeAsStringSync(sb.toString());
}
