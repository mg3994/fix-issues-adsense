import 'package:blogger_theme/blogger_theme.dart';

class ExpertiseSection extends Component {
  const ExpertiseSection();

  @override
  Iterable<Component> build() => [
    Section(
      attributes: {'class': 'section-padding', 'id': 'services'},
      children: [
        Div(
          attributes: {'class': 'container'},
          children: [
            Div(
              attributes: {'class': 'section-header'},
              children: [
                H2(children: [Text('Our Deep Architectural Expertise')]),
                P(children: [Text('Providing premium and clean Flutter services with structured codebases and modern software design patterns.')]),
              ],
            ),
            Div(
              attributes: {'class': 'features-grid'},
              children: [
                Div(
                  attributes: {'class': 'feature-card'},
                  children: [
                    Div(attributes: {'class': 'feature-icon'}, children: [Text('1')]),
                    H3(children: [Text('Monorepos & Dart Workspaces')]),
                    P(children: [Text('We build production-ready systems structuring monorepos with precise Melos configurations to streamline dependency management, testing, and continuous delivery pipelines.')]),
                  ],
                ),
                Div(
                  attributes: {'class': 'feature-card'},
                  children: [
                    Div(attributes: {'class': 'feature-icon'}, children: [Text('2')]),
                    H3(children: [Text('State Management & DI')]),
                    P(children: [Text('We deploy robust state-management schemes (Bloc, Riverpod) combined with elegant Dependency Injection to ensure highly testable, scalable, and modular application layers.')]),
                  ],
                ),
                Div(
                  attributes: {'class': 'feature-card'},
                  children: [
                    Div(attributes: {'class': 'feature-icon'}, children: [Text('3')]),
                    H3(children: [Text('High Performance & Custom UI')]),
                    P(children: [Text('From complex responsive layouts to high-performance rendering optimizations and platform-channel integrations, we craft beautiful apps without compromises.')]),
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
