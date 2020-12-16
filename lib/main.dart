import 'package:flutter/material.dart';
import 'dart:math';
import 'package:latihan_cpns_sejak_dini/page/SoalPage.dart';
import 'package:latihan_cpns_sejak_dini/blocs/soal_bloc.dart';
import 'package:latihan_cpns_sejak_dini/models/soal_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
    image: AssetImage('images/cat.jpg'), fit: BoxFit.cover)),
    child: latCpns(title: 'LATIHAN CPNS'),
    ));
  }
}

class latCpns extends StatefulWidget {
  latCpns({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _latCpnsState createState() => _latCpnsState();
}

class _latCpnsState extends State<latCpns> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(
                title: Center(
                  child: Text(widget.title),
                ),
                backgroundColor: Colors.orange[300],
              ),
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      children: [
                        InkWell(
                          onTap: () {
                            print('halo');
                            bloc.fetchCountSoal('TIU', context);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            width: 250,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'TIU',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        InkWell(
                          onTap: (){
                            bloc.fetchCountSoal('TKP', context);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            width: 250,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'TKP',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        InkWell(
                          onTap: (){
                            bloc.fetchCountSoal('TWK', context);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            width: 250,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'TWK',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}
