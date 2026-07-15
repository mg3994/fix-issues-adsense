import 'package:blogger_theme/blogger_theme.dart';

class HeroSection extends Component {
  const HeroSection();

  @override
  Iterable<Component> build() => [
    Section(
      attributes: {'class': 'hero'},
      children: [
        Div(
          attributes: {'class': 'container hero-grid'},
          children: [
            Div(
              attributes: {'class': 'hero-content'},
              children: [
                H1(attributes: {'class': 'hero-title'}, children: [Text('Hire World-Class Flutter Developers & Experts')]),
                P(attributes: {'class': 'hero-subtitle'}, children: [Text('We craft responsive, high-performance cross-platform mobile apps, manage Dart workspaces, design robust monorepos, and deploy clean state management architectures.')]),
                Div(
                  attributes: {'class': 'hero-buttons'},
                  children: [
                    A(attributes: {'class': 'btn btn-primary', 'href': 'p/contact-us.html'}, children: [Text('Hire Us Now')]),
                    A(attributes: {'class': 'btn btn-outline', 'href': '#blog'}, children: [Text('Explore Insights')]),
                  ],
                ),
              ],
            ),
            Div(
              attributes: {'class': 'hero-image'},
              children: [
                Img(attributes: {'alt': 'Flutter development', 'src': 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEggpy8Livium-5MkYeTpFA6HdtwmXDGmZ-ugHtdEhsl6J0du_tTNy02ESnSyltRc4eGQ4oTUkwWokrcRI23J179wOzbt8ecnCxa9lzag4gXBbFeZ-FYjqRLfPBlIGvpwQpdF6RwUObEzTwBUCe9Wy_iKVdO9RQ2nQS6WFoQcGTLLOvVPZB1BhcVrnS329hs/s16000/hero-image.png'}),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
