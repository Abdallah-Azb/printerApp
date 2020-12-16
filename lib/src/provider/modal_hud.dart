import 'package:flutter/cupertino.dart';

class ModalHud extends ChangeNotifier {
  bool isloading = false;

  ChangeLoading(bool val) {
    isloading = val;
    notifyListeners();
  }
}
