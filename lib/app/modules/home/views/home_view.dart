import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // HomeView({super.key});

  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.defaultDialog(
      //       title: "Logout?",
      //       middleText: "Are you sure want to logout?",
      //       onConfirm: () {
      //         Get.back();
      //         // Tambahkan kode untuk logout di sini
      //       },
      //       onCancel: () {
      //         Get.back();
      //       },
      //     );
      //   },
      //   child: const Icon(Icons.logout),
      // ),

      body: Center(
        child: ElevatedButton(
              onPressed: () {
                cAuth.logout();
              },
              // child: const Text('My Button'),
              child: const Icon(Icons.logout),
              
            ),
      
        // child: Text(
        //   'HomeView is working',
        //   style: TextStyle(fontSize: 20),
        // ),
        
      ),
    );
  }
}
