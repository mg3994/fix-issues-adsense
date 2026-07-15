import 'dart:io';

import 'package:blogger_theme/blogger_theme.dart';
import 'head/head.dart';
import 'body/body.dart';

void main() {
  var theme = BloggerTheme(head: [BloggerHead()], body: [BloggerBody()]);
  final xml = theme.generate();
  final outputFile = File('build/blogger/theme.xml');
  outputFile.createSync(recursive: true);
  outputFile.writeAsStringSync(xml);

  print('Wrote generated theme to ${outputFile.path}');
}