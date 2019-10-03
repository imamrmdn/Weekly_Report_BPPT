import 'package:shared_preferences/shared_preferences.dart';

class JwtService {
  final jwtKeyStore = 'jwt';

  Future<void> save(String jwt) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(jwtKeyStore, jwt);
  }

  Future<String> getFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(jwtKeyStore);
  }

  Future<void> removeFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(jwtKeyStore);
  }
}
