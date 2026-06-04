import 'package:e301_login/providers/auth_provider.dart';
import 'package:e301_login/providers/sidemenu_provider.dart';
import 'package:e301_login/router/router.dart';
import 'package:e301_login/services/navigation_service.dart';
import 'package:e301_login/ui/shared/widgets/logo.dart';
import 'package:e301_login/ui/shared/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName) {
    NavigationService.navigationTo(routeName);
    SidemenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 242,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          // Logo
          const Logo(),
          const SizedBox(height: 30),

          MenuItem(
            text: 'Inicio',
            icon: Icons.home_max_outlined,
            onPressed: () => navigateTo(Flurorouter.inicioRoute),
          ),
          MenuItem(
            text: 'Nosotros',
            icon: Icons.fitness_center_outlined,
            onPressed: () => navigateTo(Flurorouter.nosotrosRoute),
          ),
          MenuItem(
            text: 'Perfil',
            icon: Icons.person_outline_sharp,
            onPressed: () => navigateTo(Flurorouter.perfilRoute),
          ),
          MenuItem(
            text: 'Productos',
            icon: Icons.checkroom_outlined,
            onPressed: () => navigateTo(Flurorouter.productosRoute),
          ),
          MenuItem(
            text: 'Carrito',
            icon: Icons.local_mall_outlined,
            onPressed: () => navigateTo(Flurorouter.carritoRoute),
          ),
          MenuItem(
            text: 'Pedidos',
            icon: Icons.local_shipping_outlined,
            onPressed: () => navigateTo(Flurorouter.pedidosRoute),
          ),
          MenuItem(
            text: 'Preguntas frecuentes',
            icon: Icons.help_outline_sharp,
            onPressed: () => navigateTo(Flurorouter.faqRoute),
          ),
          MenuItem(
            text: 'Contacto',
            icon: Icons.support_agent_outlined,
            onPressed: () => navigateTo(Flurorouter.contactoRoute),
          ),

          const Divider(
            color: Colors.white10,
            height: 30,
            indent: 20,
            endIndent: 20,
          ),

          MenuItem(
            text: 'Cerrar Sesión',
            icon: Icons.logout_outlined,
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    color: Color(0xFF0F0F11), // Negro mate premium
    boxShadow: [
      BoxShadow(color: Colors.black45, blurRadius: 15, offset: Offset(2, 0)),
    ],
  );
}
