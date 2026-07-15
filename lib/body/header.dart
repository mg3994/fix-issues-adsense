import 'package:blogger_theme/blogger_theme.dart';

class SiteHeader extends Component {
  const SiteHeader();

  @override
  Iterable<Component> build() => [
    Header(
      attributes: {'class': 'site-header'},
      children: [
        Div(
          attributes: {'class': 'container'},
          children: [
            Div(
              attributes: {'class': 'logo'},
              children: [
                A(
                  attributes: {
                    'aria-label': 'Visit HireFlutter™ homepage',
                    'class': 'notranslate',
                    'expr:href': 'data:blog.homepageUrl',
                  },
                  children: [
                    RawText(r'''
<svg height='32' viewBox='0 0 200 200' width='32' xmlns='http://www.w3.org/2000/svg'>
  <defs>
    <radialGradient cx='50%' cy='50%' fx='50%' fy='50%' id='headGradient' r='50%'>
      <stop offset='0%' style='stop-color:#85C1E9; stop-opacity:1'/>
      <stop offset='100%' style='stop-color:#5DADE2; stop-opacity:1'/>
    </radialGradient>
  </defs>
  <circle cx='100' cy='100' fill='url(#headGradient)' r='80' stroke='#3498DB' stroke-width='4'/>
  <circle cx='70' cy='80' fill='#FFFFFF' r='20'/>
  <circle cx='70' cy='80' fill='#000000' r='10'/>
  <circle cx='130' cy='80' fill='#FFFFFF' r='20'/>
  <circle cx='130' cy='80' fill='#000000' r='10'/>
  <path d='M85,120 Q100,150 115,120 Q100,130 85,120 Z' fill='#F39C12' stroke='#D35400' stroke-width='2'/>
  <text fill='#F39C12' font-family='Arial, sans-serif' font-size='30' text-anchor='middle' x='50%' y='180'>HF</text>
</svg>
'''),
                    Span(children: [Text('HireFlutter™')]),
                  ],
                ),
              ],
            ),
            Nav(
              attributes: {'class': 'nav-links'},
              children: [
                A(attributes: {'expr:href': 'data:blog.homepageUrl'}, children: [Text('Home')]),
                A(attributes: {'expr:href': 'data:blog.homepageUrl + "p/about-us.html"'}, children: [Text('About Us')]),
                A(attributes: {'expr:href': 'data:blog.homepageUrl + "#services"'}, children: [Text('Services')]),
                A(attributes: {'expr:href': 'data:blog.homepageUrl + "#blog"'}, children: [Text('Blog')]),
                A(attributes: {'expr:href': 'data:blog.homepageUrl + "p/contact-us.html"'}, children: [Text('Contact Us')]),
                Div(attributes: {'id': 'google_translate_element'}),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
