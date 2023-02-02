import 'package:aritmia_mobile/models/list_patient_response.dart';
import 'package:aritmia_mobile/provider/patient_provider.dart';
import 'package:aritmia_mobile/widget/list_patient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  bool _isLoading = false;
  List<Patient> listPatient = [];

  Future<void> listAllPatient() async {
    setState(() {
      _isLoading = true;
    });

    PatientProvider provider = context.read<PatientProvider>();

    List<Patient> response = await provider.listAllPatient();
    listPatient.addAll(response);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    listAllPatient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const SizedBox(
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            ),
          )
        : ListPatient(patientList: listPatient);
  }
}
