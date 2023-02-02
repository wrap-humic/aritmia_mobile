import 'package:aritmia_mobile/datasource/arrythmia_classify_datasource.dart';
import 'package:flutter/cupertino.dart';

class ArrythmiaClassifyProvider with ChangeNotifier {
  Future<String> classificationData({
    required ecgRPeaks,
    required ecgPPeaks,
    required ecgQPeaks,
    required ecgSPeaks,
    required ecgTPeaks,
    required qrs,
    required rrinterval,
  }) async {
    String response = await ArrythmiaClassifyDataSource.classificationData(
      ecgRPeaks: ecgRPeaks,
      ecgPPeaks: ecgPPeaks,
      ecgQPeaks: ecgQPeaks,
      ecgSPeaks: ecgSPeaks,
      ecgTPeaks: ecgTPeaks,
      qrs: qrs,
      rrinterval: rrinterval,
    );
    notifyListeners();
    return response;
  }
}
