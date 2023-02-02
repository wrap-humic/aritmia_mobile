import 'package:aritmia_mobile/datasource/patient_datasource.dart';
import 'package:aritmia_mobile/models/list_patient_record_response.dart';
import 'package:aritmia_mobile/models/list_patient_response.dart';
import 'package:flutter/cupertino.dart';

class PatientProvider with ChangeNotifier {
  Future<List<Patient>> listAllPatient() async {
    return await PatientDataSource.listAllPatient();
  }

  Future<List<PatientRecord>> listPatientRecord(int idPasien) async {
    return await PatientDataSource.listPatientRecord(idPasien);
  }
}
