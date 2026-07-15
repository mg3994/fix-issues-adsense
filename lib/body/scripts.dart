import 'package:blogger_theme/blogger_theme.dart';

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
