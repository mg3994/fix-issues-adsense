import 'package:blogger_theme/blogger_theme.dart';
import 'seo.dart';
import 'title.dart';
import 'css.dart';

class BloggerHead implements Component {
  const BloggerHead();

  @override
  Iterable<Component> build() => [
    ...seoHeadList,
    const BloggerTitle(),
    bskinHead,
  ];
}
