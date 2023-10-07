import "../../dao/base_request.dart";
import "net_adapter.dart";

class MockAdapter extends NetAdapter {
  @override
  Future<NetResponse<T>> send<T>(BaseRequest request) {
    return Future<NetResponse<T>>.delayed(const Duration(milliseconds: 1000),
        () {
      return NetResponse(
        request: request,
        data: {
          "uid": "1",
          "name": "Moody",
          "login_pwd": false,
          "mobile": "110120119",
          "sex": 1,
          "birthday": 1691744257,
          "height": 210,
          "weight": 180.2,
          "nature_of_work": 1,
          "types_of_diabetes": 5,
          "daily_kcal_intake_target": 1000,
          "daily_carb_intake_target": 2000,
        } as T,
        statusCode: 200,
      );
    });
  }
}

class MockGetList extends NetAdapter {
  @override
  Future<NetResponse<T>> send<T>(BaseRequest request) {
    return Future<NetResponse<T>>.delayed(const Duration(milliseconds: 1000),
        () {
      return NetResponse(
        request: request,
        data: {
          "list": [
            {
              "id": "1",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "啊实打实的",
              "subTitle": "33"
            },
            {
              "id": "2",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "科技",
              "subTitle": "4334"
            },
            {
              "id": "3",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "231",
              "subTitle": "44"
            },
            {
              "id": "412",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "sdasdashk ",
              "subTitle": "3444"
            },
            {
              "id": "323",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "sdasdaks",
              "subTitle": "44"
            },
            {
              "id": "2322",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "d啊啥的就啊是",
              "subTitle": "rr"
            },
            {
              "id": "32",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "啊啥的卡上的撒",
              "subTitle": "ww"
            },
            {
              "id": "23",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "发送到家",
              "subTitle": ""
            },
            {
              "id": "t0",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "卡就是的家jhhhhh",
              "subTitle": "fl"
            },
            {
              "id": "59",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "ldjas ",
              "subTitle": "kl"
            },
            {
              "id": "548",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "dad",
              "subTitle": "ll"
            },
            {
              "id": "49",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "dav",
              "subTitle": "liie"
            },
            {
              "id": "402",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "bvac",
              "subTitle": "ooh"
            },
            {
              "id": "390",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "oooo",
              "subTitle": "oho"
            },
            {
              "id": "33",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "aaaa",
              "subTitle": "dasdi"
            },
            {
              "id": "321",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "aaa",
              "subTitle": "oihs"
            },
            {
              "id": "39009",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "哦几哦",
              "subTitle": "soih"
            },
            {
              "id": "441",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "pp",
              "subTitle": "oh"
            },
            {
              "id": "30",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": " das",
              "subTitle": "souhy"
            },
            {
              "id": "3978",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "22",
              "subTitle": "oho"
            },
            {
              "id": "399",
              "imgSrc": "https://book.flutterchina.club/assets/img/logo.png",
              "title": "l;lll",
              "subTitle": "sohd"
            }
          ],
        } as T,
        statusCode: 200,
      );
    });
  }
}
