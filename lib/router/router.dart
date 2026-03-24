import 'package:e301_login/router/admin_handlers.dart';
import 'package:e301_login/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //auth routes
  static String loginRoute = 'auth/login';
  static String registerRoute = 'auth/register';

  //dashboard route
  static String dashboardRoute = '/dashboard';

  static void configRoutes() {
    router.define(
      rootRoute, 
      handler: AdminHandlers.login,
      transitionType: TransitionType.none
    );
    router.define(
      loginRoute, 
      handler: AdminHandlers.login,
      transitionType: TransitionType.none
    );
    router.define(
      registerRoute,
      handler: AdminHandlers.register,
      transitionType: TransitionType.none  
    );

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
