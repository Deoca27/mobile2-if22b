// import 'package:bcdx_11312136/app/modules/mahasiswa/controllers/mahasiswa_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/mahasiswa/controllers/mahasiswa_controller.dart';

class MahasiswaAddView extends GetView<MahasiswaController> {
  const MahasiswaAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNpm,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "NPM"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNama,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNpm.text,
                controller.cNama.text,
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}


// akhir code

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// class MahasiswaAddView extends GetView {
//   const MahasiswaAddView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MahasiswaAddView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'MahasiswaAddView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
