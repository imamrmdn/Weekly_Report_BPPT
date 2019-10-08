import 'package:flutter/material.dart';
import 'package:pusyantek/utils/api.dart';

class AuthService {
  Future<String> login(String email, String password) async {
    try {
      final response = await api.post('/api/user/login', data: {
        'email': email,
        'password': password,
      });
      return response.data['accessToken'];
    } catch (error) {
      throw ('Data Tidak Boleh Kosong dan Salah');
    }
  }

  Future<void> register({
    @required String email,
    @required String password,
    @required String name,
  }) async {
    try {
      await api.post('/api/user/register', data: {
        'email': email,
        'password': password,
        'nama': name,
      });
    } catch (error) {
      throw error;
    }
  }
}
