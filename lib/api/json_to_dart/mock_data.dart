import "dart:convert";

MockData mockDataFromJson(String str) => MockData.fromJson(json.decode(str));

String mockDataToJson(MockData data) => json.encode(data.toJson());

class MockData {
  List<ListElement> list;

  MockData({
    required this.list,
  });
  static MockData init() {
    return MockData(list: []);
  }

  factory MockData.fromJson(Map<String, dynamic> json) => MockData(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  String id;
  String imgSrc;
  String title;
  String subTitle;

  ListElement({
    required this.id,
    required this.imgSrc,
    required this.title,
    required this.subTitle,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        imgSrc: json["imgSrc"],
        title: json["title"],
        subTitle: json["subTitle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imgSrc": imgSrc,
        "title": title,
        "subTitle": subTitle,
      };
}
