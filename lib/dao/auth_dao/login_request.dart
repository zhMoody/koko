import "../../util/dot_env.dart";
import "../base_request.dart";

class LoginRequest extends BaseRequest {
  @override
  bool get isHttps => false;

  @override
  bool hasAuth() => false;

  @override
  Method method() => Method.post;

  @override
  String path() {
    return "${apis.get("pwdlogin")}";
  }
}

class MobileLoginRequest extends BaseRequest {
  @override
  bool get isHttps => false;

  @override
  bool hasAuth() => false;

  @override
  Method method() => Method.post;

  @override
  String path() {
    return "${apis.get("mobileLogin")}";
  }
}
