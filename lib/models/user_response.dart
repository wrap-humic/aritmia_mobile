import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  User data;
  String message;
  int statusCode;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        data: User.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status_code": statusCode,
      };
}

class User {
  User({
    required this.email,
    required this.id,
    required this.namaLengkap,
  });

  String email;
  int id;
  String namaLengkap;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        id: json["id"],
        namaLengkap: json["nama_lengkap"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "nama_lengkap": namaLengkap,
      };
}
