import 'package:e301_login/providers/auth_provider.dart';
import 'package:e301_login/ui/views/nosotros_views.dart';
import 'package:e301_login/ui/views/contacto_views.dart';
import 'package:e301_login/ui/views/perfil_views.dart';
import 'package:e301_login/ui/views/pedidos_views.dart';
import 'package:e301_login/ui/views/inicio_views.dart';
import 'package:e301_login/ui/views/carrito_views.dart';
import 'package:e301_login/ui/views/icons_views.dart';
import 'package:e301_login/ui/views/login_view.dart';
import 'package:e301_login/ui/views/faq_views.dart';
import 'package:e301_login/ui/views/productos_views.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler inicio = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return InicioView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler icons = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return IconsViews();
      } else {
        return LoginView();
      }
    },
  );
  static Handler nosotros = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const NosotrosView(); // <--- RETORNA LA VISTA
      } else {
        return const LoginView();
      }
    },
  );
  static Handler perfil = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const PerfilViews(); // <--- RETORNA LA VISTA
      } else {
        return const LoginView();
      }
    },
  );
  static Handler products = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const ProductosView(); // <--- RETORNA LA VISTA
      } else {
        return const LoginView();
      }
    },
  );
  static Handler carrito = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const CarritoView(); // <--- RETORNA LA VISTA
      } else {
        return const LoginView();
      }
    },
  );
  static Handler pedidos = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const PedidosView(); // <--- RETORNA LA VISTA
      } else {
        return const LoginView();
      }
    },
  );
  static Handler faq = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const FaqView(); // <--- RETORNA LA VISTA
      } else {
        return const LoginView();
      }
    },
  );
  static Handler contacto = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const ContactoView(); // <--- RETORNA LA VISTA
      } else {
        return const LoginView();
      }
    },
  );
}
