import 'package:e301_login/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      height: (size.width > 1000) ? size.height * 0.1 : null,
      child: Container(
        width: double.infinity,
        height: 70,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            LinkText(texto: 'About', onPressed: () => print('Click on About')),
            LinkText(
              texto: 'Help Center',
              onPressed: () => print('Click on Help Center'),
            ),
            LinkText(
              texto: 'Terms of Service',
              onPressed: () => print('Click on Terms of Service'),
            ),
            LinkText(
              texto: 'Privacy Policy',
              onPressed: () => print('Click on Privacy Policy'),
            ),
            LinkText(
              texto: 'Cookies Policy',
              onPressed: () => print('Click on Cookies Policy'),
            ),
            LinkText(
              texto: 'Ads Info',
              onPressed: () => print('Click on Ads Info'),
            ),
            LinkText(texto: 'Blog', onPressed: () => print('Click on Blog')),
            LinkText(
              texto: 'Status',
              onPressed: () => print('Click on Status'),
            ),
            LinkText(
              texto: 'Careers',
              onPressed: () => print('Click on Careers'),
            ),
            LinkText(
              texto: 'Brand Resources',
              onPressed: () => print('Click on Brand Resources'),
            ),
            LinkText(
              texto: 'Advertising',
              onPressed: () => print('Click on Advertising'),
            ),
            LinkText(
              texto: 'Marketing',
              onPressed: () => print('Click on Marketing'),
            ),
            LinkText(
              texto: 'Campeign',
              onPressed: () => print('Click on Campeign'),
            ),
            LinkText(texto: 'Black', onPressed: () => print('Click on Black')),
          ],
        ),
      ),
    );
  }
}
