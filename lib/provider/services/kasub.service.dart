import 'package:pusyantek/models/kasub.model.dart';
import 'package:pusyantek/utils/api.dart';

class KasubService {
  Future<List<Kasub>> getAll() async {
    try {
      final response = await api.get('/api/kasub');
      final data =
          (response.data as List).map((item) => Kasub.fromJson(item)).toList();
      return data;
    } catch (error) {
      throw error;
    }
  }

  Future<Kasub> create(Map<String, dynamic> data) async {
    try {
      final response = await api.post('/api/kasub', data: data);
      return Kasub.fromJson(response.data);
    } catch (error) {
      throw ('Data tidak boleh kosong');
    }
  }
}
