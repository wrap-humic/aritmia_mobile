import 'package:dio/dio.dart';

import '../common/constant.dart';

class DioInstance {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.plain,
      contentType: 'multipart/form-data',
      validateStatus: (int? code) {
        return true;
      },
    ),
  );
}
