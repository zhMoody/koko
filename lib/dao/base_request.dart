import "../api/auth/login_dao.dart";
import "../util/cache/cache.dart";
import "../util/dot_env.dart";

enum Method {
  get,
  post,
  put,
  delete,
}

abstract class BaseRequest {
  dynamic api;
  bool isHttps = true;

  bool hasAuth();

  Map<String, dynamic> params = {};
  Map<String, String> header = {
    "Content-type": "application/json",
    "Authorization": "Bearer xxxxxx",
  };

  String authority() {
    var domain = dotEnv.get("domain");
    return "$domain";
  }

  Method method();

  String path();

  String url() {
    var prefix = dotEnv.get("prefix");
    var str = path();
    if (api != null) str = "${path()}$api";

    Uri uri = (isHttps ? Uri.https : Uri.http)(authority(), "$prefix$str",
        method() == Method.get ? getParams(params) : null);
    if (hasAuth()) {
      // addHeader(LoginDAO.boardingPass, LoginDAO.boardingPass);
    }
    return uri.toString();
  }

  Map<String, String> getParams(Map<String, dynamic> params) {
    Map<String, String> ret = {};
    iter(k, v) {
      ret[k] = v.toString();
    }

    params.forEach(iter);
    return ret;
  }

  BaseRequest add<T>(String k, T v) {
    params[k] = v;
    return this;
  }

  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}
