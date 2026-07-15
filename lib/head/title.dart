import 'package:blogger_theme/blogger_theme.dart';

class BloggerTitle extends Component {
  const BloggerTitle();

  @override
  Iterable<Component> build() => [
    BIf(
      cond: 'data:blog.homepageUrl == data:blog.url',
      children: [
        Title(children: [BData(value: 'blog.pageTitle')]),
      ],
    ),
    BIf(
      cond: 'data:blog.homepageUrl != data:blog.url and data:blog.pageType in {"item","static_page"}',
      children: [
        Title(children: [BData(value: 'blog.pageName'), Text(' - '), BData(value: 'blog.title')]),
      ],
    ),
    BIf(
      cond: 'data:blog.homepageUrl != data:blog.url and not data:blog.pageType in {"item","static_page"} and data:view.isLabelSearch',
      children: [
        Title(children: [Text('Posts Tagged: '), BData(value: 'blog.searchLabel'), Text(' - '), BData(value: 'blog.title')]),
      ],
    ),
    BIf(
      cond: 'data:blog.homepageUrl != data:blog.url and not data:blog.pageType in {"item","static_page"} and not data:view.isLabelSearch and data:view.isSearch',
      children: [
        Title(children: [Text('Search Results for: '), BData(value: 'blog.searchQuery'), Text(' - '), BData(value: 'blog.title')]),
      ],
    ),
    BIf(
      cond: 'data:blog.homepageUrl != data:blog.url and not data:blog.pageType in {"item","static_page"} and not data:view.isLabelSearch and not data:view.isSearch and data:blog.pageType in {"error_page"}',
      children: [
        Title(children: [Text('Page Not Found - '), BData(value: 'blog.title')]),
      ],
    ),
  ];
}
