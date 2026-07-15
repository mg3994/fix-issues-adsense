import 'package:blogger_theme/blogger_theme.dart';
import '../top_navbar_header/top_navbar_header.dart';

final scrollable_main_content = Main(
  attributes: {'class': 'scrollable-main-content'},
  children: [
    top_navbar_header,
    BSection(
      className: 'main-feed-section',
      id: 'main-feed-stream',
      showaddelement: true,
      children: [],
    ),
  ],
);
