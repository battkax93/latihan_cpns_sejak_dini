import 'package:flutter/material.dart';
import 'package:latihan_cpns_sejak_dini/blocs/soal_bloc.dart';
import 'package:latihan_cpns_sejak_dini/models/soal_model.dart';
import '../common/countdownTimer.dart';

class SoalPage extends StatefulWidget {
  final String jenisSoal;
  final int jumlahSoal;

  SoalPage(this.jenisSoal, this.jumlahSoal);

  @override
  _SoalPageState createState() =>
      _SoalPageState(this.jenisSoal, this.jumlahSoal);
}

class _SoalPageState extends State<SoalPage> {
  String jenisSoal;
  int jumlahSoal;

  _SoalPageState(this.jenisSoal, this.jumlahSoal);

  bool isRight = false;
  bool hasTimer = true;
  var tempStatus = '';
  var tempAnswer = '';
  var trueAnswer = '';
  var secondRemaining = 0;
  var fz = 16.0;
  var fz2 = 16.0;
  var tempScore = 0;
  var tempSalah = 0;
  var tmpQ = 0;
  SoalModel vModel = SoalModel();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    cekSoal();
    getSoal();
  }

  void cekSoal() {
    setState(() {
      if (jenisSoal == 'TIU') {
        secondRemaining = 120;
      } else {
        secondRemaining = 20;
      }
    });
  }

  void getSoal() {
    jumlahSoal==1? tmpQ = 0 : tmpQ = bloc.randomArr(jumlahSoal);
    // if (tmpQ >= jumlahSoal) tmpQ = jumlahSoal-1;
    bloc.fetchSoal(jenisSoal);
    vModel = bloc.tempSoalModel;
  }

  void lockAnswer(String answer) {
    setState(() {
      tempAnswer = answer;
    });
  }

  void checkAnswer() {
    bloc.soal.add(vModel.data[tmpQ].id);
    setState(() {
      print('cek tempAnswer ${vModel.data[tmpQ].jawabanBenar} : $tempAnswer');
      hasTimer = false;
      trueAnswer = vModel.data[tmpQ].jawabanBenar;
      if (vModel.data[tmpQ].jawabanBenar == tempAnswer) {
        isRight = true;
        tempScore++;
      } else {
        isRight = false;
        tempSalah++;
      }
    });

    if (tempAnswer == '') {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: Text("Jawaban ${vModel.data[tmpQ].jawabanBenar}",
            style: TextStyle(
                color: Colors.white,
                fontSize: fz2,
                fontWeight: FontWeight.w700)),
        backgroundColor: isRight ? Colors.blue[700] : Colors.red,
        duration: const Duration(milliseconds: 1500),
      ));
    } else {
      if (tempStatus == 'Waktu Anda Habis') {
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text("$tempStatus",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fz2,
                  fontWeight: FontWeight.w700)),
          backgroundColor: isRight ? Colors.blue[700] : Colors.red,
          duration: const Duration(milliseconds: 1500),
        ));
        setState(() {
          tempStatus = '';
        });
      } else {
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: isRight
              ? new Text("Anda Benar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fz2,
                      fontWeight: FontWeight.w700))
              : new Text("Anda Salah | Jawaban: ${vModel.data[tmpQ].jawabanBenar}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fz2,
                      fontWeight: FontWeight.w700)),
          backgroundColor: isRight ? Colors.blue[700] : Colors.red,
          duration: const Duration(milliseconds: 1500),
        ));
      }
    }
  }

  streamBuilder(val) {
    return StreamBuilder(
      stream: val,
      // ignore: missing_return
      builder: (context, snapshot) {
        vModel = snapshot.data;
        if (snapshot.hasData) {
          return bodyApp(snapshot.data);
        } else {
          return Center(
              child: SizedBox(
            child: CircularProgressIndicator(),
            height: 100,
            width: 100,
          ));
        }
      },
    );
  }

  boxScore() => Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Score: $tempScore',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: fz2),
                ),
                Text(
                  'Salah: $tempSalah',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: fz2),
                ),
              ],
            ),
            SizedBox(width: 150),
            hasTimer ? Icon(Icons.timer, color: Colors.blue) : Container(),
            hasTimer ? boxTimer() : Container()
          ],
        ),
      );

  boxSoal() => Center(
        child: Wrap(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                '${vModel.data[tmpQ].soal}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: fz,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );

  boxAnswer() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          trueAnswer == 'a'
              ? InkWell(
                  splashColor: Colors.green[400],
                  onTap: () {
                    lockAnswer('a');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('a. ',
                            style:
                                TextStyle(color: Colors.black, fontSize: fz)),
                        Expanded(
                          child: Text(vModel.data[tmpQ].a,
                              style:
                                  TextStyle(color: Colors.black, fontSize: fz)),
                        ),
                      ],
                    ),
                  ),
                )
              : InkWell(
                  splashColor: Colors.green[400],
                  onTap: () {
                    lockAnswer('a');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color:
                            tempAnswer == 'a' ? Colors.blue : Colors.yellow[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('a. ',
                            style:
                                TextStyle(color: Colors.black, fontSize: fz)),
                        Expanded(
                          child: Text(vModel.data[tmpQ].a,
                              style:
                                  TextStyle(color: Colors.black, fontSize: fz)),
                        ),
                      ],
                    ),
                  ),
                ), //a
          trueAnswer == 'b'
              ? InkWell(
                  splashColor: Colors.green[400],
                  onTap: () {
                    lockAnswer('b');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('b. ',
                            style:
                                TextStyle(color: Colors.black, fontSize: fz)),
                        Expanded(
                          child: Text(vModel.data[tmpQ].b,
                              style:
                                  TextStyle(color: Colors.black, fontSize: fz)),
                        ),
                      ],
                    ),
                  ),
                )
              : InkWell(
                  splashColor: Colors.green[400],
                  onTap: () {
                    lockAnswer('b');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color:
                            tempAnswer == 'b' ? Colors.blue : Colors.yellow[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('b. ',
                            style:
                                TextStyle(color: Colors.black, fontSize: fz)),
                        Expanded(
                          child: Text(vModel.data[tmpQ].b,
                              style:
                                  TextStyle(color: Colors.black, fontSize: fz)),
                        ),
                      ],
                    ),
                  ),
                ), //b
          trueAnswer == 'c'
              ? InkWell(
                  splashColor: Colors.green[400],
                  onTap: () {
                    lockAnswer('c');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('c. ',
                            style:
                                TextStyle(color: Colors.black, fontSize: fz)),
                        Expanded(
                          child: Text(vModel.data[tmpQ].c,
                              style:
                                  TextStyle(color: Colors.black, fontSize: fz)),
                        ),
                      ],
                    ),
                  ),
                )
              : InkWell(
                  splashColor: Colors.green[400],
                  onTap: () {
                    lockAnswer('c');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color:
                            tempAnswer == 'c' ? Colors.blue : Colors.yellow[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('c. ',
                            style:
                                TextStyle(color: Colors.black, fontSize: fz)),
                        Expanded(
                          child: Text(vModel.data[tmpQ].c,
                              style:
                                  TextStyle(color: Colors.black, fontSize: fz)),
                        ),
                      ],
                    ),
                  ),
                ), //c
          trueAnswer == 'd'
              ? InkWell(
                  splashColor: Colors.green[400],
                  onTap: () {
                    lockAnswer('d');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('c. ',
                            style:
                                TextStyle(color: Colors.black, fontSize: fz)),
                        Expanded(
                          child: Text(vModel.data[tmpQ].c,
                              style:
                                  TextStyle(color: Colors.black, fontSize: fz)),
                        ),
                      ],
                    ),
                  ),
                )
              : InkWell(
                  splashColor: Colors.green[400],
                  onTap: () {
                    lockAnswer('d');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color:
                            tempAnswer == 'd' ? Colors.blue : Colors.yellow[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('d. ',
                            style:
                                TextStyle(color: Colors.black, fontSize: fz)),
                        Expanded(
                          child: Text(vModel.data[tmpQ].d,
                              style:
                                  TextStyle(color: Colors.black, fontSize: fz)),
                        ),
                      ],
                    ),
                  ),
                ) //d
        ],
      );

  boxNext() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          hasTimer
              ? InkWell(
                  onTap: () {
                    setState(() {
                      checkAnswer();
                    });
                  },
                  child: Center(
                    child: Wrap(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'cek jawaban',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ))
              : Center(
                  child: Wrap(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'cek jawaban',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
          !hasTimer
              ? InkWell(
                  onTap: () {
                    isRight = false;
                    hasTimer = true;
                    tempAnswer = '';
                    trueAnswer = '';
                    getSoal();
                    cekSoal();
                  },
                  child: Center(
                    child: Wrap(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Selanjutnya',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Wrap(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Selanjutnya',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                )
        ],
      );

  boxTimer() => Center(
        child: Container(
          padding: EdgeInsets.only(top: 3.0, right: 4.0, left: 4.0),
          child: CountDownTimer(
            secondsRemaining: secondRemaining,
            whenTimeExpires: () {
              setState(() {
                tempStatus = 'Waktu Anda Habis';
                checkAnswer();
              });
            },
            countDownTimerStyle: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
                height: 1.2),
          ),
        ),
      );

  bodyApp(SoalModel soalModel) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boxScore(),
            boxSoal(),
            boxAnswer(),
            boxNext(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LATIHAN CPNS',
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'http://192.168.100.22/latihan_cpns/asset/background.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Center(
                child: Text('Latihan CPNS Sejak Dini'),
              ),
              backgroundColor: Colors.orange[300],
            ),
            backgroundColor: Colors.transparent,
            body: bloc.oneSoal.isEmpty != null
                ? streamBuilder(bloc.oneSoal)
                : Container()),
      ),
    );
  }
}
