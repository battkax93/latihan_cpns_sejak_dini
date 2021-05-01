class SoalModel {
  String code;
  String message;
  int jumlah;
  String jenis;
  List<Data> data;

  SoalModel({this.code, this.message, this.jumlah, this.jenis, this.data});

  SoalModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    jumlah = json['jumlah'];
    jenis = json['jenis'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['jumlah'] = this.jumlah;
    data['jenis'] = this.jenis;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String jenis;
  String soal;
  String a;
  String b;
  String c;
  String d;
  String jawabanBenar;
  String image;
  int isConfirmed;
  int benar;
  int salah;

  Data(
      {this.id,
        this.jenis,
        this.soal,
        this.a,
        this.b,
        this.c,
        this.d,
        this.jawabanBenar,
        this.image,
        this.isConfirmed,
        this.benar,
        this.salah});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenis = json['jenis'];
    soal = json['soal'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    jawabanBenar = json['jawaban_benar'];
    image = json['image'];
    isConfirmed = json['is_confirmed'];
    benar = json['benar'];
    salah = json['salah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jenis'] = this.jenis;
    data['soal'] = this.soal;
    data['a'] = this.a;
    data['b'] = this.b;
    data['c'] = this.c;
    data['d'] = this.d;
    data['jawaban_benar'] = this.jawabanBenar;
    data['image'] = this.image;
    data['is_confirmed'] = this.isConfirmed;
    data['benar'] = this.benar;
    data['salah'] = this.salah;
    return data;
  }
}
