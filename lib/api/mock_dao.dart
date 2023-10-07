import "../dao/auth_dao/mock_request.dart";
import "../util/net/mock_adapter.dart";
import "../util/net/net_adapter.dart";

class MockDao {
  static Future<NetResponse<Map<String, dynamic>>> mockGetData() async {
    var request = MockRequest();
    var res = await MockGetList().send<Map<String, dynamic>>(request);
    return res;
  }
}
