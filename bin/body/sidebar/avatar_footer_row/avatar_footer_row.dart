import 'package:blogger_theme/blogger_theme.dart';
import 'avatar_left_info/avatar_left_info.dart';
import 'btn_settings_gear/btn_settings_gear.dart';

final btn_theme_toggle = Button(attributes: {
  'class': 'btn-theme-toggle',
  'id': 'theme-mode-switcher',
  'style': 'margin-right: 8px; background: transparent; border: none; font-size: 1.4rem; cursor: pointer; color: var(--text-muted); display: flex; align-items: center; justify-content: center; outline: none;'
}, children: [
  Span(attributes: {
    'class': 'mode-icon icon-moon'
  }, children: [Text('☾')]),
  Span(attributes: {
    'class': 'mode-icon icon-sun ui-hidden'
  }, children: [Text('☼')])
]);

final avatar_footer_row = Div(attributes: {
  'class': 'avatar-footer-row',
}, children: [
  avatar_left_info,
  Div(attributes: {
    'style': 'display: flex; align-items: center;'
  }, children: [
    btn_theme_toggle,
    btn_settings_gear
  ])
]);
