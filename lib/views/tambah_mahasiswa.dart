import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:unsri_flutter/controllers/mahasiswa_controller.dart';

class TambahMahasiswa extends StatelessWidget {
  TambahMahasiswa({super.key});

  var controller = Get.find<MahasiswaController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: Column(
        children: [
          Text('Nama : '),
          TextField(controller: controller.nama),
          Text('Kelas : '),
          TextField(controller: controller.kelas),
          ElevatedButton(
              onPressed: () {
                controller.createData();
              },
              child: Text('Simpan'))
        ],
      ),
    );
  }
}
