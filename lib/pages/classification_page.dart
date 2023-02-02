import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/arrythmia_classify_provider.dart';

class ClassificationPage extends StatefulWidget {
  const ClassificationPage({super.key});

  @override
  State<ClassificationPage> createState() => _ClassificationPageState();
}

class _ClassificationPageState extends State<ClassificationPage> {
  final TextEditingController _controllerR = TextEditingController();
  final TextEditingController _controllerP = TextEditingController();
  final TextEditingController _controllerQ = TextEditingController();
  final TextEditingController _controllerS = TextEditingController();
  final TextEditingController _controllerT = TextEditingController();
  final TextEditingController _controllerQrs = TextEditingController();
  final TextEditingController _controllerRrInt = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _hideView = true;
  late String classificationText;
  Future<void> classificationData() async {
    setState(() {
      _isLoading = true;
    });

    ArrythmiaClassifyProvider provider =
        context.read<ArrythmiaClassifyProvider>();

    String classification = await provider.classificationData(
      ecgRPeaks: double.parse(_controllerR.text),
      ecgPPeaks: double.parse(_controllerP.text),
      ecgQPeaks: double.parse(_controllerQ.text),
      ecgSPeaks: double.parse(_controllerS.text),
      ecgTPeaks: double.parse(_controllerT.text),
      qrs: double.parse(_controllerQrs.text),
      rrinterval: double.parse(_controllerRrInt.text),
    );

    classificationText = classification;

    setState(() {
      _hideView = false;
    });
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: const Color(0xFF585FFF)));
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80.0,
                  ),
                  Image.asset(
                    'assets/images/icon_mobile.png',
                    height: 80,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Fill this field';
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(hintText: "ECG_R_Peaks"),
                            controller: _controllerR,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Fill this field';
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(hintText: "ECG_P_Peaks"),
                            controller: _controllerP,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Fill this field';
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(hintText: "ECG_Q_Peaks"),
                            controller: _controllerQ,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Fill this field';
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(hintText: "ECG_S_Peaks"),
                            controller: _controllerS,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Fill this field';
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(hintText: "ECG_T_Peaks"),
                            controller: _controllerT,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Fill this field';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(hintText: "QRS"),
                            controller: _controllerQrs,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Fill this field';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(hintText: "RR Interval"),
                        controller: _controllerRrInt,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        classificationData();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text('Classify'),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  _hideView
                      ? const SizedBox(
                          height: 0,
                        )
                      : const Text(
                          'Classification Result',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  _hideView
                      ? const SizedBox(
                          height: 0,
                        )
                      : Text(
                          classificationText,
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
