import 'dart:convert';
import 'dart:io';

import 'package:blogger_theme/blogger_theme.dart';
import 'head/head.dart';
import 'body/body.dart';

Future<void> fetchAntinnaEngine() async {
  print('Fetching latest Antinna Engine from stable_backups_ecomm releases...');
  final url = Uri.parse('https://github.com/mg3994/stable_backups_ecomm/releases/latest/download/antinna-engine.iife.js');
  final client = HttpClient();
  try {
    final request = await client.getUrl(url);
    final response = await request.close();
    if (response.statusCode == 200) {
      final bytes = await response.fold<List<int>>([], (p, e) => p..addAll(e));
      final jsContent = utf8.decode(bytes);
      final jsContentClean = jsContent.replaceAll('"""', '\"\"\"'); // Clean up any triple quotes

      final dartContent = '''import 'package:blogger_theme/blogger_theme.dart';

final antinna_engine_script = Script(
  type: 'text/javascript',
  contentInCDATA: true,
  content: r"""$jsContentClean""",
);
''';
      final file = File('bin/body/scripts/firebase/antinna_engine.dart');
      file.writeAsStringSync(dartContent);
      print('Successfully fetched and updated bin/body/scripts/firebase/antinna_engine.dart!');
    } else {
      print('Warning: Failed to fetch Antinna Engine (Status: ${response.statusCode}). Using cached/existing file.');
    }
  } catch (e) {
    print('Warning: Network error fetching Antinna Engine: $e. Using cached/existing file.');
  } finally {
    client.close();
  }
}

void main() async {
  await fetchAntinnaEngine();
  var theme = BloggerTheme(head: [BloggerHead()], body: [BloggerBody()]);
  final xml = theme.generate();
  final outputFile = File('build/blogger/theme.xml');
  outputFile.createSync(recursive: true);
  outputFile.writeAsStringSync(xml);

  print('Wrote generated theme to ${outputFile.path}');
}
