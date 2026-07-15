import 'package:blogger_theme/blogger_theme.dart';
import 'brand/brand.dart';
import 'btn_close.dart';

/// Fixed Layout Top branding Header
final sidebar_header = Div(
    attributes: {'class': 'sidebar-header'},
    children: [brand_logo, btn_close_sidebar]);
