import 'package:blogger_theme/blogger_theme.dart';

class SiteFooter extends Component {
  const SiteFooter();

  @override
  Iterable<Component> build() => [
    Footer(
      attributes: {'class': 'site-footer'},
      children: [
        Div(
          attributes: {'class': 'container footer-grid'},
          children: [
            Div(
              attributes: {'class': 'footer-col-about'},
              children: [
                H3(attributes: {'style': 'margin: 0 0 16px; font-size:22px;'}, children: [Text('HireFlutter™')]),
                P(children: [Text('Providing cutting-edge cross-platform mobile apps, architectural consulting, performance tuning, and clean software setups with state-of-the-art Flutter &amp; Dart engineering patterns.')]),
                Div(
                  attributes: {'class': 'social-links'},
                  children: [
                    A(attributes: {'aria-label': 'Visit our Facebook page', 'class': 'social-icon', 'href': 'https://www.facebook.com/profile.php?id=100080805714776'}, children: [Text('FB')]),
                    A(attributes: {'aria-label': 'Visit our Instagram profile', 'class': 'social-icon', 'href': 'https://www.instagram.com/antinna.yt/'}, children: [Text('IG')]),
                    A(attributes: {'aria-label': 'Visit our GitHub Organization', 'class': 'social-icon', 'href': 'https://github.com/antinna'}, children: [Text('GH')]),
                  ],
                ),
              ],
            ),
            Div(
              attributes: {'class': 'footer-col-links'},
              children: [
                H4(children: [Text('Quick Links')]),
                Ul(
                  attributes: {'class': 'footer-links-list'},
                  children: [
                    Li(children: [A(attributes: {'expr:href': 'data:blog.homepageUrl'}, children: [Text('Home')])]),
                    Li(children: [A(attributes: {'expr:href': 'data:blog.homepageUrl + "p/about-us.html"'}, children: [Text('About Us')])]),
                    Li(children: [A(attributes: {'expr:href': 'data:blog.homepageUrl + "p/contact-us.html"'}, children: [Text('Contact Us')])]),
                    Li(children: [A(attributes: {'expr:href': 'data:blog.homepageUrl + "#services"'}, children: [Text('Services')])]),
                    Li(children: [A(attributes: {'expr:href': 'data:blog.homepageUrl + "#blog"'}, children: [Text('Insights')])]),
                  ],
                ),
              ],
            ),
            Div(
              attributes: {'class': 'footer-col-links'},
              children: [
                H4(children: [Text('Legal & Support')]),
                Ul(
                  attributes: {'class': 'footer-links-list'},
                  children: [
                    Li(children: [A(attributes: {'expr:href': 'data:blog.homepageUrl + "p/privacy-policy.html"'}, children: [Text('Privacy Policy')])]),
                    Li(children: [A(attributes: {'expr:href': 'data:blog.homepageUrl + "p/disclaimer.html"'}, children: [Text('Disclaimer')])]),
                    Li(children: [A(attributes: {'expr:href': 'data:blog.homepageUrl + "p/termandconditions.html"'}, children: [Text('Terms & Conditions')])]),
                  ],
                ),
              ],
            ),
          ],
        ),
        Div(
          attributes: {'class': 'container footer-bottom'},
          children: [
            P(children: [RawText('&#169; 2026 HireFlutter. All Rights Reserved. Fully optimized for Google AdSense compliance.')]),
            P(children: [Text('Empowered by passion and high-end software craftsmanship.')]),
          ],
        ),
      ],
    ),
  ];
}
