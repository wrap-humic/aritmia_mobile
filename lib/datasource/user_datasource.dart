import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/constant.dart';
import '../models/user_response.dart';
import '../network/dio_instance.dart';

class UserDataSource {
  static Future<UserResponse> login({
    required String email,
    required String password,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var formData = FormData.fromMap({
      'email': email,
      'password': password,
    });
    Response<String> response =
        await DioInstance.dio.post('/api/login', data: formData);

    if (response.data != null) {
      Map<String, dynamic> json = jsonDecode(response.data!);
      String user = jsonEncode(json);
      preferences.setString(userPref, user);
    }

    return userResponseFromJson(response.data ?? "");
  }

  static Future<UserResponse> register(
      {required String username,
      required String password,
      required String namaLengkap}) async {
    var formData = FormData.fromMap({
      'email': username,
      'password': password,
      'nama_lengkap': namaLengkap,
    });

    Response<String> response =
        await DioInstance.dio.post('/api/register', data: formData);

    return userResponseFromJson(response.data ?? "");
  }
}
