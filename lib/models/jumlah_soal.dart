class CountSoal {
  int code;
  String message;
  int jumlahSoal;

  CountSoal({this.code, this.message, this.jumlahSoal});

  CountSoal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['Message'];
    jumlahSoal = json['jumlah_soal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['Message'] = this.message;
    data['jumlah_soal'] = this.jumlahSoal;
    return data;
  }
}