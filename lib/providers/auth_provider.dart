import 'package:e301_login/router/router.dart';
import 'package:e301_login/services/local_storage.dart';
import 'package:e301_login/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    //TODO: Implementar petición http
    this._token = 'hjasd.hjgshjghsaj.kjjhsjkh';
    //print('Almacenar JWT: $_token');
    LocalStorage.prefs.setString('token', this._token!);

    //TODO: navegar al dashboard
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.inicioRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: Ir al backend y comprobar que el JWT sea válido

    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }

  void logout() {
    // 1. Eliminar el token del almacenamiento local
    LocalStorage.prefs.remove('token');

    // 2. Cambiar el estado a no autenticado
    authStatus = AuthStatus.notAuthenticated;

    // 3. Notificar a los widgets para que reaccionen al cambio
    notifyListeners();

    // 4. Redirigir a la ruta de login definida en tu Flurorouter
    NavigationService.replaceTo(Flurorouter.loginRoute);
  }
}
