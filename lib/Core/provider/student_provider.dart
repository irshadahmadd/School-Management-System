import 'package:flutter/foundation.dart';

class StudentProvider extends ChangeNotifier {
  int studentsIndex = 0;
  changeScreen(int indexx) {
    // print(indexx);
    studentsIndex = indexx;
    notifyListeners();
  }
}
