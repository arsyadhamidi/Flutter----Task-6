// To parse this JSON data, do
//
//     final modelVideo = modelVideoFromJson(jsonString);

import 'dart:convert';

List<ModelVideo> modelVideoFromJson(String str) => List<ModelVideo>.from(json.decode(str).map((x) => ModelVideo.fromJson(x)));

String modelVideoToJson(List<ModelVideo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelVideo {
  ModelVideo({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.id,
    this.linkVideo,
    this.gambarVideo,
    this.title,
    this.pemilik,
  });

  String? the0;
  String? the1;
  String? the2;
  String? the3;
  String? the4;
  String? id;
  String? linkVideo;
  String? gambarVideo;
  String? title;
  String? pemilik;

  factory ModelVideo.fromJson(Map<String, dynamic> json) => ModelVideo(
    the0: json["0"],
    the1: json["1"],
    the2: json["2"],
    the3: json["3"],
    the4: json["4"],
    id: json["id"],
    linkVideo: json["link_video"],
    gambarVideo: json["gambar_video"],
    title: json["title"],
    pemilik: json["pemilik"],
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "1": the1,
    "2": the2,
    "3": the3,
    "4": the4,
    "id": id,
    "link_video": linkVideo,
    "gambar_video": gambarVideo,
    "title": title,
    "pemilik": pemilik,
  };
}
