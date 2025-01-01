import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {

  late TextEditingController cNo_Karyawan;
  late TextEditingController cNama_Karyawan;
  late TextEditingController cJabatan_Karyawan;
  // late TextEditingController cFakultas;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference pegawai = firestore.collection('karyawan_22312168');

    return pegawai.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference pegawai = firestore.collection('karyawan_22312168');
    return pegawai.snapshots();
  }

  void add(String no_karyawan, String nama_karyawan, String jabatan_karyawan) async {
    CollectionReference pegawai = firestore.collection("karyawan_22312168");

    try {
      await pegawai.add({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
        // "fakultas": fakultas,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data pegawai",
          onConfirm: () {
            cNo_Karyawan.clear();
            cNama_Karyawan.clear();
            cJabatan_Karyawan.clear();
            // cFakultas.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
    print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan pegawai.",
      );
    }
  }

Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("karyawan_22312168").doc(id);

    return docRef.get();
  }

  void Update(String no_karyawan, String nama_karyawan, String jabatan_karyawan, String id) async {
    DocumentReference pegawaiById = firestore.collection("karyawan_22312168").doc(id);

    try {
      await pegawaiById.update({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
        // "fakultas": fakultas
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data pegawai.",
        onConfirm: () {
          cNo_Karyawan.clear();
          cNama_Karyawan.clear();
          cJabatan_Karyawan.clear();
          // cFakultas.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan peegawai.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("karyawan_22312168").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }


  @override
  void onInit() {

    cNo_Karyawan = TextEditingController();
    cNama_Karyawan = TextEditingController();
    cJabatan_Karyawan = TextEditingController();
    // cFakultas = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNo_Karyawan.dispose();
    cNama_Karyawan.dispose();
    cJabatan_Karyawan.dispose();
    // cFakultas.dispose();
    super.onClose();
  }

  // add(String text, String text2) {}
}

