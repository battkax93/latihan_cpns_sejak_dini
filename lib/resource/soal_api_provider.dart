import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../common/common_key.dart';
import '../models/soal_model.dart';
import '../models/jumlah_soal.dart';
import '../models/setting_model.dart';
import 'package:flutter/material.dart';
class SoalApiProvider {

  Client client = Client();
  var endPoint = 'https://latihancpnssejakdini.000webhostapp.com/api';
  var endPoint2 = 'http://192.168.100.32:8000/api';
  var endPoint3 = CommonKey().hostname;
  var apiKey = 'api';
  var soalKey = "soal.php";
  var soalKey2 = "getsoal";
  var countSoalKey = "hitungsoal.php";
  var getSettingKey = "getSetting.php";
  var getSettingKey2 = "getsetting";

  Future<SoalModel> fetchSoal(String jenisSoal) async {
    // String url = '$endPoint/$soalKey?jenis=$jenisSoal';
    String url = '$endPoint3/$apiKey/$soalKey2/$jenisSoal';
    final response = await client.get(url);
    print('$jenisSoal');
    print('fetchsoal');
    print(url);
    print(response.body);
    if(response.statusCode==200){
      return SoalModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get soal!");
    }
  }

  Future<CountSoal> getCountSoal(BuildContext ctx, String jenisSoal) async {
    String url = '$endPoint/$countSoalKey?jenis=$jenisSoal';
    final response = await client.get(url);
    print(url);
    if(response.statusCode==200){
      Navigator.pop(ctx);
      print('cek ${response.body}');
      return CountSoal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get soal!");
    }
  }

  Future<SettingModel> getSetting() async {
    String url = '$endPoint2/$getSettingKey2';
    final response = await client.get(url);
    print(url);
    if(response.statusCode==200){
      print('cek ${response.body}');
      return SettingModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed get setting!');
    }
  }
}
