import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsri_flutter/models/mahasiswa_models.dart';
import 'package:unsri_flutter/services/mahasiswa_service.dart';

class MahasiswaController extends GetxController {
  var dataMahasiswa = <MahasiswaModel>[].obs;
  TextEditingController nama = TextEditingController();
  TextEditingController kelas = TextEditingController();

  void createData() {
    var data = mahasiswaService.createMahasiswa(nama.text, kelas.text);
    getData();
    Get.back();
  }

  void updateData(id) {
    var data = mahasiswaService.updateMahasiswa(id, nama.text, kelas.text);
    getData();
    Get.back();
  }

  void deleteData(id) {
    var data = mahasiswaService.deleteMahasiswa(id);
    getData();
    Get.back();
  }

  void getData() async {
    var data = mahasiswaService.getMahasiswa();
    dataMahasiswa.value = await data;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
