import "../../dao/auth_dao/login_request.dart";
import "../../util/cache/cache.dart";
import "../../util/net/net.dart";

class LoginDAO {
  static const boardingPass = "xxx";
  static const someKey = "xxx";

  static pwdLogin(String mobile, String pwd) async {
    var request = LoginRequest();
    request.add("mobile", mobile).add("pwd", pwd);
    var res = await Net.shared.fire(request);
    return res;
  }

  static mobilelogin(String mobile, String code) async {
    var request = MobileLoginRequest();
    request.add("mobile", mobile).add("code", code);
    var res = await Net.shared.fire(request);
    return res;
  }

  static T? getBoardingPass<T>() {
    return Cache.shared.get(boardingPass);
  }

  static T? getSomeSth<T>() {
    return Cache.shared.get(someKey);
  }
}
