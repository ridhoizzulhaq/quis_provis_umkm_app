import 'dart:convert';
import 'package:http/http.dart' as http;
import 'umkm_model.dart';

class UmkmRepository {
  final String baseUrl = "http://178.128.17.76:8000/";

  Future<List<Umkm>> fetchUmkmList() async {
    final response = await http.get(Uri.parse(baseUrl + 'daftar_umkm'));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final data = responseData['data'] as List<dynamic>;

      return data.map((umkmData) => Umkm.fromJson(umkmData as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load UMKM list');
    }
  }

  Future<Umkm> fetchUmkmDetail(int id) async {
    final response = await http.get(Uri.parse(baseUrl + 'detil_umkm/' + id.toString()));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Umkm.fromJson(data as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load UMKM detail');
    }
  }
}
