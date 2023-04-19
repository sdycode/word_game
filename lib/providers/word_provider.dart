import 'package:flutter/foundation.dart';

class WordProvider with ChangeNotifier {
  updateUI() {
    notifyListeners();
  }
}
