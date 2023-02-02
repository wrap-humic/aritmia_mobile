import 'package:aritmia_mobile/models/arrythmia_classify_response.dart';
import 'package:aritmia_mobile/network/dio_instance.dart';
import 'package:dio/dio.dart';

class ArrythmiaClassifyDataSource {
  static Future<String> classificationData({
    required ecgRPeaks,
    required ecgPPeaks,
    required ecgQPeaks,
    required ecgSPeaks,
    required ecgTPeaks,
    required qrs,
    required rrinterval,
  }) async {
    var formData = FormData.fromMap({
      'ecgrpeaks': ecgRPeaks,
      'ecgppeaks': ecgPPeaks,
      'ecgqpeaks': ecgQPeaks,
      'ecgspeaks': ecgSPeaks,
      'ecgtpeaks': ecgTPeaks,
      'qrs': qrs,
      'rrinterval': rrinterval,
    });
    Response<String> response = await DioInstance.dio.post(
      '/classify',
      data: formData,
    );

    return arrythmiaClassifyResponseFromJson(response.data ?? "").data!;
  }
}
