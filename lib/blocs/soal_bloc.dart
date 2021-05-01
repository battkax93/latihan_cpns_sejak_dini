import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../resource/repository.dart';
import '../models/soal_model.dart';
import '../models/jumlah_soal.dart';
import '../models/setting_model.dart';
import '../page/SoalPage.dart';
import 'package:giffy_dialog/giffy_dialog.dart';


class SoalBloc {

  var soal=[];
  SoalModel tempSoalModel;
  CountSoal tempCountSoal;
  SettingModel tempSettingModel;

   List<Key> keys = [
    Key("Network"),
    Key("NetworkDialog"),
    Key("Flare"),
    Key("FlareDialog"),
    Key("Asset"),
    Key("AssetDialog")
  ];

  final _repository = Repository();

  final _settingFetcher = PublishSubject<SettingModel>();
  final _soalFetcher = PublishSubject<SoalModel>();
  final _soalCounter = PublishSubject<CountSoal>();

  Observable<SettingModel> get oneSetting => _settingFetcher.stream;
  Observable<SoalModel> get oneSoal => _soalFetcher.stream;
  Observable<CountSoal> get hitungSoal => _soalCounter.stream;

  fetchSoal(String jenisSoal) async {
    SoalModel soalModel = await _repository.fetchSoal(jenisSoal);
    _soalFetcher.sink.add(soalModel);
    tempSoalModel = soalModel;
  }

  fetchCountSoal(String jenisSoal, BuildContext ctx) async {
    // showCommonDialog(ctx, 'loading');
    // CountSoal countSoal = await _repository.getCountSoal(ctx,jenisSoal);
    // _soalCounter.sink.add(countSoal);
    SoalModel soalModel = await _repository.fetchSoal(jenisSoal);
    _soalFetcher.sink.add(soalModel);
    tempSoalModel = soalModel;
    var jumlahSoal = tempSoalModel.jumlah;
    Navigator.push(
        ctx,
        MaterialPageRoute(
            builder: (context) => SoalPage(jenisSoal, jumlahSoal )));
  }

  fetchSetting() async {
    SettingModel settingModel = await _repository.getSetting();
    _settingFetcher.sink.add(settingModel);
    tempSettingModel = settingModel;
  }

  int randomArr(int soalLength){
    var rng = new Random();
    var _val = rng.nextInt(soalLength);
    print('cek random $_val');
    print('jumlah soal $soalLength');
    return _val;
  }

   showCommonDialog(BuildContext ctx, String txt) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 400),
      context: ctx,
      pageBuilder: (_, __, ___) {
        return /*FlareGiffyDialog(
          key: keys[3],
          flarePath: 'assets/space_demo.flr',
          flareAnimation: 'loading',
          title: Text(
            'Space Reloading',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22.0, fontWeight: FontWeight.w600),
          ),
          entryAnimation: EntryAnimation.DEFAULT,
          description: Text(
            'This is a space reloading dialog box. This library helps you easily create fancy flare dialog.',
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          onOkButtonPressed: () {},
        );*/


        Center(
          child: Container(
              height: 300,
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Column(
                    children: [
                      Text(
                        txt,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.blueAccent,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ))),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  dispose(){
    _soalFetcher.close();
    _settingFetcher.close();
  }

}

final bloc = SoalBloc();