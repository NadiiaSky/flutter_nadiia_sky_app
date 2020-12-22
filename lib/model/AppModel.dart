import 'package:flutter/cupertino.dart';


class AppModel with ChangeNotifier {
  Widget _page;
  bool _isMainPage;
  String _tile;

  Widget get page => _page;

  set page(Widget value) {
    _page = value;
    notifyListeners();
  }

  String get tile => _tile ?? "";

  set tile(String value) {
    _tile = value;
    notifyListeners();
  }

  bool get isMainPage => _isMainPage ?? true;

  set isMainPage(bool value) {
    _isMainPage = value;
    notifyListeners();
  }
}