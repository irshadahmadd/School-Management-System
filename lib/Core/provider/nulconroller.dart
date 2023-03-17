import 'package:flutter/foundation.dart';

// ignore: camel_case_types
class nullContollerProvider extends ChangeNotifier {
  bool isSubmitted = false;
  void submited(bool isSubmitted) {
    if (isSubmitted == true) {}
  }
}
