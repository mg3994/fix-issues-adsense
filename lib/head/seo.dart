import 'package:blogger_theme/blogger_theme.dart';

// Viewport Related Meta tags
final metaViewportHead = Meta(
  attributes: {
    "content": "width=device-width, initial-scale=1.0",
    "name": "viewport"
  },
);

// All Blogger Meta tags Auto added by blogger platform
final metaBloggerAllHeadContentHead = BInclude(name: "all-head-content", data: "blog");

// Open Graph Meta tags
final metaOgTypeHead = Meta(
  attributes: {"property": "og:type", "content": "website"},
);

final metaGeoRegionHead = Meta(
  attributes: {"name": "geo.region", "content": "IN-HR"},
);

final metaContactPhoneHead = Meta(
  attributes: {"name": "contact.phone", "content": "+919813954763"},
);

// Content Rating
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

// All Link Related
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
    Text(r'''
{
  "@context": "https://schema.org",
  "@type": "ProfessionalService",
  "name": "'''),
    BData(value: 'blog.title'),
    Text(r'''",
  "image": "'''),
    BData(value: 'blog.blogspotFaviconUrl'),
    Text(r'''",
  "@id": "'''),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text(r'''",
  "url": "'''),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text(r'''",
  "telephone": "+919813954763",
  "priceRange": "$$",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "VijayPal Gautam Village Todi",
    "addressLocality": "Charkhi Dadri",
    "addressRegion": "Haryana",
    "postalCode": "127312",
    "addressCountry": "IN"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": 28.5920617,
    "longitude": 76.2652909
  },
  "openingHoursSpecification": {
    "@type": "OpeningHoursSpecification",
    "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
    "opens": "00:00",
    "closes": "23:59"
  },
  "sameAs": [
    "https://www.facebook.com/profile.php?id=100080805714776",
    "https://www.instagram.com/antinna.yt/",
    "https://youtube.com/antinna",
    "https://github.com/antinna",
    "https://play.google.com/store/apps/dev?id=7417258411166270372",
    "'''),
    BData(value: 'blog.canonicalHomepageUrl'),
    Text(r'''"
  ]
}
'''),
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

final seoHeadList = [
  metaViewportHead,
  metaBloggerAllHeadContentHead,
  metaOgTypeHead,
  metaGeoRegionHead,
  metaContactPhoneHead,
  metaIsAdultContentHead,
  metaIsGeneralContentHead,
  metaIsGoogleAnalyticsHead,
  metaSubjectHead,
  metaIsMetaDescriptionHead,
  linkHomeHead,
  linkSearchHead,
  linkAlternateMobileHead,
  linkImageSrcMultipleItemFirstFeaturedImageHead,
  linkImageSrcSingleItemFeaturedImageHead,
  ldWebSiteSchema,
  ldBreadcrumbSchema,
  ldLocalBusinessSchema,
  ldProfessionalServiceSchema,
  ldProjectSchema
];
