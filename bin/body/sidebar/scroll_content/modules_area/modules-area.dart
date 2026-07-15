import 'package:blogger_theme/blogger_theme.dart';

final sidebar_modules_area = Div(
  attributes: {'class': 'sidebar-modules-area'},
  children: [
    BSection(
      className: 'sidebar-modules-section',
      id: 'sidebar-workspace-links',
      maxwidgets: 1,
      showaddelement: true,
      children: [
        BWidget(
          id: 'LinkList3',
          type: 'LinkList',
          locked: false,
          title: 'Workspace Menu',
          version: 2,
          children: [
            BWidgetSettings(
              children: [
                BWidgetSetting(
                  name: 'text-0',
                  children: ["Hire Flutter Developers".component],
                ),
                BWidgetSetting(name: 'link-0', children: ["/p/about-us.html".component]),
                BWidgetSetting(
                  name: 'text-1',
                  children: ["Monorepo Architectures".component],
                ),
                BWidgetSetting(name: 'link-1', children: ["/search/label/Monorepos".component]),
                BWidgetSetting(
                  name: 'text-2',
                  children: ["Clean State Management".component],
                ),
                BWidgetSetting(name: 'link-2', children: ["/search/label/StateManagement".component]),
              ],
            ),
            BIncludable(
              id: 'main',
              children: [
                Div(
                  attributes: {'class': 'module-wrapper'},
                  children: [
                    Button(
                      attributes: {
                        'class': 'module-trigger',
                        'onclick': 'toggleModuleDropdown("workspace-module")',
                      },
                      children: [
                        Span(
                          children: [
                            BEval(
                              expr:
                                  'data:title != "" and data:title != " " ? data:title : ""',
                            ),
                          ],
                        ),
                        Span(
                          attributes: {
                            'class': 'arrow-indicator initial-open',
                            'id': 'workspace-module-arrow',
                          },
                          children: ["▾".component],
                        ),
                      ],
                    ),
                    Ul(
                      attributes: {
                        'class': 'module-dropdown-list',
                        'id': 'workspace-module',
                      },
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
