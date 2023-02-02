import 'dart:convert';

ListPatientResponse listPatientResponseFromJson(String str) =>
    ListPatientResponse.fromJson(json.decode(str));

String listPatientResponseToJson(ListPatientResponse data) =>
    json.encode(data.toJson());

class ListPatientResponse {
  ListPatientResponse({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  List<Patient> data;
  String message;
  int statusCode;

  factory ListPatientResponse.fromJson(Map<String, dynamic> json) =>
      ListPatientResponse(
        data: List<Patient>.from(json["data"].map((x) => Patient.fromJson(x))),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status_code": statusCode,
      };
}

class Patient {
  Patient({
    required this.id,
    required this.jenisKelamin,
    required this.kondisiKesehatan,
    required this.nama,
    required this.tanggalLahir,
    required this.umur,
  });

  int id;
  String jenisKelamin;
  String kondisiKesehatan;
  String nama;
  String tanggalLahir;
  int umur;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        jenisKelamin: json["jenis_kelamin"],
        kondisiKesehatan: json["kondisi_kesehatan"],
        nama: json["nama"],
        tanggalLahir: json["tanggal_lahir"],
        umur: json["umur"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_kelamin": jenisKelamin,
        "kondisi_kesehatan": kondisiKesehatan,
        "nama": nama,
        "tanggal_lahir": tanggalLahir,
        "umur": umur,
      };
}
