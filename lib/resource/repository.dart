import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'soal_api_provider.dart';
import '../models/soal_model.dart';
import '../models/jumlah_soal.dart';
import '../models/setting_model.dart';

class Repository {
  final soalApiProvider = SoalApiProvider();

  //get soal from server
  Future<SoalModel> fetchSoal(String jenisSoal)=> soalApiProvider.fetchSoal(jenisSoal);
  Future<CountSoal> getCountSoal(BuildContext ctx, String jenisSoal)=> soalApiProvider.getCountSoal(ctx,jenisSoal);
  Future<SettingModel> getSetting() => soalApiProvider.getSetting();
}