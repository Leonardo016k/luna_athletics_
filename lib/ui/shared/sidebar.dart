import 'package:e301_login/providers/auth_provider.dart';
import 'package:e301_login/providers/sidemenu_provider.dart';
import 'package:e301_login/router/router.dart';
import 'package:e301_login/services/navigation_service.dart';
import 'package:e301_login/ui/shared/widgets/logo.dart';
import 'package:e301_login/ui/shared/widgets/menu_item.dart';
import 'package:e301_login/ui/shared/widgets/text_separator.dart';
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
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          //Logo
          Logo(),
          SizedBox(height: 50),
          TextSeparator(text: 'main'),

          //Opciones
          MenuItem(
            text: 'inicio',
            icon: Icons.compass_calibration_outlined,
            onPressed: () => navigateTo(Flurorouter.inicioRoute),
          ),
          MenuItem(
            text: 'Nosotros',
            icon: Icons.show_chart_outlined,
            onPressed: () => navigateTo(Flurorouter.nosotrosRoute),
          ),
          MenuItem(
            text: 'Perfil',
            icon: Icons.layers_clear_outlined,
            onPressed: () => navigateTo(Flurorouter.perfilRoute),
          ),
          MenuItem(
            text: 'Productos',
            icon: Icons.dashboard_outlined,
            onPressed: () => navigateTo(Flurorouter.productosRoute),
          ),
          MenuItem(
            text: 'Carrito',
            icon: Icons.attach_money_outlined,
            onPressed: () => navigateTo(Flurorouter.carritoRoute),
          ),
          MenuItem(
            text: 'pedidos',
            icon: Icons.people_alt_outlined,
            onPressed: () => navigateTo(Flurorouter.pedidosRoute),
          ),
          SizedBox(height: 30),
          TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            onPressed: () => navigateTo(Flurorouter.iconsRoute),
          ),
          MenuItem(
            text: 'faq',
            icon: Icons.mark_email_read_outlined,
            onPressed: () => navigateTo(Flurorouter.faqRoute),
          ),
          MenuItem(
            text: 'contacto',
            icon: Icons.note_add_outlined,
            onPressed: () => navigateTo(Flurorouter.contactoRoute),
          ),

          MenuItem(
            text: 'Exit',
            icon: Icons.exit_to_app_outlined,
            onPressed: () {
              // 1. Llamas al método logout de tu AuthProvider
              Provider.of<AuthProvider>(context, listen: false).logout();

              // 2. Opcionalmente usas tu NavigationService para forzar el redireccionamiento
              // NavigationService.replaceTo('/auth/login');
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(colors: [Color(0xff092044), Color(0xff092042)]),
    boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10)],
  );
}
