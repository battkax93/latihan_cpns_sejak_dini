import 'dart:async';

import 'soal_api_provider.dart';
import '../models/soal_model.dart';
import '../models/jumlah_soal.dart';

class Repository {
  final soalApiProvider = SoalApiProvider();

  //get soal from server
  Future<SoalModel> fetchSoal(String id, String jenisSoal)=> soalApiProvider.fetchSoal(id, jenisSoal);
  Future<CountSoal> getCountSoal(String jenisSoal)=> soalApiProvider.getCountSoal(jenisSoal);
}