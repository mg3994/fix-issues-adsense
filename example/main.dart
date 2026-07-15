import 'dart:io';

import 'package:blogger_theme/blogger_theme.dart';

class BlogLayout extends Component {
  const BlogLayout();

  @override
  Iterable<Component> build() => [
    Div(
      attributes: {'class': 'wrapper-pane'},
      children: [
        BSection(
          id: 'header-area',
          className: 'header-section',
          maxwidgets: 1,
          showaddelement: true,
          children: [
            BWidget(
              id: 'Header1',
              type: 'Header',
              title: 'Blog Header Title',
              locked: true,
            ),
          ],
        ),
        BIf(
          cond: 'data:view.isPost',
          children: [
            Div(
              attributes: {'class': 'post-item'},
              children: [BData(value: 'post.body')],
            ),
          ],
        ),
      ],
    ),
  ];
}

void main() {
  final theme = BloggerTheme(
    attributes: {
      'b:responsive': 'true',
      'b:defaultwidgetversion': '2',
      'b:layoutsversion': '3',
    },
    head: [
      Title(children: [Text('Generated Blogger Theme')]),
      BSkin('body { font-family: Arial, sans-serif; }'),
    ],
    body: [
      const BlogLayout(),
      // Optional: compile a local Dart client script into inline JavaScript.
      // const BClientScript('web/interactivity.dart'),
    ],
  );

  final xml = theme.generate();
  print(xml);

  final outputFile = File('build/blogger_theme.xml');
  outputFile.createSync(recursive: true);
  outputFile.writeAsStringSync(xml);

  print('Wrote generated theme to ${outputFile.path}');
}
