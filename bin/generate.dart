import 'package:blogger_theme/blogger_theme.dart';
import 'dart:io';

// ==========================================================================
// 1. DART DECORATIVE VARIABLES & COMPONENT DEFINITIONS FOR BLOGGER HEAD (SEO, CSS, SCRIPTS)
// ==========================================================================

/// Viewport Related Meta tags
final metaViewportHead = Meta(
  attributes: {
    "content": "width=device-width, initial-scale=1.0",
    "name": "viewport"
  },
);

/// All Blogger Meta tags Auto added by blogger platform
final metaBloggerAllHeadContentHead = BInclude(name: "all-head-content", data: "blog");

/// Open Graph Meta tags
final metaOgTypeHead = Meta(
  attributes: {"property": "og:type", "content": "website"},
);

final metaGeoRegionHead = Meta(
  attributes: {"name": "geo.region", "content": "IN-HR"},
);

final metaContactPhoneHead = Meta(
  attributes: {"name": "contact.phone", "content": "+919813954763"},
);

/// Content Rating
final metaIsAdultContentHead = BIf(cond: "data:blog.adultContent", children: [
  Meta(
    attributes: {"name": "rating", "content": "adult"},
  )
]);

final metaIsGeneralContentHead = BIf(cond: "!data:blog.adultContent", children: [
  Meta(
    attributes: {"name": "rating", "content": "general"},
  )
]);

final metaIsGoogleAnalyticsHead = BIf(
    cond: "data:blog.analyticsAccountNumber",
    children: [BInclude(name: "google-analytics", data: "blog")]);

final metaSubjectHead = Meta(attributes: {
  "name": "subject",
  ...Expr.attr('content', '(data:view.isMultipleItems ? data:blog.pageTitle : data:view.title).escaped'),
});

final metaIsMetaDescriptionHead = BIf(cond: "data:blog.metaDescription", children: [
  Meta(attributes: {
    "name": "description",
    ...Expr.attr('content', 'data:blog.metaDescription'),
  })
]);

/// All Link Related
final linkHomeHead = Link(
  attributes: {
    "expr:href": 'data:blog.homepageUrl.canonical',
    "expr:title": 'data:messages.home',
    "rel": 'home',
  },
);

final linkSearchHead = Link(
  attributes: {
    ...Expr.attr('href', 'data:blog.homepageUrl.canonical path "search"'),
    "expr:title": 'data:messages.search',
    "rel": 'search',
  },
);

// Alternate mobile link (adds m=1 when not a mobile request and URL is canonical)
final linkAlternateMobileHead = BTag(
  name: "link",
  cond: '!data:blog.isMobileRequest and data:view.url ==  data:view.url.canonical',
  attributesz: {
    ...Expr.attr('href', 'data:view.url params {m: 1}'),
    "media": 'only screen and (max-width: 640px)',
    'rel': 'alternate',
  },
);

final linkImageSrcMultipleItemFirstFeaturedImageHead = BTag(
  name: "link",
  cond: 'data:view.isMultipleItems and data:widgets.Blog.first.posts[0].featuredImage',
  attributesz: {
    ...Expr.attr('href', 'data:widgets.Blog.first.posts[0].featuredImage resizeImage 1600'),
    'rel': 'image_src',
  },
);

final linkImageSrcSingleItemFeaturedImageHead = BTag(
  name: 'link',
  cond: 'data:view.isSingleItem and data:view.featuredImage',
  attributesz: {
    ...Expr.attr('href', 'data:view.featuredImage resizeImage 1600'),
    'rel': 'image_src',
  },
);

// ==========================================================================
// 2. JSON-LD STRUCTURED SCHEMAS (CLEAN DECLARATIVE Dart REPRESENTATIONS)
// ==========================================================================

// 1. WebSite Schema (Homepage only condition)
final ldWebSiteSchema = BIf(
  cond: 'data:view.isHomepage',
  children: [
    Script(
      type: "application/ld+json",
      childrenz: [
        Text('\n{\n'
            '  "@context": "http://schema.org",\n'
            '  "@type": "WebSite",\n'
            '  "name": "'),
        BData(value: 'blog.title'),
        Text('",\n'
            '  "description": "'),
        BData(value: 'view.description.escaped'),
        Text('",\n'
            '  "url": "'),
        BData(value: 'blog.canonicalHomepageUrl'),
        Text('",\n'
            '  "potentialAction": {\n'
            '    "@type": "SearchAction",\n'
            '    "target": "'),
        BData(value: 'blog.canonicalHomepageUrl'),
        Text('search?q={search_term_string}",\n'
            '    "query-input": "required name=search_term_string"\n'
            '  }\n'
            '}\n'),
      ],
    ),
  ],
);

// 2. BreadcrumbList Schema
final ldBreadcrumbSchema = Script(
  type: "application/ld+json",
  childrenz: [
    Text('\n{\n'
        '  "@context": "http://schema.org",\n'
        '  "@type": "BreadcrumbList",\n'
        '  "@id": "'),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text('",\n'
        '  "name": "'),
    BData(value: 'blog.title'),
    Text('",\n'
        '  "itemListElement": [\n'
        '    {\n'
        '      "@type": "ListItem",\n'
        '      "position": 1,\n'
        '      "name": "Home",\n'
        '      "item": "'),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text('"\n'
        '    },\n'
        '    {\n'
        '      "@type": "ListItem",\n'
        '      "position": 2,\n'
        '      "name": "About",\n'
        '      "item": "'),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text('p/about-us.html"\n'
        '    },\n'
        '    {\n'
        '      "@type": "ListItem",\n'
        '      "position": 3,\n'
        '      "name": "Contact Us",\n'
        '      "item": "'),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text('p/contact-us.html"\n'
        '    }\n'
        '  ]\n'
        '}\n'),
  ],
);

// 3. LocalBusiness Schema
final ldLocalBusinessSchema = Script(
  type: "application/ld+json",
  childrenz: [
    Text('\n{\n'
        '  "@context": "https://schema.org",\n'
        '  "@type": "LocalBusiness",\n'
        '  "name": "'),
    BData(value: 'blog.title'),
    Text('",\n'
        '  "url": "'),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text('",\n'
        '  "logo": "'),
    BData(value: 'blog.blogspotFaviconUrl'),
    Text('",\n'
        '  "image": "'),
    BData(value: 'blog.blogspotFaviconUrl'),
    Text('",\n'
        '  "sameAs": [\n'
        '    "https://www.facebook.com/profile.php?id=100080805714776",\n'
        '    "https://www.youtube.com/antinna",\n'
        '    "https://www.instagram.com/antinna.yt",\n'
        '    "https://github.com/antinna",\n'
        '    "https://play.google.com/store/apps/dev?id=7417258411166270372"\n'
        '  ],\n'
        '  "contactPoint": {\n'
        '    "@type": "ContactPoint",\n'
        '    "telephone": "+919813954763",\n'
        '    "contactType": "customer service",\n'
        '    "email": "contact@antinna.in",\n'
        '    "availableLanguage": ["en", "hi"]\n'
        '  }\n'
        '}\n'),
  ],
);

// 4. ProfessionalService Schema
final ldProfessionalServiceSchema = Script(
  type: "application/ld+json",
  childrenz: [
    Text('\n{\n'
        '  "@context": "https://schema.org",\n'
        '  "@type": "ProfessionalService",\n'
        '  "name": "'),
    BData(value: 'blog.title'),
    Text('",\n'
        '  "image": "'),
    BData(value: 'blog.blogspotFaviconUrl'),
    Text('",\n'
        '  "@id": "'),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text('",\n'
        '  "url": "'),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text('",\n'
        '  "telephone": "+919813954763",\n'
        '  "priceRange": "\$\$",\n'
        '  "address": {\n'
        '    "@type": "PostalAddress",\n'
        '    "streetAddress": "VijayPal Gautam Village Todi",\n'
        '    "addressLocality": "Charkhi Dadri",\n'
        '    "addressRegion": "Haryana",\n'
        '    "postalCode": "127312",\n'
        '    "addressCountry": "IN"\n'
        '  },\n'
        '  "geo": {\n'
        '    "@type": "GeoCoordinates",\n'
        '    "latitude": 28.5920617,\n'
        '    "longitude": 76.2652909\n'
        '  },\n'
        '  "openingHoursSpecification": {\n'
        '    "@type": "OpeningHoursSpecification",\n'
        '    "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],\n'
        '    "opens": "00:00",\n'
        '    "closes": "23:59"\n'
        '  },\n'
        '  "sameAs": [\n'
        '    "https://www.facebook.com/profile.php?id=100080805714776",\n'
        '    "https://www.instagram.com/antinna.yt/",\n'
        '    "https://youtube.com/antinna",\n'
        '    "https://github.com/antinna",\n'
        '    "https://play.google.com/store/apps/dev?id=7417258411166270372",\n'
        '    "'),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text('"\n'
        '  ]\n'
        '}\n'),
  ],
);

// 5. Project Schema
final ldProjectSchema = Script(
  type: "application/ld+json",
  childrenz: [
    Text('\n{\n'
        '  "@context": "https://schema.org",\n'
        '  "@type": "Project",\n'
        '  "name": "'),
    BData(value: 'blog.title'),
    Text('",\n'
        '  "url": "'),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text('",\n'
        '  "logo": "'),
    BData(value: 'blog.blogspotFaviconUrl'),
    Text('",\n'
        '  "contactPoint": [\n'
        '    {\n'
        '      "@type": "ContactPoint",\n'
        '      "telephone": "+919729323674",\n'
        '      "contactType": "Technical Support",\n'
        '      "areaServed": ["US","GB","CA","AF","ZM","YE","ZW","VN","VE","AX","AL","DZ","AS","AD","AO","AQ","AI","AG","AW","AM","AR","AT","AU","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","VA","VU","UZ","UY","UM","AE","UA","TV","VI","UG","TC","TT","TN","TR","TM","TG","TK","TO","TH","TZ","TJ","TW","CH","SY","SE","BR","BV","IO","VG","BN","BG","BF","BI","KH","CM","CV","KY","CF","TD","CL","CX","CN","CC","CO","KM","CK","HR","CR","CU","CW","CY","CZ","CD","DK","DE","GH","GI","GR","GL","GD","GP","GT","MF","LC","BL","SH","KN","RW","RO","RU","RE","CG","PT","PL","PR","QA","PH","PN","GN","GG","GU","GW","GY","HT","HM","HN","HK","HU","IS","ID","IN","IR","IQ","IE","IM","IT","IL","JP","JO","JM","JE","CI","KW","KG","LA","XK","KI","KE","KZ","LV","LB","LS","LY","LR","LT","LU","LI","PY","PE","PG","PA","PW","PS","PK","NO","OM","MP","KP","NI","NE","NG","NU","NF","NZ","NA","NP","NL","NR","NC","MM","MZ","MS","MN","ME","MA","MD","MC","FM","MX","MR","MU","YT","MQ","MH","MV","ML","MT","MW","MG","MY","MO","MK"],\n'
        '      "availableLanguage": ["en","Gujarati","Hindi","Tamil","Telugu","Urdu","Panjabi"]\n'
        '    },\n'
        '    {\n'
        '      "@type": "ContactPoint",\n'
        '      "telephone": "+919729323674",\n'
        '      "contactType": "customer service",\n'
        '      "areaServed": ["US","GB","CA","AF","ZM","YE","ZW","VN","VE","AX","AL","DZ","AS","AD","AO","AQ","AI","AG","AW","AM","AR","AT","AU","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","VA","VU","UZ","UY","UM","AE","UA","TV","VI","UG","TC","TT","TN","TR","TM","TG","TK","TO","TH","TZ","TJ","TW","CH","SY","SE","BR","BV","IO","VG","BN","BG","BF","BI","KH","CM","CV","KY","CF","TD","CL","CX","CN","CC","CO","KM","CK","HR","CR","CU","CW","CY","CZ","CD","DK","DE","GH","GI","GR","GL","GD","GP","GT","MF","LC","BL","SH","KN","RW","RO","RU","RE","CG","PT","PL","PR","QA","PH","PN","GN","GG","GU","GW","GY","HT","HM","HN","HK","HU","IS","ID","IN","IR","IQ","IE","IM","IT","IL","JP","JO","JM","JE","CI","KW","KG","LA","XK","KI","KE","KZ","LV","LB","LS","LY","LR","LT","LU","LI","PY","PE","PG","PA","PW","PS","PK","NO","OM","MP","KP","NI","NE","NG","NU","NF","NZ","NA","NP","NL","NR","NC","MM","MZ","MS","MN","ME","MA","MD","MC","FM","MX","MR","MU","YT","MQ","MH","MV","ML","MT","MW","MG","MY","MO","MK"],\n'
        '      "availableLanguage": ["en","Gujarati","Hindi","Tamil","Telugu","Urdu","Panjabi"]\n'
        '    }\n'
        '  ],\n'
        '  "sameAs": [\n'
        '    "https://www.facebook.com/profile.php?id=100082961891641",\n'
        '    "https://www.instagram.com/antinna.yt/",\n'
        '    "https://youtube.com/antinna",\n'
        '    "https://github.com/antinna",\n'
        '    "https://play.google.com/store/apps/dev?id=7417258411166270372",\n'
        '    "'),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text('"\n'
        '  ]\n'
        '}\n'),
  ],
);

final ldScriptSchemas = [
  ldWebSiteSchema,
  ldBreadcrumbSchema,
  ldLocalBusinessSchema,
  ldProfessionalServiceSchema,
  ldProjectSchema
];

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

class BloggerHead extends Component {
  const BloggerHead();

  @override
  Iterable<Component> build() => [
    metaViewportHead,
    metaBloggerAllHeadContentHead,
    metaOgTypeHead,
    metaGeoRegionHead,
    metaContactPhoneHead,
    linkHomeHead,
    linkSearchHead,
    metaIsGeneralContentHead,
    metaIsAdultContentHead,
    linkAlternateMobileHead,
    linkImageSrcMultipleItemFirstFeaturedImageHead,
    linkImageSrcSingleItemFeaturedImageHead,
    metaIsGoogleAnalyticsHead,

    // Core custom Title widget
    const BloggerTitle(),

    // Inject all JSON-LD schemas
    ...ldScriptSchemas,

    metaSubjectHead,
    metaIsMetaDescriptionHead,

    // Beautiful dynamic BSkin component using fully custom BGroup / BVariable definitions
    BSkin(
      r'''
/* ==========================================================================
   DESIGN TOKENS & SYSTEM THEME VARIABLES
   ========================================================================== */
:root {
  --primary-color: $(theme.primary.color);
  --secondary-color: $(theme.secondary.color);
  --dark-color: $(theme.dark.color);
  --light-color: $(theme.light.color);
  --bg-soft: $(theme.bg.soft);
  --text-main: $(theme.text.main);
  --text-muted: $(theme.text.muted);
  --border-color: $(theme.border.color);
}

*, *::before, *::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html {
  scroll-behavior: smooth;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
}

body {
  background-color: var(--bg-soft);
  color: var(--text-main);
  line-height: 1.6;
}

a {
  color: inherit;
  text-decoration: none;
  transition: all 0.2s ease;
}

img {
  max-width: 100%;
  height: auto;
  display: block;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

/* --- Typography --- */
h1, h2, h3, h4 {
  color: var(--dark-color);
  font-weight: 700;
  margin: 0 0 16px;
}

h1 {
  font-size: 48px;
  line-height: 1.1;
}

h2 {
  font-size: 32px;
  line-height: 1.2;
}

h3 {
  font-size: 22px;
}

/* --- Buttons --- */
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 12px 28px;
  font-size: 16px;
  font-weight: 600;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.25s ease;
  border: 2px solid transparent;
}

.btn-primary {
  background: var(--primary-color);
  color: var(--light-color);
}

.btn-primary:hover {
  background: var(--secondary-color);
  transform: translateY(-2px);
}

.btn-outline {
  border-color: var(--primary-color);
  color: var(--primary-color);
  background: transparent;
}

.btn-outline:hover {
  background: var(--primary-color);
  color: var(--light-color);
  transform: translateY(-2px);
}

/* --- Header & Nav --- */
header.site-header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(8px);
  border-bottom: 1px solid var(--border-color);
  z-index: 1000;
  box-shadow: 0 4px 20px rgba(0,0,0,0.02);
}

header.site-header .container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 80px;
}

.logo a {
  display: flex;
  align-items: center;
  font-size: 22px;
  font-weight: 800;
  color: var(--primary-color);
  gap: 8px;
}

.nav-links {
  display: flex;
  align-items: center;
  gap: 32px;
  font-weight: 500;
}

.nav-links a:hover {
  color: var(--primary-color);
}

/* --- Hero Section --- */
.hero {
  padding: 160px 0 100px;
  background: radial-gradient(circle at 80% 20%, rgba(56, 189, 248, 0.1) 0%, transparent 50%), var(--light-color);
  border-bottom: 1px solid var(--border-color);
}

.hero-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 48px;
  align-items: center;
}

.hero-content {
  max-width: 580px;
}

.hero-title {
  margin-bottom: 24px;
}

.hero-subtitle {
  font-size: 18px;
  color: var(--text-muted);
  margin-bottom: 32px;
}

.hero-buttons {
  display: flex;
  gap: 16px;
}

.hero-image img {
  border-radius: 20px;
  box-shadow: 0 20px 40px rgba(0,0,0,0.05);
}

/* --- Features / About Section --- */
.section-padding {
  padding: 100px 0;
}

.bg-white {
  background: var(--light-color);
}

.section-header {
  text-align: center;
  max-width: 650px;
  margin: 0 auto 60px;
}

.section-header p {
  font-size: 18px;
  color: var(--text-muted);
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 32px;
}

.feature-card {
  background: var(--bg-soft);
  padding: 40px;
  border-radius: 16px;
  border: 1px solid var(--border-color);
  transition: all 0.3s ease;
}

.feature-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 30px rgba(0,0,0,0.04);
  border-color: var(--primary-color);
}

.feature-icon {
  width: 48px;
  height: 48px;
  background: rgba(2, 86, 155, 0.1);
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--primary-color);
  margin-bottom: 24px;
  font-weight: bold;
}

/* --- Contact Section --- */
.contact-section {
  background: var(--light-color);
  border-top: 1px solid var(--border-color);
}

.contact-card {
  max-width: 600px;
  margin: 0 auto;
  background: var(--bg-soft);
  padding: 48px;
  border-radius: 24px;
  border: 1px solid var(--border-color);
}

.form-group {
  margin-bottom: 24px;
}

.form-group label {
  display: block;
  font-weight: 600;
  margin-bottom: 8px;
  color: var(--dark-color);
}

.form-control {
  width: 100%;
  padding: 14px 18px;
  border: 1px solid var(--border-color);
  background: var(--light-color);
  border-radius: 8px;
  font-size: 16px;
  transition: all 0.2s ease;
}

.form-control:focus {
  outline: none;
  border-color: var(--primary-color);
  box-shadow: 0 0 0 4px rgba(2, 86, 155, 0.1);
}

/* --- Footer --- */
footer.site-footer {
  background: var(--dark-color);
  color: #94a3b8;
  padding: 80px 0 40px;
  border-top: 1px solid #1e293b;
}

footer.site-footer h3, footer.site-footer h4 {
  color: var(--light-color);
}

.footer-grid {
  display: grid;
  grid-template-columns: 2fr 1fr 1.5fr;
  gap: 48px;
  margin-bottom: 60px;
}

.footer-col-about p {
  margin: 16px 0 24px;
  line-height: 1.7;
}

.social-links {
  display: flex;
  gap: 16px;
}

.social-icon {
  width: 40px;
  height: 40px;
  background: #1e293b;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--light-color);
  font-size: 18px;
}

.social-icon:hover {
  background: var(--primary-color);
}

.footer-links-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.footer-links-list li {
  margin-bottom: 12px;
}

.footer-links-list a:hover {
  color: var(--light-color);
}

.footer-bottom {
  border-top: 1px solid #1e293b;
  padding-top: 32px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 14px;
}

/* --- Single Post / Blog List Layout --- */
.blog-layout {
  padding: 120px 0 80px;
}

.blog-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 40px;
}

@media(min-width: 992px) {
  .blog-grid {
    grid-template-columns: 2.2fr 1fr;
  }
}

.post-card {
  background: var(--light-color);
  border-radius: 16px;
  border: 1px solid var(--border-color);
  overflow: hidden;
  margin-bottom: 32px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.01);
  display: flex;
  flex-direction: column;
}

.post-card-img img {
  width: 100%;
  height: 280px;
  object-fit: cover;
}

.post-card-content {
  padding: 32px;
}

.post-card-title {
  font-size: 24px;
  margin-bottom: 12px;
}

.post-meta {
  display: flex;
  align-items: center;
  gap: 16px;
  font-size: 14px;
  color: var(--text-muted);
  margin-bottom: 16px;
}

.post-snippet {
  color: var(--text-muted);
  font-size: 15px;
  margin-bottom: 24px;
}

/* Sidebar Widgets */
aside.sidebar {
  display: flex;
  flex-direction: column;
  gap: 32px;
}

.widget {
  background: var(--light-color);
  padding: 32px;
  border-radius: 16px;
  border: 1px solid var(--border-color);
}

.widget-title {
  font-size: 18px;
  border-bottom: 2px solid var(--primary-color);
  padding-bottom: 12px;
  margin-bottom: 20px;
}

/* Breadcrumbs */
.breadcrumbs {
  font-size: 14px;
  color: var(--text-muted);
  margin-bottom: 24px;
}

.breadcrumbs a {
  color: var(--primary-color);
}

/* Google Translate */
#google_translate_element {
  margin-left: 20px;
}

/* Cookie Choice Styling */
.cookie-choices-info {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  background: #0f172a;
  color: #fff;
  padding: 16px;
  text-align: center;
  z-index: 10000;
  font-size: 14px;
}

/* Responsiveness overrides */
@media(max-width: 991px) {
  h1 { font-size: 38px; }
  .hero-grid { grid-template-columns: 1fr; text-align: center; }
  .hero-content { max-width: 100%; }
  .hero-buttons { justify-content: center; }
  .footer-grid { grid-template-columns: 1fr; }
  .footer-bottom { flex-direction: column; gap: 16px; text-align: center; }
}
''',
      variables: [
        const BGroup(
          description: 'Theme Color Customisation Group',
          variables: [
            BVariable(name: 'theme.primary.color', description: 'Primary Color', type: 'color', defaultValue: '#02569B'),
            BVariable(name: 'theme.secondary.color', description: 'Secondary Hover Color', type: 'color', defaultValue: '#0175C2'),
            BVariable(name: 'theme.dark.color', description: 'Dark Slate Color', type: 'color', defaultValue: '#0f172a'),
            BVariable(name: 'theme.light.color', description: 'White Color', type: 'color', defaultValue: '#ffffff'),
            BVariable(name: 'theme.bg.soft', description: 'Background Muted Soft Color', type: 'color', defaultValue: '#f8fafc'),
            BVariable(name: 'theme.text.main', description: 'Main Text Gray Color', type: 'color', defaultValue: '#334155'),
            BVariable(name: 'theme.text.muted', description: 'Muted Muted Gray Color', type: 'color', defaultValue: '#64748b'),
            BVariable(name: 'theme.border.color', description: 'Light border color', type: 'color', defaultValue: '#e2e8f0'),
          ],
        ),
      ],
    ),
  ];
}

// ==========================================================================
// 3. DART DECLARATIVE COMPONENT DEFINITIONS FOR BLOGGER BODY (LAYOUT, WIDGETS)
// ==========================================================================

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

class ContactSection extends Component {
  const ContactSection();

  @override
  Iterable<Component> build() => [
    Section(
      attributes: {'class': 'section-padding', 'id': 'contact'},
      children: [
        Div(
          attributes: {'class': 'container'},
          children: [
            Div(
              attributes: {'class': 'section-header'},
              children: [
                H2(children: [Text('Start Your Project')]),
                P(children: [Text('Tell us about your architectural goals, timeline, and digital needs. Our Flutter specialists are ready to collaborate.')]),
              ],
            ),
            Div(
              attributes: {'class': 'contact-card'},
              children: [
                BSection(
                  id: 'contact-form-container',
                  children: [
                    BWidget(
                      id: 'ContactForm1',
                      type: 'ContactForm',
                      title: 'Contact Form',
                      locked: false,
                      version: 1,
                      children: [
                        BIncludable(
                          id: 'main',
                          children: [
                            Form(
                              attributes: {'name': 'contact-form'},
                              children: [
                                Div(
                                  attributes: {'class': 'form-group'},
                                  children: [
                                    Label(children: [Text('Full Name')]),
                                    Input(attributes: {'class': 'form-control', 'expr:id': 'data:widget.instanceId + "_contact-form-name"', 'name': 'name', 'placeholder': 'Your Name', 'type': 'text'}),
                                  ],
                                ),
                                Div(
                                  attributes: {'class': 'form-group'},
                                  children: [
                                    Label(children: [Text('Email Address')]),
                                    Input(attributes: {'class': 'form-control', 'expr:id': 'data:widget.instanceId + "_contact-form-email"', 'name': 'email', 'placeholder': 'you@example.com', 'type': 'text'}),
                                  ],
                                ),
                                Div(
                                  attributes: {'class': 'form-group'},
                                  children: [
                                    Label(children: [Text('Message Details')]),
                                    DomComponent('textarea', attributes: {'class': 'form-control', 'expr:id': 'data:widget.instanceId + "_contact-form-email-message"', 'name': 'email-message', 'placeholder': 'Detail your project parameters...', 'rows': '5'}),
                                  ],
                                ),
                                Input(attributes: {'class': 'btn btn-primary', 'style': 'width: 100%', 'expr:id': 'data:widget.instanceId + "_contact-form-submit"', 'expr:value': 'data:contactFormSendMsg', 'type': 'button'}),
                                Div(
                                  attributes: {'style': 'margin-top: 16px;'},
                                  children: [
                                    P(attributes: {'expr:id': 'data:widget.instanceId + "_contact-form-error-message"', 'style': 'color: red; font-size: 14px;'}),
                                    P(attributes: {'expr:id': 'data:widget.instanceId + "_contact-form-success-message"', 'style': 'color: green; font-size: 14px;'}),
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

class ClientInteractivityScripts extends Component {
  const ClientInteractivityScripts();

  @override
  Iterable<Component> build() => [
    RawText(r'''
<script>
  cookieOptions = {
    close: "Got it!",
    learn: "Privacy Policy",
    link: "<data:blog.canonicalHomepageUrl/>p/privacy-policy.html"
  };
</script>
<script>
  function validateSearch() {
    var searchQuery = document.querySelector("input[name='q']").value;
    if (searchQuery.trim() === "") {
      return false;
    }
    return true;
  }
</script>
<script>
  function googleTranslateElementInit() {
    new google.translate.TranslateElement(
      {
        pageLanguage: "en",
        layout: google.translate.TranslateElement.InlineLayout.SIMPLE
      },
      "google_translate_element"
    );
  }
</script>
<script defer='defer' src='https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit' type='text/javascript'/>
'''),
    BIf(
      cond: 'data:view.isHomepage',
      children: [
        RawText(r'''
  <script>
    const populateLatestPosts = (data) => {
      const entries = data.feed.entry || [];
      const container = document.getElementById("homepage-posts-container");
      if (!container) return;
      container.className = 'features-grid'; // Use features-grid layout for blog cards

      let html = '';
      entries.forEach(post => {
        const title = post.title.$t;
        const linkObj = post.link.find(l => l.rel === 'alternate');
        const link = linkObj ? linkObj.href : '#';
        const summary = post.summary ? post.summary.$t : '';
        const labels = post.category ? post.category.map(cat => cat.term) : [];
        const thumbnail = post.media$thumbnail ? post.media$thumbnail.url.replace('s72', 's400') : 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh7qj4GtXna090Q1-R8hIY69tpMdc9QWewEODYQCS2FV57askuUaOD87O4Qn2gY4FcgVY8C8e-ickla16fvzGPR9Na2tkejnBbn_xh9pCKmO9ZWd_y_g1fjbS2uJEoFUvx5cT1Pt6F29l0IUzDVHHksyxkGOimBRaxsWpn_6wlXGzPavsCpGAC7KPqIKn1E/s16000/thumbnail-placeholder.png';

        html += `
          <div class="feature-card" style="padding:0; overflow:hidden; display:flex; flex-direction:column;">
            <a href="${link}">
              <img alt="${title}" src="${thumbnail}" style="width:100%; height:200px; object-fit:cover;"/>
            </a>
            <div style="padding: 24px; display:flex; flex-direction:column; flex:1;">
              <h3 style="font-size:20px; margin-bottom:12px;"><a href="${link}">${title}</a></h3>
              <p style="font-size:14px; color:var(--text-muted); margin-bottom:20px; flex:1;">${summary}</p>
              <div>
                <a class="btn btn-outline" href="${link}" style="padding: 6px 16px; font-size:13px; border-radius:6px;">Read Insight</a>
              </div>
            </div>
          </div>
        `;
      });
      container.innerHTML = html;
    }
  </script>
  <script src='/feeds/posts/summary?alt=json-in-script&amp;max-results=3&amp;callback=populateLatestPosts'/>
'''),
      ],
    ),
  ];
}

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

// ==========================================================================
// 4. MAIN RUNTIME GENERATION LOGIC
// ==========================================================================

void main() {
  final theme = BloggerTheme(
    attributes: {
      'b:layoutsVersion': '3',
      'b:responsive': 'true',
      'expr:dir': 'data:blog.languageDirection',
      'expr:lang': 'data:blog.locale',
      'xmlns': 'http://www.w3.org/1999/xhtml',
      'xmlns:b': 'http://www.google.com/2005/gml/b',
      'xmlns:data': 'http://www.google.com/2005/gml/data',
      'xmlns:expr': 'http://www.google.com/2005/gml/expr',
    },
    head: [
      const BloggerHead(),
    ],
    body: [
      const BloggerBody(),
    ],
  );

  final xml = theme.generate();

  // Create local build directory and write Blogger Theme XML
  final buildDir = Directory('build');
  if (!buildDir.existsSync()) {
    buildDir.createSync(recursive: true);
  }

  final outputFile = File('build/blogger_theme.xml');
  outputFile.writeAsStringSync(xml);
  print('Successfully compiled blogger_theme programmatically!');
  print('Theme file compiled to: ${outputFile.path}');

  // Also maintain theme.xml at repo root for release artifact purposes
  final repoFile = File('theme.xml');
  repoFile.writeAsStringSync(xml);
  print('Root theme.xml written!');
}
