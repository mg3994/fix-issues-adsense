import 'package:blogger_theme/blogger_theme.dart';

class HomepageBlogSection extends Component {
  const HomepageBlogSection();

  @override
  Iterable<Component> build() => [
    Section(
      attributes: {'class': 'section-padding bg-white', 'id': 'blog'},
      children: [
        Div(
          attributes: {'class': 'container'},
          children: [
            Div(
              attributes: {'class': 'section-header'},
              children: [
                H2(children: [Text('Latest Technical Insights')]),
                P(children: [Text('Deep dives into Dart, Flutter, and complex software architectural decisions directly from our core engineering team.')]),
              ],
            ),
            Div(attributes: {'class': 'services-container', 'id': 'homepage-posts-container'}),
            Div(
              attributes: {'style': 'text-align: center; margin-top: 48px;'},
              children: [
                A(
                  attributes: {
                    'class': 'btn btn-outline',
                    'expr:href': 'data:blog.canonicalUrl + "search?max-results=15"',
                  },
                  children: [Text('View All Articles')],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}

class Error404Page extends Component {
  const Error404Page();

  @override
  Iterable<Component> build() => [
    BIf(
      cond: 'data:view.isError',
      children: [
        Div(
          attributes: {'class': 'blog-layout'},
          children: [
            Div(
              attributes: {'class': 'container', 'style': 'text-align: center; padding: 100px 0;'},
              children: [
                H1(attributes: {'style': 'font-size: 120px; color: var(--primary-color); margin: 0;'}, children: [Text('404')]),
                H2(children: [Text('Page Not Found')]),
                P(attributes: {'style': 'color: var(--text-muted); font-size: 18px; margin-bottom: 32px;'}, children: [Text('The page you are looking for does not exist or has been relocated.')]),
                A(attributes: {'class': 'btn btn-primary', 'expr:href': 'data:blog.homepageUrl'}, children: [Text('Return Home')]),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}

class BlogLayout extends Component {
  const BlogLayout();

  @override
  Iterable<Component> build() => [
    BIf(
      cond: 'not data:view.isHomepage and not data:view.isError',
      children: [
        Div(
          attributes: {'class': 'blog-layout'},
          children: [
            Div(
              attributes: {'class': 'container blog-grid'},
              children: [
                DomComponent(
                  'main',
                  attributes: {'class': 'main-content'},
                  children: [
                    BSection(
                      id: 'blog-container',
                      children: [
                        BWidget(
                          id: 'Blog1',
                          type: 'Blog',
                          title: 'Blog Posts',
                          locked: false,
                          version: 1,
                          children: [
                            BIncludable(
                              id: 'main',
                              varName: 'top',
                              children: [
                                Div(
                                  attributes: {'class': 'blog-posts'},
                                  children: [
                                    BLoop(
                                      values: 'data:posts',
                                      varName: 'post',
                                      children: [
                                        Meta(attributes: {'expr:content': 'data:post.url', 'itemprop': 'mainEntityOfPage'}),
                                        Meta(attributes: {'expr:content': 'data:post.timestampISO8601', 'itemprop': 'dateModified'}),
                                        Span(
                                          attributes: {'itemprop': 'publisher', 'itemscope': 'itemscope', 'itemtype': 'https://schema.org/Organization'},
                                          children: [
                                            Meta(attributes: {'expr:content': 'data:blog.title', 'itemprop': 'name'}),
                                            Span(
                                              attributes: {'itemprop': 'logo', 'itemscope': 'itemscope', 'itemtype': 'https://schema.org/ImageObject'},
                                              children: [
                                                Meta(attributes: {'expr:content': 'data:blog.homepageUrl + "favicon.ico"', 'itemprop': 'url'}),
                                                Meta(attributes: {'content': '500', 'itemprop': 'width'}),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Span(
                                          attributes: {'itemprop': 'author', 'itemscope': 'itemscope', 'itemtype': 'https://schema.org/Person'},
                                          children: [
                                            Meta(attributes: {'expr:content': 'data:post.authorProfileUrl', 'itemprop': 'url'}),
                                            Meta(attributes: {'expr:content': 'data:post.author', 'itemprop': 'name'}),
                                          ],
                                        ),
                                        BIf(
                                          cond: 'data:post.firstImageUrl',
                                          children: [
                                            Div(
                                              attributes: {'itemprop': 'image', 'itemscope': 'itemscope', 'itemtype': 'https://schema.org/ImageObject'},
                                              children: [
                                                Meta(attributes: {'expr:content': 'data:post.firstImageUrl', 'itemprop': 'url'}),
                                                Meta(attributes: {'content': '700', 'itemprop': 'width'}),
                                                Meta(attributes: {'content': '700', 'itemprop': 'height'}),
                                              ],
                                            ),
                                          ],
                                        ),
                                        BIf(
                                          cond: 'data:view.isSingleItem',
                                          children: [
                                            Div(
                                              attributes: {'class': 'breadcrumbs'},
                                              children: [
                                                A(attributes: {'expr:href': 'data:blog.homepageUrl'}, children: [Text('Home')]),
                                                Text(' > '),
                                                BIf(
                                                  cond: 'data:post.labels',
                                                  children: [
                                                    BLoop(
                                                      values: 'data:post.labels',
                                                      varName: 'label',
                                                      children: [
                                                        A(attributes: {'expr:href': 'data:label.url'}, children: [BData(value: 'label.name')]),
                                                        Text(' '),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Text(' > '),
                                                DomComponent('strong', children: [BData(value: 'post.title')]),
                                              ],
                                            ),
                                            Article(
                                              attributes: {'class': 'single-post'},
                                              children: [
                                                H1(attributes: {'class': 'post-heading'}, children: [BData(value: 'post.title')]),
                                                Div(
                                                  attributes: {'class': 'post-meta'},
                                                  children: [
                                                    Span(children: [Text('By '), DomComponent('strong', children: [BData(value: 'post.author')])]),
                                                    Span(children: [Text('Published '), DomComponent('strong', children: [BData(value: 'post.timestamp')])]),
                                                  ],
                                                ),
                                                Div(
                                                  attributes: {'class': 'post-body entry-content', 'style': 'background:#fff; padding: 40px; border-radius: 16px; border:1px solid var(--border-color); margin-top:32px;'},
                                                  children: [BData(value: 'post.body')],
                                                ),
                                              ],
                                            ),
                                            BInclude(name: 'comment_picker', data: 'post'),
                                          ],
                                        ),
                                        BIf(
                                          cond: 'data:view.isMultipleItems',
                                          children: [
                                            Div(
                                              attributes: {'class': 'post-card'},
                                              children: [
                                                Div(
                                                  attributes: {'class': 'post-card-img'},
                                                  children: [
                                                    A(
                                                      attributes: {'expr:href': 'data:post.url'},
                                                      children: [
                                                        BIf(
                                                          cond: 'data:post.firstImageUrl',
                                                          children: [
                                                            Img(attributes: {'expr:alt': 'data:post.title', 'expr:src': 'data:post.firstImageUrl'}),
                                                          ],
                                                        ),
                                                        BIf(
                                                          cond: '!data:post.firstImageUrl',
                                                          children: [
                                                            Img(attributes: {'expr:alt': 'data:post.title', 'src': 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh7qj4GtXna090Q1-R8hIY69tpMdc9QWewEODYQCS2FV57askuUaOD87O4Qn2gY4FcgVY8C8e-ickla16fvzGPR9Na2tkejnBbn_xh9pCKmO9ZWd_y_g1fjbS2uJEoFUvx5cT1Pt6F29l0IUzDVHHksyxkGOimBRaxsWpn_6wlXGzPavsCpGAC7KPqIKn1E/s16000/thumbnail-placeholder.png'}),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Div(
                                                  attributes: {'class': 'post-card-content'},
                                                  children: [
                                                    Div(
                                                      attributes: {'class': 'post-meta'},
                                                      children: [
                                                        Span(children: [Text('By '), DomComponent('strong', children: [BData(value: 'post.author')])]),
                                                        Span(children: [BData(value: 'post.timestamp')]),
                                                      ],
                                                    ),
                                                    H2(
                                                      attributes: {'class': 'post-card-title'},
                                                      children: [
                                                        A(attributes: {'expr:href': 'data:post.url'}, children: [BData(value: 'post.title')]),
                                                      ],
                                                    ),
                                                    P(attributes: {'class': 'post-snippet'}, children: [BEval(expr: 'data:post.snippet')]),
                                                    A(attributes: {'class': 'btn btn-outline', 'expr:href': 'data:post.url', 'style': 'padding: 8px 20px; font-size:14px;'}, children: [Text('Read Article')]),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    BIf(
                                      cond: 'data:view.isMultipleItems',
                                      children: [
                                        BIf(
                                          cond: 'data:olderPageUrl',
                                          children: [
                                            Div(
                                              attributes: {'style': 'margin-top: 32px;'},
                                              children: [
                                                A(attributes: {'class': 'btn btn-outline', 'expr:href': 'data:olderPageUrl'}, children: [Text('Older Articles')]),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            BIncludable(
                              id: 'comment_picker',
                              varName: 'post',
                              children: [
                                BIf(
                                  cond: 'data:post.showThreadedComments',
                                  children: [
                                    BInclude(name: 'threaded_comments', data: 'post'),
                                  ],
                                ),
                                BIf(
                                  cond: '!data:post.showThreadedComments',
                                  children: [
                                    BInclude(name: 'comments', data: 'post'),
                                  ],
                                ),
                              ],
                            ),
                            BIncludable(
                              id: 'comments',
                              varName: 'post',
                              children: [
                                Div(
                                  attributes: {'class': 'comments widget', 'id': 'comments', 'style': 'margin-top: 40px;'},
                                  children: [
                                    H4(children: [Text('Comments')]),
                                    BIf(
                                      cond: 'data:post.allowComments',
                                      children: [
                                        Div(
                                          attributes: {'expr:id': 'data:widget.instanceId + "_comments-block-wrapper"'},
                                          children: [
                                            BLoop(
                                              values: 'data:post.comments',
                                              varName: 'comment',
                                              children: [
                                                Div(
                                                  attributes: {'class': 'comment-block', 'style': 'padding: 16px 0; border-bottom: 1px solid var(--border-color);'},
                                                  children: [
                                                    DomComponent('strong', children: [BData(value: 'comment.author')]),
                                                    Text(' says:'),
                                                    P(children: [BData(value: 'comment.body')]),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        BInclude(name: 'comment-form', data: 'post'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            BIncludable(
                              id: 'comment-form',
                              varName: 'post',
                              children: [
                                Div(
                                  attributes: {'class': 'comment-form', 'style': 'margin-top: 24px;'},
                                  children: [
                                    H4(children: [Text('Add Comment')]),
                                    DomComponent('iframe', attributes: {
                                      'allowtransparency': 'true',
                                      'class': 'blogger-comment-from-post',
                                      'expr:height': 'data:cmtIframeInitialHeight',
                                      'frameborder': '0',
                                      'id': 'comment-editor',
                                      'name': 'comment-editor',
                                      'src': '',
                                      'width': '100%',
                                    }),
                                    BData(value: 'post.cmtfpIframe'),
                                    RawText(r'''<script type='text/javascript'> BLOG_CMT_createIframe(' <data:post.appRpcRelayPath/> '); </script>'''),
                                  ],
                                ),
                              ],
                            ),
                            BIncludable(
                              id: 'threaded_comments',
                              varName: 'post',
                              children: [
                                Div(
                                  attributes: {'class': 'comments widget', 'id': 'comments', 'style': 'margin-top: 40px;'},
                                  children: [
                                    H4(children: [Text('Threaded Comments')]),
                                    Div(attributes: {'id': 'comment-holder'}, children: [BData(value: 'post.commentHtml')]),
                                    BInclude(name: 'threaded-comment-form', data: 'post'),
                                  ],
                                ),
                              ],
                            ),
                            BIncludable(
                              id: 'threaded-comment-form',
                              varName: 'post',
                              children: [
                                Div(
                                  attributes: {'class': 'comment-form', 'style': 'margin-top: 24px;'},
                                  children: [
                                    DomComponent('iframe', attributes: {
                                      'allowtransparency': 'true',
                                      'class': 'blogger-comment-from-post',
                                      'expr:height': 'data:cmtIframeInitialHeight',
                                      'frameborder': '0',
                                      'id': 'comment-editor',
                                      'name': 'comment-editor',
                                      'src': '',
                                      'width': '100%',
                                    }),
                                    BData(value: 'post.cmtfpIframe'),
                                    RawText(r'''<script type='text/javascript'> BLOG_CMT_createIframe(' <data:post.appRpcRelayPath/> '); </script>'''),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Aside(
                  attributes: {'class': 'sidebar'},
                  children: [
                    BSection(
                      id: 'popular-posts-container',
                      children: [
                        BWidget(
                          id: 'PopularPosts1',
                          type: 'PopularPosts',
                          title: 'Popular Posts',
                          locked: false,
                          version: 1,
                          children: [
                            BWidgetSettings(children: [
                              BWidgetSetting(name: 'numItemsToShow', children: [Text('3')]),
                              BWidgetSetting(name: 'showThumbnails', children: [Text('true')]),
                              BWidgetSetting(name: 'showSnippets', children: [Text('true')]),
                              BWidgetSetting(name: 'timeRange', children: [Text('LAST_YEAR')]),
                            ]),
                            BIncludable(
                              id: 'main',
                              children: [
                                Div(
                                  attributes: {'class': 'widget'},
                                  children: [
                                    H3(attributes: {'class': 'widget-title'}, children: [Text('Popular Content')]),
                                    Div(
                                      attributes: {'class': 'popular-list'},
                                      children: [
                                        BLoop(
                                          values: 'data:posts',
                                          varName: 'post',
                                          children: [
                                            Div(
                                              attributes: {'style': 'margin-bottom: 20px;'},
                                              children: [
                                                A(
                                                  attributes: {
                                                    'expr:href': 'data:post.href',
                                                    'style': 'font-weight:600; font-size:15px; color:var(--dark-color); display:block; margin-bottom:4px;',
                                                  },
                                                  children: [BData(value: 'post.title')],
                                                ),
                                                Span(
                                                  attributes: {'style': 'font-size:13px; color:var(--text-muted);'},
                                                  children: [BEval(expr: 'data:post.snippet')],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    BSection(
                      id: 'labels-container',
                      children: [
                        BWidget(
                          id: 'Label1',
                          type: 'Label',
                          title: 'Categories',
                          locked: false,
                          version: 1,
                          children: [
                            BIncludable(
                              id: 'main',
                              children: [
                                Div(
                                  attributes: {'class': 'widget'},
                                  children: [
                                    H3(attributes: {'class': 'widget-title'}, children: [Text('Categories')]),
                                    Div(
                                      attributes: {'style': 'display:flex; flex-wrap:wrap; gap:8px;'},
                                      children: [
                                        BLoop(
                                          values: 'data:labels',
                                          varName: 'label',
                                          children: [
                                            A(
                                              attributes: {
                                                'expr:href': 'data:label.url',
                                                'style': 'padding:6px 12px; background:var(--bg-soft); border-radius:20px; font-size:13px; border:1px solid var(--border-color); font-weight:500;',
                                              },
                                              children: [
                                                BData(value: 'label.name'),
                                                Text(' ('),
                                                BData(value: 'label.count'),
                                                Text(')'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
