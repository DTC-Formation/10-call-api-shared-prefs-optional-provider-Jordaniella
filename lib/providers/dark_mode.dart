import 'package:flutter/material.dart';

class DarkProvider with ChangeNotifier {
  bool isDark = false;
  Color bgColor = Colors.white;
  Color textColor = const Color.fromRGBO(121, 106, 127, 1);
  Color grey = const Color.fromRGBO(240, 240, 240, 1);

  setMode() {
    isDark = !isDark;
    if (isDark) {
      textColor = Colors.white;
      grey = const Color.fromRGBO(34, 34, 34, 1);
      bgColor = const Color.fromARGB(255, 27, 26, 26);
    } else {
      bgColor = Colors.white;
      textColor = const Color.fromRGBO(121, 106, 127, 1);
      grey = const Color.fromRGBO(240, 240, 240, 1);
    }
    notifyListeners();
  }
}
