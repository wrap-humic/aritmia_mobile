import 'package:aritmia_mobile/models/list_patient_response.dart';
import 'package:aritmia_mobile/pages/list_record_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListPatient extends StatelessWidget {
  final List<Patient> patientList;

  const ListPatient({super.key, required this.patientList});

  String _tanggalLahirFormatted(index) {
    final dateTimeString = patientList[index].tanggalLahir;
    final dateFormat = DateFormat("E, dd MMM yyyy HH:mm:ss 'GMT'");
    final dateTime = dateFormat.parse(dateTimeString);
    final formattedDate = DateFormat("dd MMM yyyy").format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: patientList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            ListRecordPage.routeName,
            arguments: {
              'idPasien': patientList[index].id,
              'namaPasien': patientList[index].nama
            },
          );
        },
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
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                patientList[index].jenisKelamin == 'LAKI-LAKI'
                    ? Image.asset(
                        'assets/images/man.png',
                        height: 40,
                        width: 40,
                      )
                    : Image.asset(
                        'assets/images/woman.png',
                        height: 40,
                        width: 40,
                      ),
                const SizedBox(
                  width: 16.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Nama : ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                patientList[index].nama,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tanggal Lahir : ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                _tanggalLahirFormatted(index),
                                style: const TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Kondisi kesehatan : ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                patientList[index].kondisiKesehatan,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Jenis Kelamin : ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                patientList[index]
                                        .jenisKelamin[0]
                                        .toUpperCase() +
                                    patientList[index]
                                        .jenisKelamin
                                        .substring(1),
                                style: const TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
