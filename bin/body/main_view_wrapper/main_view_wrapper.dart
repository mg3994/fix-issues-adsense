import 'package:blogger_theme/blogger_theme.dart';
import 'scrollable_main_content/scrollable_main_content.dart';
import 'floating_hamburger.dart';

final main_view_wrapper = Div(
  attributes: {'class': 'main-view-wrapper'},
  children: [floating_hamburger, scrollable_main_content],
);
