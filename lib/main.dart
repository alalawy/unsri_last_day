import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsri_flutter/controllers/mahasiswa_controller.dart';
import 'package:unsri_flutter/views/edit_mahasiswa.dart';
import 'package:unsri_flutter/views/tambah_mahasiswa.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var controller = Get.put(MahasiswaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.dataMahasiswa().length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    'https://awsimages.detik.net.id/community/media/visual/2019/06/17/efaf0d29-7fc6-4916-b757-4cb0649cebe0.jpeg?w=700&q=90',
                    width: 150,
                  ),
                  Column(
                    children: [
                      Text('Nama : ${controller.dataMahasiswa()[index].nama}'),
                      Text('Kelas : ${controller.dataMahasiswa()[index].kelas}')
                    ],
                  ),
                  InkWell(
                    onTap: () => Get.to(() => EditMahasiswa(
                          data: controller.dataMahasiswa()[index],
                        )),
                    child: Icon(
                      Icons.edit,
                      color: Colors.orange,
                    ),
                  ),
                  InkWell(
                    onTap: () => controller
                        .deleteData(controller.dataMahasiswa()[index].sId),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => TambahMahasiswa()),
        child: Icon(Icons.add),
      ),
    );
  }
}
