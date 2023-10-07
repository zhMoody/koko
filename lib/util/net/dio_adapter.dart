import "package:dio/dio.dart";

import "../../dao/base_request.dart";
import "error.dart";
import "net_adapter.dart";

class DioAdapter extends NetAdapter {
  @override
  Future<NetResponse<T>> send<T>(BaseRequest request) async {
    dynamic response;
    var options = Options(headers: request.header);
    DioException? error;

    try {
      switch (request.method()) {
        case Method.get:
          response = await Dio().get(request.url(), options: options);
          break;
        case Method.post:
          response = await Dio()
              .post(request.url(), data: request.params, options: options);
          break;
        case Method.put:
          response = await Dio()
              .put(request.url(), data: request.params, options: options);
          break;
        case Method.delete:
          response = await Dio()
              .delete(request.url(), data: request.params, options: options);
          break;
      }
    } on DioException catch (e) {
      error = e;
      response = e.response;
    }
    if (error != null) {
      throw NetError(response?.statusCode ?? -1, error.toString(),
          data: await buildRes(response, request));
    }
    return buildRes(response, request);
  }

  Future<NetResponse<T>> buildRes<T>(Response? response, BaseRequest request) {
    return Future.value(NetResponse(
        data: response?.data,
        request: request,
        statusCode: response?.statusCode,
        message: response?.statusMessage,
        extra: response));
  }
}
