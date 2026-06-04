import 'package:e301_login/providers/sidemenu_provider.dart';
import 'package:e301_login/ui/shared/widgets/navbar_avatar.dart';
import 'package:e301_login/ui/shared/widgets/notification_indicator.dart';
import 'package:e301_login/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          // Icono del menú móvil
          const SizedBox(width: 10),
          if (size.width <= 700)
            IconButton(
              onPressed: () => SidemenuProvider.openMenu(),
              icon: const Icon(
                Icons.menu_outlined,
                color: Colors.white,
              ), // <--- Icono en blanco para fondo negro
            ),

          const SizedBox(width: 10),

          // Búsqueda
          if (size.width > 400)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),

          const Spacer(),
          const NotificationIndicator(),
          const SizedBox(width: 20),
          const NavbarAvatar(),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    color: Color(0xFF0F0F11), // Negro mate idéntico al Sidebar
  );
}
