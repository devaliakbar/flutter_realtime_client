import 'package:flutter/material.dart';
import 'package:flutter_realtime/features/auth/models/user.dart';

class AppState extends ChangeNotifier {
  User? user;
  String? jwtToken;

  bool showLoading = false;

  void setUser(User usr) {
    user = usr;
  }

  void setJwtToken(String jwt) {
    jwtToken = jwt;
  }

  void changeLoad(bool status) {
    showLoading = status;
    notifyListeners();
  }
}
