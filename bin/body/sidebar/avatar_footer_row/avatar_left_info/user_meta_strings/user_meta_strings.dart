import 'package:blogger_theme/blogger_theme.dart';

final user_meta_strings = Div(attributes: {
  'class': 'user-meta-strings',
}, children: [
  Span(
      attributes: {'class': 'user-display-name'},
      children: [Text('Flutter Expert')]),
  Span(
      attributes: {'class': 'user-display-role'},
      children: [Text('Agency Consulting')]),
]);
