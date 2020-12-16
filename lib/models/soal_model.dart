// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SoalModel SoalFromJson(String str) => SoalModel.fromJson(json.decode(str));

String SoalToJson(SoalModel data) => json.encode(data.toJson());

class SoalModel {
  SoalModel({
    this.id,
    this.jenis,
    this.soal,
    this.a,
    this.b,
    this.c,
    this.d,
    this.jawabanBenar,
    this.image,
    this.benar,
    this.salah,
  });

  String id;
  String jenis;
  String soal;
  String a;
  String b;
  String c;
  String d;
  String jawabanBenar;
  String image;
  String benar;
  String salah;

  factory SoalModel.fromJson(Map<String, dynamic> json) => SoalModel(
    id: json["id"],
    jenis: json["jenis"],
    soal: json["soal"],
    a: json["a"],
    b: json["b"],
    c: json["c"],
    d: json["d"],
    jawabanBenar: json["jawaban_benar"],
    image: json["image"],
    benar: json["benar"],
    salah: json["salah"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "jenis": jenis,
    "soal": soal,
    "a": a,
    "b": b,
    "c": c,
    "d": d,
    "jawaban_benar": jawabanBenar,
    "image": image,
    "benar": benar,
    "salah": salah,
  };
}
