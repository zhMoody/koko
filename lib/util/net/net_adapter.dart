import "dart:convert";

import "../../dao/base_request.dart";

class NetResponse<T> {
  T? data;
  BaseRequest? request;
  int? statusCode;
  String? message = "";
  late dynamic extra;

  NetResponse(
      {this.data,
      required this.request,
      this.statusCode,
      this.message,
      this.extra});

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}

abstract class NetAdapter {
  Future<NetResponse<T>> send<T>(BaseRequest request);
}
