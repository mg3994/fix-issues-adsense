import 'package:blogger_theme/blogger_theme.dart';

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
