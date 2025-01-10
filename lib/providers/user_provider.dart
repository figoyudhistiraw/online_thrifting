import 'package:flutter/material.dart';
import 'package:thriftnstash/models/users.dart';
import 'package:thriftnstash/services/authentication_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? _usermodel;
  final AuthService _authService = AuthService();

  UserModel? get getUser => _usermodel;
  Future<void> refreshUser() async {
    UserModel usermodel = await _authService.getUserDetails();
    _usermodel = usermodel;
    notifyListeners();
  }
}
