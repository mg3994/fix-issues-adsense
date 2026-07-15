import 'package:blogger_theme/blogger_theme.dart';
import 'dart:io';

import '../lib/head/head.dart';
import '../lib/body/body.dart';

void main() {
  final theme = BloggerTheme(
    head: [
      const BloggerHead(),
    ],
    body: [
      const BloggerBody(),
    ],
  );

  final xml = theme.generate();

  // Create local build directory and write Blogger Theme XML
  final buildDir = Directory('build');
  if (!buildDir.existsSync()) {
    buildDir.createSync(recursive: true);
  }

  final outputFile = File('build/blogger_theme.xml');
  outputFile.writeAsStringSync(xml);
  print('Successfully compiled blogger_theme programmatically!');
  print('Theme file compiled to: ${outputFile.path}');

  // Also maintain theme.xml at repo root for release artifact purposes
  final repoFile = File('theme.xml');
  repoFile.writeAsStringSync(xml);
  print('Root theme.xml written!');
}
