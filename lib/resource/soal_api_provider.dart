import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/soal_model.dart';
import '../models/jumlah_soal.dart';
import '../models/setting_model.dart';

class SoalApiProvider {
  Client client = Client();
  var endPoint = "http://192.168.100.22/latihan_cpns/api";
  var soalKey = "soal.php";
  var countSoalKey = "hitungSoal.php";
  var getSettingKey = "getSetting.php";

  Future<SoalModel> fetchSoal(String jenisSoal) async {
    print('$jenisSoal');
    String url = '$endPoint/$soalKey?jenis=$jenisSoal';
    final response = await client.get(url);
    print(response.body);
    if(response.statusCode==200){
      return SoalModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get soal!");
    }
  }

  Future<CountSoal> getCountSoal(String jenisSoal) async {
    String url = '$endPoint/$countSoalKey?jenis=$jenisSoal';
    final response = await client.get(url);
    if(response.statusCode==200){
      print('cek ${response.body}');
      return CountSoal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get soal!");
    }
  }

  Future<SettingModel> getSetting() async {
    String url = '$endPoint/$getSettingKey';
    final response = await client.get(url);
    if(response.statusCode==200){
      print('cek ${response.body}');
      return SettingModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed get setting!');
    }
  }
}
