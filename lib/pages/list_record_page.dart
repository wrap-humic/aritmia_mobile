import 'package:aritmia_mobile/models/list_patient_record_response.dart';
import 'package:aritmia_mobile/widget/list_rercord.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/patient_provider.dart';

class ListRecordPage extends StatefulWidget {
  final int idPasien;
  final String namaPasien;
  static const routeName = '/list_record_page';
  const ListRecordPage(
      {super.key, required this.idPasien, required this.namaPasien});

  @override
  State<ListRecordPage> createState() => _ListRecordPageState();
}

class _ListRecordPageState extends State<ListRecordPage> {
  bool _isLoading = false;
  List<PatientRecord> listRecord = [];

  Future<void> listPatientRecord() async {
    setState(() {
      _isLoading = true;
    });

    PatientProvider provider = context.read<PatientProvider>();

    List<PatientRecord> response =
        await provider.listPatientRecord(widget.idPasien);
    listRecord.addAll(response);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    listPatientRecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Record ${widget.namaPasien}',
        ),
      ),
      body: _isLoading
          ? const SizedBox(
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                ),
              ),
            )
          : ListRecord(recordList: listRecord),
    );
  }
}
