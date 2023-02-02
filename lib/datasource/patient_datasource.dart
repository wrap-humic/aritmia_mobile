import 'package:aritmia_mobile/models/list_patient_record_response.dart';
import 'package:aritmia_mobile/models/list_patient_response.dart';
import 'package:dio/dio.dart';

import '../network/dio_instance.dart';

class PatientDataSource {
  static Future<List<Patient>> listAllPatient() async {
    Response<String> response = await DioInstance.dio.get(
      '/api/patient',
    );
    return listPatientResponseFromJson(response.data ?? "").data;
  }

  static Future<List<PatientRecord>> listPatientRecord(int idPasien) async {
    Response<String> response = await DioInstance.dio.get(
      '/api/record_statistic/$idPasien',
    );
    return listPatientRecordResponseFromJson(response.data ?? "").data;
  }
}
