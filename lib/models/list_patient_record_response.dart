import 'dart:convert';

ListPatientRecordResponse listPatientRecordResponseFromJson(String str) =>
    ListPatientRecordResponse.fromJson(json.decode(str));

String listPatientRecordResponseToJson(ListPatientRecordResponse data) =>
    json.encode(data.toJson());

class ListPatientRecordResponse {
  ListPatientRecordResponse({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  List<PatientRecord> data;
  String message;
  int statusCode;

  factory ListPatientRecordResponse.fromJson(Map<String, dynamic> json) =>
      ListPatientRecordResponse(
        data: List<PatientRecord>.from(
            json["data"].map((x) => PatientRecord.fromJson(x))),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status_code": statusCode,
      };
}

class PatientRecord {
  PatientRecord({
    required this.atrialPrematureBeat,
    required this.id,
    required this.idPasien,
    required this.leftBundleBranchBlockBeat,
    required this.normal,
    required this.path,
    required this.prematureVentricularContraction,
    required this.rightBundleBranchBlockBeat,
    required this.tanggalRecord,
  });

  int atrialPrematureBeat;
  int id;
  int idPasien;
  int leftBundleBranchBlockBeat;
  int normal;
  String path;
  int prematureVentricularContraction;
  int rightBundleBranchBlockBeat;
  String tanggalRecord;

  factory PatientRecord.fromJson(Map<String, dynamic> json) => PatientRecord(
        atrialPrematureBeat: json["atrial_premature_beat"],
        id: json["id"],
        idPasien: json["id_pasien"],
        leftBundleBranchBlockBeat: json["left_bundle_branch_block_beat"],
        normal: json["normal"],
        path: json["path"],
        prematureVentricularContraction:
            json["premature_ventricular_contraction"],
        rightBundleBranchBlockBeat: json["right_bundle_branch_block beat"],
        tanggalRecord: json["tanggal_record"],
      );

  Map<String, dynamic> toJson() => {
        "atrial_premature_beat": atrialPrematureBeat,
        "id": id,
        "id_pasien": idPasien,
        "left_bundle_branch_block_beat": leftBundleBranchBlockBeat,
        "normal": normal,
        "path": path,
        "premature_ventricular_contraction": prematureVentricularContraction,
        "right_bundle_branch_block beat": rightBundleBranchBlockBeat,
        "tanggal_record": tanggalRecord,
      };
}
