import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:unsri_flutter/controllers/mahasiswa_controller.dart';
import 'package:unsri_flutter/models/mahasiswa_models.dart';

class EditMahasiswa extends StatelessWidget {
  EditMahasiswa({super.key, this.data});
  MahasiswaModel? data;

  var controller = Get.find<MahasiswaController>();

  @override
  Widget build(BuildContext context) {
    controller.nama.text = data!.nama!;
    controller.kelas.text = data!.kelas!;

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
                controller.updateData(data!.sId!);
              },
              child: Text('Update'))
        ],
      ),
    );
  }
}
