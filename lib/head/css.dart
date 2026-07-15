import 'package:blogger_theme/blogger_theme.dart';

final bskinHead = BSkin(
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
);
