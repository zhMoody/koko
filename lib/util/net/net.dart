import "package:flutter/material.dart";

import "../../dao/base_request.dart";
import "dio_adapter.dart";
import "error.dart";
import "net_adapter.dart";

class Net {
  Net._();

  static Net? _instance;

  static Net get shared => _instance ??= Net._();

  Future<NetResponse<T>> send<T>(BaseRequest request) async {
    log("url: ${request.url()}");
    var adapter = DioAdapter();
    return adapter.send(request);
  }

  Future fire(BaseRequest request) async {
    NetResponse? response;
    dynamic error;
    try {
      response = await send(request);
    } on NetError catch (e) {
      error = e;
      response = e.data;
      log(e.message);
    } catch (e) {
      error = e;
      log(e);
    }
    if (response == null) {
      log(error);
    }
    var result = response?.data;
    log(result);
    var status = response?.statusCode;
    switch (status) {
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString(), data: result);
      default:
        throw NetError(status ?? -1, result.toString(), data: result);
    }
  }

  void log(log) {
    debugPrint("net: ${log.toString()}");
  }
}
