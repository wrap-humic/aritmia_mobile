import 'dart:convert';

import 'package:aritmia_mobile/common/constant.dart';
import 'package:aritmia_mobile/models/user_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datasource/user_datasource.dart';

class UserProvider with ChangeNotifier {
  late final SharedPreferences _preferences;
  UserResponse? _user;

  UserResponse? get user => _user;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences.getString(userPref) != null) {
      Map<String, dynamic> userMap =
          jsonDecode(_preferences.getString(userPref)!);
      _user = UserResponse.fromJson(userMap);
    }
  }

  Future<UserResponse> login({
    required String email,
    required String password,
  }) async {
    UserResponse auth = await UserDataSource.login(
      email: email,
      password: password,
    );

    notifyListeners();
    return auth;
  }

  Future<UserResponse> register({
    required String username,
    required String password,
    required String namaLengkap,
  }) async {
    UserResponse register = await UserDataSource.register(
      username: username,
      password: password,
      namaLengkap: namaLengkap,
    );

    notifyListeners();
    return register;
  }
}
