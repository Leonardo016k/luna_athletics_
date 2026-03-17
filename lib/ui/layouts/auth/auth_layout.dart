import 'package:e301_login/ui/widgets/background_image.dart';
import 'package:e301_login/ui/widgets/custom_title.dart';
import 'package:e301_login/ui/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //Desktop
          _DesktopBody(child: child),
          //Mobile

          //Linksbar
          LinksBar(),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height*0.9,
      color: Colors.amber,
      child: Row(
        children: [
          //Imagen
          BackgroundImage(),
          //View
          Container(
            color: Colors.black,
            width: 500,
            height: double.infinity,
            child: Column(
              children: [
                CustomTitle(),
                SizedBox(height: 50),
                Expanded(child: child)
              ]
            ),
          ),
        ],
      ),
    );
  }
}
