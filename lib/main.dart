import 'package:flutter/material.dart';
import 'package:latihan_cpns_sejak_dini/blocs/soal_bloc.dart';
import 'package:latihan_cpns_sejak_dini/models/setting_model.dart';

void main() {
  runApp(MyApp());
  bloc.fetchSetting();
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  SettingModel _settingModel = SettingModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LATIHAN CPNS',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "http://192.168.100.22/latihan_cpns/asset/background.jpg"),
                  fit: BoxFit.cover)),
          child: Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text('LATIHAN CPNS'),
              ),
              backgroundColor: Colors.orange[300],
            ),
            backgroundColor: Colors.transparent,
            body: StreamBuilder(
              stream: bloc.oneSetting,
              builder: (context, snapshot) {
                _settingModel = bloc.tempSettingModel;
                if (snapshot.hasData) {
                  if(_settingModel.isMaintenance == '0'){
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Wrap(
                            children: [
                              InkWell(
                                onTap: () {
                                  bloc.fetchCountSoal('TIU', context);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                  width: 250,
                                  height: 125,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(0.0, 0.5), //(x,y)
                                          blurRadius: 1.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.1),
                                              BlendMode.darken),
                                          image: NetworkImage(
                                              'http://192.168.100.22/latihan_cpns/asset/tiu-button-bg.jpg'),
                                          fit: BoxFit.cover)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'TIU',
                                          style: TextStyle(
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                ),
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(125, 0, 0, 255),
                                                ),
                                              ],
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '(Tes Inteligensi Umum)',
                                          style: TextStyle(
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                ),
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(125, 0, 0, 255),
                                                ),
                                              ],
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            children: [
                              InkWell(
                                onTap: () {
                                  bloc.fetchCountSoal('TKP', context);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                  width: 250,
                                  height: 125,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0.0, 0.5), //(x,y)
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.05),
                                            BlendMode.darken),
                                        image: NetworkImage(
                                            'http://192.168.100.22/latihan_cpns/asset/tkp-button-bg.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'TKP',
                                          style: TextStyle(
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(200, 0, 0, 0),
                                                ),
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(125, 0, 0, 255),
                                                ),
                                              ],
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '(Tes karakteristik Pribadi)',
                                          style: TextStyle(
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                ),
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(125, 0, 0, 255),
                                                ),
                                              ],
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            children: [
                              InkWell(
                                onTap: () {
                                  bloc.fetchCountSoal('TWK', context);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                  width: 250,
                                  height: 125,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(0.0, 0.5), //(x,y)
                                          blurRadius: 1.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.02),
                                              BlendMode.darken),
                                          image: NetworkImage(
                                              'http://192.168.100.22/latihan_cpns/asset/twk-button-bg.jpg'),
                                          fit: BoxFit.cover)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'TWK',
                                          style: TextStyle(
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(200, 0, 0, 0),
                                                ),
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(125, 0, 0, 255),
                                                ),
                                              ],
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '(Tes Wawasan Kebangsaan)',
                                          style: TextStyle(
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(200, 0, 0, 0),
                                                ),
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(125, 0, 0, 255),
                                                ),
                                              ],
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ); //mainPage
                  } else {
                    return  Center(
                      child: Wrap(
                        children: [
                          Container(
                            height: 300,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0.0, 0.5), //(x,y)
                                    blurRadius: 1.0,
                                  ),
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'http://192.168.100.22/latihan_cpns/asset/maintenance.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.only(top: 100, left: 50, right: 50),
                              child: Center(
                                child: Text(
                                  'APLIKASI SEDANG DALAM MAINTENANCE', textAlign: TextAlign.center,
                                  style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(200, 0, 0, 0),
                                        ),
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(125, 0, 0, 255),
                                        ),
                                      ],
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          )],
                      ),
                    ); // underMaintenance
                  }
                } else {
                  return Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                        height: 100,
                        width: 100,
                      )); //isLoading
                }
              },
            )
    )));
  }

}
