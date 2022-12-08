import 'package:dio/dio.dart';
import 'package:unsri_flutter/models/mahasiswa_models.dart';
import 'package:unsri_flutter/utils.dart';

class MahasiswaService {
  Future<List<MahasiswaModel>> getMahasiswa() async {
    List<MahasiswaModel> dataMahasiswa = [];
    try {
      var response = await Dio().get('$baseUrl/siswa-unsri');
      print(response);
      for (var i = 0; i < response.data.length; i++) {
        dataMahasiswa.add(MahasiswaModel.fromJson(response.data[i]));
      }
    } catch (e) {
      print(e);
    }

    return dataMahasiswa;
  }

  Future<List<MahasiswaModel>> createMahasiswa(
      String nama, String kelas) async {
    List<MahasiswaModel> dataMahasiswa = [];
    try {
      var response = await Dio()
          .post('$baseUrl/siswa-unsri', data: {'nama': nama, 'kelas': kelas});
      print(response);
      for (var i = 0; i < response.data.length; i++) {
        dataMahasiswa.add(MahasiswaModel.fromJson(response.data[i]));
      }
    } catch (e) {
      print(e);
    }

    return dataMahasiswa;
  }

  Future<List<MahasiswaModel>> updateMahasiswa(
      String id, String nama, String kelas) async {
    List<MahasiswaModel> dataMahasiswa = [];
    try {
      var response = await Dio().put('$baseUrl/siswa-unsri/$id',
          data: {'nama': nama, 'kelas': kelas});
      print(response);
      for (var i = 0; i < response.data.length; i++) {
        dataMahasiswa.add(MahasiswaModel.fromJson(response.data[i]));
      }
    } catch (e) {
      print(e);
    }

    return dataMahasiswa;
  }

  Future<List<MahasiswaModel>> deleteMahasiswa(String id) async {
    List<MahasiswaModel> dataMahasiswa = [];
    try {
      var response = await Dio().delete('$baseUrl/siswa-unsri/$id');
      print(response);
      for (var i = 0; i < response.data.length; i++) {
        dataMahasiswa.add(MahasiswaModel.fromJson(response.data[i]));
      }
    } catch (e) {
      print(e);
    }

    return dataMahasiswa;
  }
}

var mahasiswaService = MahasiswaService();
