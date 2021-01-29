import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../resource/repository.dart';
import '../models/soal_model.dart';
import '../models/jumlah_soal.dart';
import '../page/SoalPage.dart';


class SoalBloc {

  var soal=[];
  SoalModel tempSoalModel;
  CountSoal tempCountSoal;

  final _repository = Repository();

  final _soalFetcher = PublishSubject<SoalModel>();
  final _soalCounter = PublishSubject<CountSoal>();
  Observable<SoalModel> get oneSoal => _soalFetcher.stream;
  Observable<CountSoal> get hitungSoal => _soalCounter.stream;

  fetchSoal(String jenisSoal) async {
    SoalModel soalModel = await _repository.fetchSoal(jenisSoal);
    _soalFetcher.sink.add(soalModel);
    tempSoalModel = soalModel;
  }

  fetchCountSoal(String jenisSoal, BuildContext ctx) async {
    CountSoal countSoal = await _repository.getCountSoal(jenisSoal);
    _soalCounter.sink.add(countSoal);
    Navigator.push(
        ctx,
        MaterialPageRoute(
            builder: (context) => SoalPage(jenisSoal, countSoal.jumlahSoal )));
  }

  int randomArr(int soalLength){
    var rng = new Random();
    var _val = rng.nextInt(soalLength);
    print('cek random $_val');
    print('jumlah soal $soalLength');
    return _val;
  }

  dispose(){
    _soalFetcher.close();
  }

}

final bloc = SoalBloc();