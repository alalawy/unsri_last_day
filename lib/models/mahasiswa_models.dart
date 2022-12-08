class MahasiswaModel {
  String? sId;
  String? nama;
  String? kelas;

  MahasiswaModel({this.sId, this.nama, this.kelas});

  MahasiswaModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nama = json['nama'];
    kelas = json['kelas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nama'] = this.nama;
    data['kelas'] = this.kelas;
    return data;
  }
}
