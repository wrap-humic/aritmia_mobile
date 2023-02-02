import 'package:aritmia_mobile/models/list_patient_record_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListRecord extends StatelessWidget {
  final List<PatientRecord> recordList;

  const ListRecord({super.key, required this.recordList});

  String _tanggalRecordFormatted(index) {
    final dateTimeString = recordList[index].tanggalRecord;
    final dateFormat = DateFormat("E, dd MMM yyyy HH:mm:ss 'GMT'");
    final dateTime = dateFormat.parse(dateTimeString);
    final formattedDate = DateFormat("dd MMM yyyy").format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recordList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(37, 0, 0, 0),
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.2, 2.2), // shadow direction: bottom right
              )
            ],
          ),
          margin: const EdgeInsets.only(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
            top: 8.0,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  color: Color(0xFFFF5252),
                ),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  _tanggalRecordFormatted(index),
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Atrial Prremature Beat : ',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      recordList[index].atrialPrematureBeat.toString(),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      'Left bundle branch block beat : ',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      recordList[index].leftBundleBranchBlockBeat.toString(),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      'Normal : ',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      recordList[index].normal.toString(),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      'Premature ventricular contraction : ',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      recordList[index]
                          .prematureVentricularContraction
                          .toString(),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      'Right bundle branch block beat : ',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      recordList[index].rightBundleBranchBlockBeat.toString(),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
