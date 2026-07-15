import 'package:blogger_theme/blogger_theme.dart';

final floating_hamburger = Button(attributes: {
  'class': 'btn-hamburger-floating',
  'onclick': 'toggleSidebarDrawer()',
  'aria-label': 'Menu'
}, children: [
  Text('☰')
]);
