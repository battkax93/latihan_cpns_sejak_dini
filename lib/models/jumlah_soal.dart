class CountSoal {
  int jumlahSoal;

  CountSoal({this.jumlahSoal});

  CountSoal.fromJson(Map<String, dynamic> json) {
    jumlahSoal = json['jumlah_soal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jumlah_soal'] = this.jumlahSoal;
    return data;
  }
}