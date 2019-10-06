import 'package:flutter/material.dart';
import 'package:pusyantek/models/kasub.model.dart';
import 'package:pusyantek/provider/services/kasub.service.dart';

class KasubProvider with ChangeNotifier {
  final _kasubService = KasubService();
  List<Kasub> _kasubs = [];

  List<Kasub> get kasubs => _kasubs;

  getAll() async {
    try {
      final kasubs = await _kasubService.getAll();
      _kasubs = kasubs;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  create(Map<String, dynamic> data) async {
    try {
      final kasub = await _kasubService.create(data);
      _kasubs = [kasub, ..._kasubs];
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
