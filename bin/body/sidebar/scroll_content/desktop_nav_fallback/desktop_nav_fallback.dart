import 'package:blogger_theme/blogger_theme.dart';

// <!-- Primary Application Core Static Navigation Paths -->
// <div class='desktop-nav-fallback'>
//     <ul class='sidebar-static-links'>
//         <li><a class='nav-route-link' href='/'>Home</a></li>
//         <li><a class='nav-route-link' href='/p/about-us.html'>About</a></li>
//         <li><a class='nav-route-link' href='/search/label/Services'>Services</a></li>
//         <li><a class='nav-route-link' href='/p/contact-us.html'>Contact Us</a></li>
//     </ul>
// </div>
final desktop_nav_fallback = Div(
  attributes: {'class': 'desktop-nav-fallback'},
  children: [
    BSection(
      className: 'sidebar-shared-nav-section',
      id: 'sidebar-primary-links',
      maxwidgets: 1,
      showaddelement: true,
      children: [
        BWidget(
          id: 'LinkList1',
          locked: false,
          title: 'Navigation Menu',
          type: 'LinkList',
          version: 2,
          children: [
            // All Icons are taken from https://icon-sets.iconify.design/picon/ so name your nae wisely
            BWidgetSettings(
              children: [
                BWidgetSetting(name: 'text-0', children: [Text("house")]),
                BWidgetSetting(name: 'link-0', children: [Text("/")]),

                BWidgetSetting(name: 'text-1', children: [Text("user")]),
                BWidgetSetting(
                  name: 'link-1',
                  children: [Text("/p/about-us.html")],
                ),

                BWidgetSetting(name: 'text-2', children: [Text("gear")]),
                BWidgetSetting(
                  name: 'link-2',
                  children: [Text("/search/label/Services")],
                ),

                BWidgetSetting(name: 'text-3', children: [Text("envelope")]),
                BWidgetSetting(
                  name: 'link-3',
                  children: [Text("/p/contact-us.html")],
                ),
              ],
            ),

            BIncludable(
              id: 'main',
              children: [
                Ul(
                  attributes: {'class': 'sidebar-static-links'},
                  children: [
                    BLoop(
                      values: 'data:links',
                      varName: 'link',
                      children: [
                        Li(
                          children: [
                            A(
                              attributes: {
                                'class': 'nav-route-link',
                                'expr:href': 'data:link.target',
                              },
                              children: [BData(value: 'link.name')],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                Div(
                  attributes: {'class': 'mobile-bottom-navigation-bar'},
                  children: [
                    Ul(
                      attributes: {'class': 'bottom-nav-list'},
                      children: [
                        BLoop(
                          values: 'data:links',
                          varName: 'link',
                          children: [
                            Li(
                              attributes: {'class': 'bottom-nav-item'},
                              children: [
                                A(
                                  attributes: {
                                    'class': 'nav-route-link',
                                    'expr:href': 'data:link.target',
                                  },
                                  children: [
                                    BIf(
                                      cond: 'data:link.name != " "',
                                      children: [
                                        Span(
                                          attributes: {
                                            'class': 'bottom-nav-icon-dot',
                                            // This injects the dynamic URL into a CSS variable
                                            'expr:style':
                                                '"--icon-url: url(https://api.iconify.design/picon/" + data:link.name + ".svg)"',
                                          },
                                        ),
                                        Span(
                                          attributes: {
                                            'class': 'bottom-nav-text',
                                          },
                                          children: [
                                            BData(value: 'link.name'),
                                          ],
                                        ),
                                        BElse(),
                                        Span(
                                          attributes: {
                                            'class': 'bottom-nav-icon-dot',
                                          },
                                          children: [Text('•')],
                                        ),
                                        Span(
                                          attributes: {
                                            'class': 'bottom-nav-text',
                                          },
                                          children: [BData(value: 'link.name')],
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
);
