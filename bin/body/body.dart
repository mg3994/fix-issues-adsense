import 'package:blogger_theme/blogger_theme.dart';
import 'sidebar/sidebar.dart';
import 'app_container/container.dart';
import 'scripts/scripts.dart';
import 'account_settings_modal_backdrop/account_settings_modal_backdrop.dart';

class BloggerBody implements Component {
  @override
  Iterable<Component> build() {
    return [
      sidebar_backdrop,
      app_container,
      // Modal pop up
      account_settings_modal_backdrop,

      //js scripts
      theme_mode_sync_script,
      firebase_and_toast,
      antinna_engine_script,
    ];
  }
}
