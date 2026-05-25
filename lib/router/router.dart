import 'package:e301_login/router/admin_handlers.dart';
import 'package:e301_login/router/dashboard_handlers.dart';
import 'package:e301_login/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //auth routes
  static String loginRoute = 'auth/login';
  static String registerRoute = 'auth/register';

  //dashboard route
  static String inicioRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String nosotrosRoute = '/dashboard/nosotros';
  static String perfilRoute = '/dashboard/perfil';
  static String productosRoute = '/dashboard/productos';
  static String carritoRoute = '/dashboard/carrito';
  static String pedidoRoute = '/dashboard/pedido';
  static String faqRoute = '/dashboard/faq';
  static String contactoRoute = '/dashboard/contacto';
  static String pedidosRoute = '/dashboard/pedidos';

  static void configRoutes() {
    router.define(
      rootRoute,
      handler: AdminHandlers.login,
      transitionType: TransitionType.none,
    );
    router.define(
      loginRoute,
      handler: AdminHandlers.login,
      transitionType: TransitionType.none,
    );
    router.define(
      registerRoute,
      handler: AdminHandlers.register,
      transitionType: TransitionType.none,
    );
    router.define(
      inicioRoute,
      handler: DashboardHandlers.inicio,
      transitionType: TransitionType.none,
    );
    router.define(
      iconsRoute,
      handler: DashboardHandlers.icons,
      transitionType: TransitionType.none,
    );
    router.define(
      nosotrosRoute,
      handler: DashboardHandlers.nosotros,
      transitionType: TransitionType.none,
    );
    router.define(
      perfilRoute,
      handler: DashboardHandlers.perfil,
      transitionType: TransitionType.none,
    );
    router.define(
      productosRoute,
      handler: DashboardHandlers.products,
      transitionType: TransitionType.none,
    );
    router.define(
      carritoRoute,
      handler: DashboardHandlers.carrito,
      transitionType: TransitionType.none,
    );
    router.define(
      pedidosRoute,
      handler: DashboardHandlers.pedidos,
      transitionType: TransitionType.none,
    );
    router.define(
      faqRoute,
      handler: DashboardHandlers.faq,
      transitionType: TransitionType.none,
    );
    router.define(
      contactoRoute,
      handler: DashboardHandlers.contacto,
      transitionType: TransitionType.none,
    );

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
