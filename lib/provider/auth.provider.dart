import 'package:flutter/material.dart';
import 'package:pusyantek/provider/services/auth_service.dart';
import 'package:pusyantek/provider/services/jwt_service.dart';
import 'package:pusyantek/utils/api.dart';

class Auth with ChangeNotifier {
  final _authService = AuthService();
  final _jwtService = JwtService();

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Auth() {
    initializing();
  }

  Future<void> login(String email, String password) async {
    try {
      final jwt = await _authService.login(email, password);
      await _jwtService.save(jwt);
      Api.setDefaultAuthHeader(jwt);
      _isAuthenticated = true;
      notifyListeners();
    } catch (error) {
      throw ('data harus diisi');
    }
  }

  Future<void> register({
    @required String email,
    @required String password,
    @required String name,
  }) async {
    try {
      await _authService.register(email: email, password: password, name: name);
    } catch (error) {
      throw error;
    }
  }

  Future<void> logout() async {
    await _jwtService.removeFromSharedPreferences();
    _isAuthenticated = false;
    Api.removeDefaultAuthHeader();
    notifyListeners();
  }

  Future<void> initializing() async {
    final jwt = await _jwtService.getFromSharedPreferences();
    if (jwt != null) {
      Api.setDefaultAuthHeader(jwt);
      _isAuthenticated = true;
      notifyListeners();
    }
  }
}
