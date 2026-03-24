import 'package:e301_login/ui/views/login_view.dart';
import 'package:e301_login/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';

class AdminHandlers {
  static Handler login = Handler(
    handlerFunc: (context, parameters) {
      return LoginView();
    },
  );
  static Handler register = Handler(
    handlerFunc: (context, parameters) {
      return RegisterView();
    },
  );
}
