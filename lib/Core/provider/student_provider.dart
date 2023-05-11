import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:school_managment_system/Core/Models/app_user_model.dart';

class StudentProvider extends ChangeNotifier {
  int studentsIndex = 0;
  String adminPicUrl = '';
  AppUserModel admin = AppUserModel();
  changeScreen(int indexx) {
    // print(indexx);
    studentsIndex = indexx;
    notifyListeners();
  }

  StudentProvider() {
    init();
  }

  init() async {
    final firestore = await FirebaseFirestore.instance
        .collection("Admin")
        .doc('AdminInformation')
        .get();
    admin = AppUserModel.fromJson(firestore.data()!);
    notifyListeners();
  }

  int teachersIndex = 0;
  changeTeacherScreen(int tindex) {
    teachersIndex = tindex;
    notifyListeners();
  }

  uploadAdminPIc() async {
    FilePickerResult? filePickerResult;
    filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ["jpg", "png", "svg"]);
    if (filePickerResult != null) {
      try {
        final bts = filePickerResult.files.single.bytes;
        var name = filePickerResult.files.single.name;
        // print('image uploaded');
        // print('image uploaded');
        final refrence = FirebaseStorage.instance.ref().child("Admin/$name");
        final uploadTask = refrence.putData(bts!);
        final snapshot = await uploadTask;
        adminPicUrl = await snapshot.ref.getDownloadURL();
        admin.imageUrl = adminPicUrl;
      } catch (e) {
        // print(e);
      }
    }

    notifyListeners();
  }

  int accountsIndex = 0;
  changeAccountScrean(int accountIndex2) {
    log(accountIndex2.toString());
    accountsIndex = accountIndex2;
    notifyListeners();
  }

  int index = 0;
  sideNavigator(int value) {
    index = value;
    notifyListeners();
  }
}
