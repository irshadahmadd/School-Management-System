import 'package:flutter/foundation.dart';

class StudentProvider extends ChangeNotifier {
  int studentsIndex = 0;

  changeScreen(int index) {
    print(index);
    studentsIndex = index;
    notifyListeners();
  }
}
