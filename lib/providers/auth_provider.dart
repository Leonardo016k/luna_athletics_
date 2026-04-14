import 'package:e301_login/services/local_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    //TODO: Implementar petición http
    this._token = 'hjasd.hjgshjghsaj.kjjhsjkh';
    //print('Almacenar JWT: $_token');
    LocalStorage.prefs.setString('token', this._token!);

    //TODO: navegar al dashboard

    notifyListeners();
  }
}
