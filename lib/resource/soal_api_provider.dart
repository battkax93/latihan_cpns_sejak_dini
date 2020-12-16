import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/soal_model.dart';
import '../models/jumlah_soal.dart';

class SoalApiProvider {
  Client client = Client();

  Future<SoalModel> fetchSoal(String id, String jenisSoal) async {
    print('tes $id, $jenisSoal');
    String url = 'http://192.168.100.22/latihan_cpns/soal.php?id=$id&jenis_soal=$jenisSoal';
    final response = await client.get(url);
    if(response.statusCode==200){
      return SoalModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get soal!");
    }
  }

  Future<CountSoal> getCountSoal(String jenisSoal) async {
    String url = 'http://192.168.100.22/latihan_cpns/hitungSoal.php?jenis_soal=$jenisSoal';
    final response = await client.get(url);
    if(response.statusCode==200){
      print('cek ${response.body}');
      return CountSoal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get soal!");
    }
  }
}
