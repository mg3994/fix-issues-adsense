import 'package:blogger_theme/blogger_theme.dart';
import 'dart:io';

void main() {
  // Let's design a top-tier, highly optimized, AdSense compliant Blogger Theme.
  // We will build components using blogger_theme's declarative API and output to 'theme.xml'.

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
      // Schema.org Structured Data
      RawText(r'''
<script type='application/ld+json'>{
  "@context":"http://schema.org",
  "@type":"WebSite",
  "name":"<data:blog.title/>",
  "description": "<data:view.description.escaped/>",
  "url":"<data:blog.canonicalHomepageUrl/>",
  "potentialAction":{
    "@type":"SearchAction",
    "target":"<data:blog.canonicalHomepageUrl/>search?q={search_term_string}",
    "query-input":"required name=search_term_string"
  }
}</script>
<script type='application/ld+json'>{
  "@context": "http://schema.org",
  "@type": "BreadcrumbList",
  "@id": "<data:blog.canonicalHomepageUrl/>",
  "name": "<data:blog.title/>",
  "itemListElement": [{
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "<data:blog.canonicalHomepageUrl/>"
      },
      {
      "@type": "ListItem",
      "position": 2,
      "name": "About",
      "item": "<data:blog.canonicalHomepageUrl/>p/about-us.html"
      },
      {
      "@type": "ListItem",
      "position": 3,
      "name": "Contact Us",
      "item": "<data:blog.canonicalHomepageUrl/>p/contact-us.html"
      }
    ]
}</script>
<script type='application/ld+json'>{
  "@context": "https://schema.org/",
  "@type": "Person",
  "name": "<data:blog.title/>",
  "url": "<data:blog.canonicalHomepageUrl/>",
  "image": "<data:blog.blogspotFaviconUrl/>",
  "sameAs": [
    "https://www.facebook.com/profile.php?id=100080805714776",
    "https://www.instagram.com/antinna.yt/",
    "https://youtube.com/antinna",
    "https://github.com/antinna",
    "<data:blog.canonicalHomepageUrl/>"
  ],
  "jobTitle": "Flutter Developer",
  "worksFor": {
    "@type": "Organization",
    "name": "<data:blog.title/>"
  }
}</script>
<script type='application/ld+json'>{
  "@context": "https://schema.org",
  "@type": "ProfessionalService",
  "name": "<data:blog.title/>",
  "image": "<data:blog.blogspotFaviconUrl/>",
  "@id": "<data:blog.canonicalHomepageUrl/>",
  "url": "<data:blog.canonicalHomepageUrl/>",
  "telephone": "+919813954763",
  "priceRange": "$$",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "VijayPal Gautam Village Todi",
    "addressLocality": "Charkhi Dadri",
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
    "dayOfWeek": [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ],
    "opens": "00:00",
    "closes": "23:59"
  },
   "sameAs": [
    "https://www.facebook.com/profile.php?id=100080805714776",
    "https://www.instagram.com/antinna.yt/",
    "https://youtube.com/antinna",
    "https://github.com/antinna",
    "<data:blog.canonicalHomepageUrl/>"
  ]
}</script>
<script type='application/ld+json'>{
  "@context": "https://schema.org",
  "@type": "Project",
  "name": "<data:blog.title/>",
  "url": "<data:blog.canonicalHomepageUrl/>",
  "logo": "<data:blog.blogspotFaviconUrl/>",
  "contactPoint": [
    {
      "@type": "ContactPoint",
      "telephone": "+919729323674",
      "contactType": "technical support",
      "areaServed": ["US","GB","CA","AF","ZM","YE","ZW","VN","VE","AX","AL","DZ","AS","AD","AO","AQ","AI","AG","AW","AM","AR","AT","AU","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","VA","VU","UZ","UY","UM","AE","UA","TV","VI","UG","TC","TT","TN","TR","TM","TG","TK","TO","TH","TZ","TJ","TW","CH","SY","SE","BR","BV","IO","VG","BN","BG","BF","BI","KH","CM","CV","KY","CF","TD","CL","CX","CN","CC","CO","KM","CK","HR&quot;","CR","CU","CW","CY","CZ","CD","DK","DJ","DM","DO","TL","EG","SV","EC","GQ","EE","ER","ET","FK","FO","FJ","FI","FR","PF","TF","GA","GM","SZ","SR","SJ","SD","SS","ES","LK","KR","GS","ZA","SO","SB","SI","SK","SG","SX","SL","SC","SN","SA","RS","PM","VC","SM","WS","ST","GE","DE","GH","GI","GR","GL","GD","GP","GT","MF","LC","BL","SH","KN","RW","RO","RU","RE","CG","PT","PL","PR","QA","PH","PN","GN","GG","GU","GW","GY","HT","HM","HN","HK","HU","IS","ID","IN","IR","IQ","IE","IM","IT","IL","JP","JO","JM","JE","CI","KW","KG","LA","XK","KI","KE","KZ","LV","LB","LS","LY","LR","LT","LU","LI","PY","PE","PG","PA","PW","PS","PK","NO","OM","MP","KP","NI","NE","NG","NU","NF","NZ","NA","NP","NL","NR","NC","MM","MZ","MS","MN","ME","MA","MD","MC","FM","MX","MR","MU","YT","MQ","MH&quot;","MV","ML","MT","MW","MG","MY","MO","MK"],
      "availableLanguage": ["en","Gujarati","Hindi","Tamil","Telugu","Urdu","Panjabi"]
    },
    {
      "@type": "ContactPoint",
      "telephone": "+919729323674",
      "contactType": "customer service",
      "areaServed": ["US","GB","CA","AF","ZM","YE","ZW","VN","VE","AX","AL","DZ","AS","AD","AO","AQ","AI","AG","AW","AM","AR","AT","AU","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BQ","BA","BW","VA","VU","UZ","UY","UM","AE","UA","TV","VI","UG","TC","TT","TN","TR","TM","TG","TK","TO","TH","TZ","TJ","TW","CH","SY","SE","BR","BV","IO","VG","BN","BG","BF","BI","KH","CM","CV","KY","CF","TD","CL","CX","CN","CC","CO","KM","CK","HR","CR","CU","CW","CY","CZ","CD","DK","DJ","DM","DO","TL","EG","SV","EC","GQ","EE","ER","ET","FK","FO","FJ","FI","FR","PF","TF","GA","GM","SZ","SR","SJ","SD","SS","ES","LK","KR","GS","ZA","SO","SB","SI","SK","SG","SX","SL","SC","SN","SA","RS","PM","VC","SM","WS","ST","GE","DE","GH","GI","GR","GL","GD","GP","GT","MF","LC","BL","SH","KN","RW","RO","RU","RE","CG","PT","PL","PR","QA","PH","PN","GN","GG","GU","GW","GY","HT","HM","HN","HK","HU","IS","ID","IN","IR","IQ","IE","IM","IT","IL","JP","JO","JM","JE","CI","KW","KG","LA","XK","KI","KE","KZ","LV","LB","LS","LY","LR","LT","LU","LI","PY","PE","PG","PA","PW","PS","PK","NO","OM","MP","KP","NI","NE","NG","NU","NF","NZ","NA","NP","NL","NR","NC","MM","MZ","MS","MN","ME","MA","MD","MC","FM","MX","MR","MU","YT","MQ","MH","MV","ML","MT","MW","MG","MY","MO","MK"],
      "availableLanguage": ["en","Gujarati","Hindi","Tamil","Telugu","Urdu","Panjabi"]
    }
  ],
  "sameAs": [
    "https://www.facebook.com/profile.php?id=100080805714776",
    "https://www.instagram.com/antinna.yt/",
    "https://youtube.com/antinna",
    "https://github.com/antinna",
    "<data:blog.canonicalHomepageUrl/>"
  ]
}</script>
'''),
      Meta(attributes: {'content': 'width=device-width, initial-scale=1, minimum-scale=1', 'name': 'viewport'}),
      RawText('<b:include data=\'blog\' name=\'all-head-content\'/>'),
      RawText('''
<b:if cond='!data:blog.adultContent'>
  <meta content='general' name='rating'/>
</b:if>
<b:tag cond='data:view.isMultipleItems and data:widgets.Blog.first.posts[0].featuredImage' expr:href='data:widgets.Blog.first.posts[0].featuredImage resizeImage 1600' name='link' rel='image_src'/>
<b:tag cond='data:view.isSingleItem and data:view.featuredImage' expr:href='data:view.featuredImage resizeImage 1600' name='link' rel='image_src'/>
<b:if cond='data:blog.analyticsAccountNumber'>
  <b:include data='blog' name='google-analytics'/>
</b:if>
<meta content='IN-HR' name='geo.region'/>
<meta content='+919813954763' name='contact.phone'/>
'''),
      RawText('''
<b:if cond='data:blog.pageType in {&quot;index&quot;} and data:blog.pageName == &quot;&quot; and data:blog.homepageUrl != data:blog.url'>
  <title>All Posts - <data:blog.title/></title>
</b:if>
<b:if cond='data:blog.homepageUrl == data:blog.url'>
  <title><data:blog.pageTitle/></title>
<b:else/>
  <b:if cond='data:blog.pageType in {&quot;item&quot;,&quot;static_page&quot;}'>
    <title><data:blog.pageName/> - <data:blog.title/></title>
    <meta content='article' property='og:type'/>
  <b:else/>
    <b:if cond='data:view.isLabelSearch'>
      <title>Posts Tagged: <data:blog.searchLabel/> - <data:blog.title/></title>
    <b:else/>
      <b:if cond='data:view.isSearch'>
        <title>Search Results for: <data:blog.searchQuery/> - <data:blog.title/></title>
      <b:else/>
        <b:if cond='data:blog.pageType in {&quot;error_page&quot;}'>
          <title>Page Not Found - <data:blog.title/></title>
        </b:if>
      </b:if>
    </b:if>
  </b:if>
</b:if>
<b:if cond='data:blog.postImageUrl'>
  <meta expr:content='data:blog.postImageUrl' property='og:image'/>
<b:else/>
  <b:if cond='data:blog.postImageThumbnailUrl'>
    <meta expr:content='data:blog.postImageThumbnailUrl' property='og:image'/>
  </b:if>
</b:if>
<b:if cond='data:blog.metaDescription != &quot;&quot;'>
  <meta expr:content='data:blog.metaDescription' name='og:description'/>
</b:if>
<meta expr:content='data:blog.title' property='og:site_name'/>
<meta expr:content='data:blog.homepageUrl' name='twitter:domain'/>
<meta expr:content='data:blog.pageName' name='twitter:title'/>
<b:if cond='data:blog.postImageUrl'>
  <meta content='summary_large_image' name='twitter:card'/>
  <meta expr:content='data:blog.postImageUrl' name='twitter:image'/>
<b:else/>
  <meta content='summary' name='twitter:card'/>
  <b:if cond='data:blog.postImageThumbnailUrl'>
    <meta expr:content='data:blog.postImageThumbnailUrl' name='twitter:image'/>
  </b:if>
</b:if>
<b:if cond='data:blog.metaDescription'>
  <meta expr:content='data:blog.metaDescription' name='twitter:description'/>
</b:if>
'''),
      BSkin(
        '''
/* --- CSS Resets & Base --- */
*, *::before, *::after {
  box-sizing: border-box;
}

:root {
  --primary-color: #02569B;
  --secondary-color: #0175C2;
  --dark-color: #0f172a;
  --light-color: #ffffff;
  --bg-soft: #f8fafc;
  --text-main: #334155;
  --text-muted: #64748b;
  --accent-color: #38bdf8;
  --border-color: #e2e8f0;
}

html {
  scroll-behavior: smooth;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
}

body {
  margin: 0;
  color: var(--text-main);
  background: var(--bg-soft);
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
      ),
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
''')
    ],
    body: [
      // Body Class Conditional
      RawText("<b:class cond='data:view.isSingleItem' name='single-item'/>"),

      // Global Header/Nav
      RawText(r'''
<header class='site-header'>
  <div class='container'>
    <div class='logo'>
      <a aria-label='Visit HireFlutter™ homepage' class='notranslate' expr:href='data:blog.homepageUrl'>
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
        <span>HireFlutter™</span>
      </a>
    </div>
    <nav class='nav-links'>
      <a expr:href='data:blog.homepageUrl'>Home</a>
      <a expr:href='data:blog.homepageUrl + &quot;p/about-us.html&quot;'>About Us</a>
      <a expr:href='data:blog.homepageUrl + &quot;#services&quot;'>Services</a>
      <a expr:href='data:blog.homepageUrl + &quot;#blog&quot;'>Blog</a>
      <a expr:href='data:blog.homepageUrl + &quot;p/contact-us.html&quot;'>Contact Us</a>
      <div id='google_translate_element'></div>
    </nav>
  </div>
</header>
'''),

      // Conditional Content: Homepage vs Subpages
      RawText(r'''
<b:if cond='data:view.isHomepage'>
  <!-- Hero Section -->
  <section class='hero'>
    <div class='container hero-grid'>
      <div class='hero-content'>
        <h1 class='hero-title'>Hire World-Class Flutter Developers &amp; Experts</h1>
        <p class='hero-subtitle'>We craft responsive, high-performance cross-platform mobile apps, manage Dart workspaces, design robust monorepos, and deploy clean state management architectures.</p>
        <div class='hero-buttons'>
          <a class='btn btn-primary' href='p/contact-us.html'>Hire Us Now</a>
          <a class='btn btn-outline' href='#blog'>Explore Insights</a>
        </div>
      </div>
      <div class='hero-image'>
        <img alt='Flutter development' src='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEggpy8Livium-5MkYeTpFA6HdtwmXDGmZ-ugHtdEhsl6J0du_tTNy02ESnSyltRc4eGQ4oTUkwWokrcRI23J179wOzbt8ecnCxa9lzag4gXBbFeZ-FYjqRLfPBlIGvpwQpdF6RwUObEzTwBUCe9Wy_iKVdO9RQ2nQS6WFoQcGTLLOvVPZB1BhcVrnS329hs/s16000/hero-image.png'/>
      </div>
    </div>
  </section>

  <!-- About / Benefits Section -->
  <section class='section-padding' id='services'>
    <div class='container'>
      <div class='section-header'>
        <h2>Our Deep Architectural Expertise</h2>
        <p>Providing premium and clean Flutter services with structured codebases and modern software design patterns.</p>
      </div>
      <div class='features-grid'>
        <div class='feature-card'>
          <div class='feature-icon'>1</div>
          <h3>Monorepos &amp; Dart Workspaces</h3>
          <p>We build production-ready systems structuring monorepos with precise Melos configurations to streamline dependency management, testing, and continuous delivery pipelines.</p>
        </div>
        <div class='feature-card'>
          <div class='feature-icon'>2</div>
          <h3>State Management &amp; DI</h3>
          <p>We deploy robust state-management schemes (Bloc, Riverpod) combined with elegant Dependency Injection to ensure highly testable, scalable, and modular application layers.</p>
        </div>
        <div class='feature-card'>
          <div class='feature-icon'>3</div>
          <h3>High Performance &amp; Custom UI</h3>
          <p>From complex responsive layouts to high-performance rendering optimizations and platform-channel integrations, we craft beautiful apps without compromises.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Latest Insights / Blog Posts on Homepage -->
  <section class='section-padding bg-white' id='blog'>
    <div class='container'>
      <div class='section-header'>
        <h2>Latest Technical Insights</h2>
        <p>Deep dives into Dart, Flutter, and complex software architectural decisions directly from our core engineering team.</p>
      </div>
      <div class='services-container' id='homepage-posts-container'>
        <!-- Posts will dynamically load here or be managed by Blogger widget -->
      </div>
      <div style='text-align: center; margin-top: 48px;'>
        <a class='btn btn-outline' expr:href='data:blog.canonicalUrl + &quot;search?max-results=15&quot;'>View All Articles</a>
      </div>
    </div>
  </section>

  <!-- Contact Form on Homepage -->
  <section class='section-padding' id='contact'>
    <div class='container'>
      <div class='section-header'>
        <h2>Start Your Project</h2>
        <p>Tell us about your architectural goals, timeline, and digital needs. Our Flutter specialists are ready to collaborate.</p>
      </div>
      <div class='contact-card'>
        <b:section id='contact-form-container'>
          <b:widget id='ContactForm1' locked='false' title='Contact Form' type='ContactForm' version='1'>
            <b:includable id='main'>
              <form name='contact-form'>
                <div class='form-group'>
                  <label>Full Name</label>
                  <input class='form-control' expr:id='data:widget.instanceId + &quot;_contact-form-name&quot;' name='name' placeholder='Your Name' type='text'/>
                </div>
                <div class='form-group'>
                  <label>Email Address</label>
                  <input class='form-control' expr:id='data:widget.instanceId + &quot;_contact-form-email&quot;' name='email' placeholder='you@example.com' type='text'/>
                </div>
                <div class='form-group'>
                  <label>Message Details</label>
                  <textarea class='form-control' expr:id='data:widget.instanceId + &quot;_contact-form-email-message&quot;' name='email-message' placeholder='Detail your project parameters...' rows='5'></textarea>
                </div>
                <input class='btn btn-primary' style='width: 100%' expr:id='data:widget.instanceId + &quot;_contact-form-submit&quot;' expr:value='data:contactFormSendMsg' type='button'/>
                <div style='margin-top: 16px;'>
                  <p expr:id='data:widget.instanceId + &quot;_contact-form-error-message&quot;' style='color: red; font-size: 14px;'></p>
                  <p expr:id='data:widget.instanceId + &quot;_contact-form-success-message&quot;' style='color: green; font-size: 14px;'></p>
                </div>
              </form>
            </b:includable>
          </b:widget>
        </b:section>
      </div>
    </div>
  </section>
</b:if>
'''),

      // Error 404 Page Layout
      RawText(r'''
<b:if cond='data:view.isError'>
  <div class='blog-layout'>
    <div class='container' style='text-align: center; padding: 100px 0;'>
      <h1 style='font-size: 120px; color: var(--primary-color); margin: 0;'>404</h1>
      <h2>Page Not Found</h2>
      <p style='color: var(--text-muted); font-size: 18px; margin-bottom: 32px;'>The page you are looking for does not exist or has been relocated.</p>
      <a class='btn btn-primary' expr:href='data:blog.homepageUrl'>Return Home</a>
    </div>
  </div>
</b:if>
'''),

      // Single post & Blog Archive/Category/Label Pages
      RawText(r'''
<b:if cond='not data:view.isHomepage and not data:view.isError'>
  <div class='blog-layout'>
    <div class='container blog-grid'>
      <!-- Left Main Content Column -->
      <main class='main-content'>
        <b:section id='blog-container'>
          <b:widget id='Blog1' locked='false' title='Blog Posts' type='Blog' version='1'>
            <b:includable id='main' var='top'>
              <div class='blog-posts'>
                <b:loop values='data:posts' var='post'>
                  <!-- Structured data markers -->
                  <meta expr:content='data:post.url' itemprop='mainEntityOfPage'/>
                  <meta expr:content='data:post.timestampISO8601' itemprop='dateModified'/>
                  <span itemprop='publisher' itemscope='itemscope' itemtype='https://schema.org/Organization'>
                     <meta expr:content='data:blog.title' itemprop='name'/>
                     <span itemprop='logo' itemscope='itemscope' itemtype='https://schema.org/ImageObject'>
                        <meta expr:content='data:blog.homepageUrl + &quot;favicon.ico&quot;' itemprop='url'/>
                        <meta content='500' itemprop='width'/>
                     </span>
                  </span>
                  <span itemprop='author' itemscope='itemscope' itemtype='https://schema.org/Person'>
                     <meta expr:content='data:post.authorProfileUrl' itemprop='url'/>
                     <meta expr:content='data:post.author' itemprop='name'/>
                  </span>
                  <b:if cond='data:post.firstImageUrl'>
                     <div itemprop='image' itemscope='itemscope' itemtype='https://schema.org/ImageObject'>
                        <meta expr:content='data:post.firstImageUrl' itemprop='url'/>
                        <meta content='700' itemprop='width'/>
                        <meta content='700' itemprop='height'/>
                     </div>
                  </b:if>

                  <!-- Dynamic Rendering -->
                  <b:if cond='data:view.isSingleItem'>
                    <!-- Single Article View -->
                    <div class='breadcrumbs'>
                      <a expr:href='data:blog.homepageUrl'>Home</a> &gt;
                      <b:if cond='data:post.labels'>
                        <b:loop values='data:post.labels' var='label'>
                          <a expr:href='data:label.url'><data:label.name/></a>
                        </b:loop>
                      </b:if> &gt;
                      <strong><data:post.title/></strong>
                    </div>
                    <article class='single-post'>
                      <h1 class='post-heading'><data:post.title/></h1>
                      <div class='post-meta'>
                        <span>By <strong><data:post.author/></strong></span>
                        <span>Published <strong><data:post.timestamp/></strong></span>
                      </div>
                      <div class='post-body entry-content' style='background:#fff; padding: 40px; border-radius: 16px; border:1px solid var(--border-color); margin-top:32px;'>
                        <data:post.body/>
                      </div>
                    </article>

                    <!-- Comments section -->
                    <b:include data='post' name='comment_picker'/>
                  </b:if>

                  <b:if cond='data:view.isMultipleItems'>
                    <!-- Blog Post Listings / Cards -->
                    <div class='post-card'>
                      <div class='post-card-img'>
                        <a expr:href='data:post.url'>
                          <b:if cond='data:post.firstImageUrl'>
                            <img expr:alt='data:post.title' expr:src='data:post.firstImageUrl'/>
                          <b:else/>
                            <img expr:alt='data:post.title' src='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh7qj4GtXna090Q1-R8hIY69tpMdc9QWewEODYQCS2FV57askuUaOD87O4Qn2gY4FcgVY8C8e-ickla16fvzGPR9Na2tkejnBbn_xh9pCKmO9ZWd_y_g1fjbS2uJEoFUvx5cT1Pt6F29l0IUzDVHHksyxkGOimBRaxsWpn_6wlXGzPavsCpGAC7KPqIKn1E/s16000/thumbnail-placeholder.png'/>
                          </b:if>
                        </a>
                      </div>
                      <div class='post-card-content'>
                        <div class='post-meta'>
                          <span>By <strong><data:post.author/></strong></span>
                          <span><data:post.timestamp/></span>
                        </div>
                        <h2 class='post-card-title'>
                          <a expr:href='data:post.url'><data:post.title/></a>
                        </h2>
                        <p class='post-snippet'><b:eval expr='data:post.snippet'/></p>
                        <a class='btn btn-outline' expr:href='data:post.url' style='padding: 8px 20px; font-size:14px;'>Read Article</a>
                      </div>
                    </div>
                  </b:if>
                </b:loop>

                <!-- Navigation / Older Posts -->
                <b:if cond='data:view.isMultipleItems'>
                  <b:if cond='data:olderPageUrl'>
                    <div style='margin-top: 32px;'>
                      <a class='btn btn-outline' expr:href='data:olderPageUrl'>Older Articles</a>
                    </div>
                  </b:if>
                </b:if>
              </div>
            </b:includable>
            <b:includable id='comment_picker' var='post'>
              <b:if cond='data:post.showThreadedComments'>
                <b:include data='post' name='threaded_comments'/>
              <b:else/>
                <b:include data='post' name='comments'/>
              </b:if>
            </b:includable>
            <b:includable id='comments' var='post'>
              <div class='comments widget' id='comments' style='margin-top: 40px;'>
                <h4>Comments</h4>
                <b:if cond='data:post.allowComments'>
                  <div expr:id='data:widget.instanceId + &quot;_comments-block-wrapper&quot;'>
                    <b:loop values='data:post.comments' var='comment'>
                      <div class='comment-block' style='padding: 16px 0; border-bottom: 1px solid var(--border-color);'>
                        <strong><data:comment.author/></strong> says:
                        <p><data:comment.body/></p>
                      </div>
                    </b:loop>
                  </div>
                  <b:include data='post' name='comment-form'/>
                </b:if>
              </div>
            </b:includable>
            <b:includable id='comment-form' var='post'>
              <div class='comment-form' style='margin-top: 24px;'>
                <h4>Add Comment</h4>
                <iframe allowtransparency='true' class='blogger-comment-from-post' expr:height='data:cmtIframeInitialHeight' frameborder='0' id='comment-editor' name='comment-editor' src='' width='100%'/>
                <data:post.cmtfpIframe/>
                <script type='text/javascript'> BLOG_CMT_createIframe(&#39; <data:post.appRpcRelayPath/> &#39;); </script>
              </div>
            </b:includable>
            <b:includable id='threaded_comments' var='post'>
              <div class='comments widget' id='comments' style='margin-top: 40px;'>
                <h4>Threaded Comments</h4>
                <div id='comment-holder'><data:post.commentHtml/></div>
                <b:include data='post' name='threaded-comment-form'/>
              </div>
            </b:includable>
            <b:includable id='threaded-comment-form' var='post'>
              <div class='comment-form' style='margin-top: 24px;'>
                <iframe allowtransparency='true' class='blogger-comment-from-post' expr:height='data:cmtIframeInitialHeight' frameborder='0' id='comment-editor' name='comment-editor' src='' width='100%'/>
                <data:post.cmtfpIframe/>
                <script type='text/javascript'> BLOG_CMT_createIframe(&#39; <data:post.appRpcRelayPath/> &#39;); </script>
              </div>
            </b:includable>
          </b:widget>
        </b:section>
      </main>

      <!-- Right Column Sidebar -->
      <aside class='sidebar'>
        <b:section id='popular-posts-container'>
          <b:widget id='PopularPosts1' locked='false' title='Popular Posts' type='PopularPosts' version='1'>
            <b:widget-settings>
              <b:widget-setting name='numItemsToShow'>3</b:widget-setting>
              <b:widget-setting name='showThumbnails'>true</b:widget-setting>
              <b:widget-setting name='showSnippets'>true</b:widget-setting>
              <b:widget-setting name='timeRange'>LAST_YEAR</b:widget-setting>
            </b:widget-settings>
            <b:includable id='main'>
              <div class='widget'>
                <h3 class='widget-title'>Popular Content</h3>
                <div class='popular-list'>
                  <b:loop values='data:posts' var='post'>
                    <div style='margin-bottom: 20px;'>
                      <a expr:href='data:post.href' style='font-weight:600; font-size:15px; color:var(--dark-color); display:block; margin-bottom:4px;'><data:post.title/></a>
                      <span style='font-size:13px; color:var(--text-muted);'><b:eval expr='data:post.snippet'/></span>
                    </div>
                  </b:loop>
                </div>
              </div>
            </b:includable>
          </b:widget>
        </b:section>

        <!-- Categories / Labels -->
        <b:section id='labels-container'>
          <b:widget id='Label1' locked='false' title='Categories' type='Label' version='1'>
            <b:includable id='main'>
              <div class='widget'>
                <h3 class='widget-title'>Categories</h3>
                <div style='display:flex; flex-wrap:wrap; gap:8px;'>
                  <b:loop values='data:labels' var='label'>
                    <a expr:href='data:label.url' style='padding:6px 12px; background:var(--bg-soft); border-radius:20px; font-size:13px; border:1px solid var(--border-color); font-weight:500;'>
                      <data:label.name/> (<data:label.count/>)
                    </a>
                  </b:loop>
                </div>
              </div>
            </b:includable>
          </b:widget>
        </b:section>
      </aside>
    </div>
  </div>
</b:if>
'''),

      // Global Footer
      RawText(r'''
<footer class='site-footer'>
  <div class='container footer-grid'>
    <div class='footer-col-about'>
      <h3 style='margin: 0 0 16px; font-size:22px;'>HireFlutter™</h3>
      <p>Providing cutting-edge cross-platform mobile apps, architectural consulting, performance tuning, and clean software setups with state-of-the-art Flutter &amp; Dart engineering patterns.</p>
      <div class='social-links'>
        <a aria-label='Visit our Facebook page' class='social-icon' href='https://www.facebook.com/profile.php?id=100080805714776'>FB</a>
        <a aria-label='Visit our Instagram profile' class='social-icon' href='https://www.instagram.com/antinna.yt/'>IG</a>
        <a aria-label='Visit our GitHub Organization' class='social-icon' href='https://github.com/antinna'>GH</a>
      </div>
    </div>
    <div class='footer-col-links'>
      <h4>Quick Links</h4>
      <ul class='footer-links-list'>
        <li><a expr:href='data:blog.homepageUrl'>Home</a></li>
        <li><a expr:href='data:blog.homepageUrl + &quot;p/about-us.html&quot;'>About Us</a></li>
        <li><a expr:href='data:blog.homepageUrl + &quot;p/contact-us.html&quot;'>Contact Us</a></li>
        <li><a expr:href='data:blog.homepageUrl + &quot;#services&quot;'>Services</a></li>
        <li><a expr:href='data:blog.homepageUrl + &quot;#blog&quot;'>Insights</a></li>
      </ul>
    </div>
    <div class='footer-col-links'>
      <h4>Legal &amp; Support</h4>
      <ul class='footer-links-list'>
        <li><a expr:href='data:blog.homepageUrl + &quot;p/privacy-policy.html&quot;'>Privacy Policy</a></li>
        <li><a expr:href='data:blog.homepageUrl + &quot;p/disclaimer.html&quot;'>Disclaimer</a></li>
        <li><a expr:href='data:blog.homepageUrl + &quot;p/termandconditions.html&quot;'>Terms &amp; Conditions</a></li>
      </ul>
    </div>
  </div>
  <div class='container footer-bottom'>
    <p>&#169; 2026 HireFlutter. All Rights Reserved. Fully optimized for Google AdSense compliance.</p>
    <p>Empowered by passion and high-end software craftsmanship.</p>
  </div>
</footer>
'''),

      // Dynamic JS for latest posts rendering on homepage
      RawText(r'''
<b:if cond='data:view.isHomepage'>
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
</b:if>
''')
    ],
  );

  final xml = theme.generate();

  // Write the completed theme XML code directly to local theme.xml
  final file = File('theme.xml');
  file.writeAsStringSync(xml);
  print('Successfully generated theme.xml using blogger_theme!');
}
