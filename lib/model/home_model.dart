import 'dart:convert';

List<HomePostUiData> homePostUiDataFromJson(String str) => List<HomePostUiData>.from(json.decode(str).map((x) => HomePostUiData.fromMap(x)));

String homePostUiDataToJson(List<HomePostUiData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomePostUiData {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  HomePostUiData({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory HomePostUiData.fromMap(Map<String, dynamic> json) => HomePostUiData(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
