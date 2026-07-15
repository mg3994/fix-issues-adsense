import 'package:blogger_theme/blogger_theme.dart';
import 'header.dart';
import 'hero.dart';
import 'services.dart';
import 'blog.dart';
import 'contact.dart';
import 'footer.dart';
import 'scripts.dart';

class BloggerBody extends Component {
  const BloggerBody();

  @override
  Iterable<Component> build() => [
    // Body conditional class
    RawText("<b:class cond='data:view.isSingleItem' name='single-item'/>"),

    // Modern Header/Nav component
    const SiteHeader(),

    // Homepage Layout Block
    RawText("<b:if cond='data:view.isHomepage'>"),
    const HeroSection(),
    const ExpertiseSection(),
    const HomepageBlogSection(),
    const ContactSection(),
    RawText("</b:if>"),

    // Subpages & Error layout Block
    const Error404Page(),
    const BlogLayout(),

    // Beautiful Responsive Footer
    const SiteFooter(),

    // Global Interactive Client Scripts
    const ClientInteractivityScripts(),
  ];
}
