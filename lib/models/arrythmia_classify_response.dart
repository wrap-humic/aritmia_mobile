// To parse this JSON data, do
//     final arrythmiaClassifyResponse = arrythmiaClassifyResponseFromJson(jsonString);
import 'dart:convert';

ArrythmiaClassifyResponse arrythmiaClassifyResponseFromJson(String str) =>
    ArrythmiaClassifyResponse.fromJson(json.decode(str));

String arrythmiaClassifyResponseToJson(ArrythmiaClassifyResponse? data) =>
    json.encode(data!.toJson());

class ArrythmiaClassifyResponse {
  ArrythmiaClassifyResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  String? data;
  String? message;
  String? status;

  factory ArrythmiaClassifyResponse.fromJson(Map<String, dynamic> json) =>
      ArrythmiaClassifyResponse(
        data: json["data"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "status": status,
      };
}
