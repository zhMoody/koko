import "../../util/dot_env.dart";
import "../base_request.dart";

class MockRequest extends BaseRequest {
  @override
  bool get isHttps => false;

  @override
  bool hasAuth() => false;

  @override
  Method method() => Method.post;

  @override
  String path() {
    return "${apis.get("mock")}";
  }
}
