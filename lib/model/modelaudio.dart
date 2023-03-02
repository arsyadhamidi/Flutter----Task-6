// To parse this JSON data, do
//
//     final modelAudio = modelAudioFromJson(jsonString);

import 'dart:convert';

List<ModelAudio> modelAudioFromJson(String str) => List<ModelAudio>.from(json.decode(str).map((x) => ModelAudio.fromJson(x)));

String modelAudioToJson(List<ModelAudio> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelAudio {
  ModelAudio({
    this.the0,
    this.the1,
    this.the2,
    this.id,
    this.linkMusik,
    this.judul,
  });

  String? the0;
  String? the1;
  String? the2;
  String? id;
  String? linkMusik;
  String? judul;

  factory ModelAudio.fromJson(Map<String, dynamic> json) => ModelAudio(
    the0: json["0"],
    the1: json["1"],
    the2: json["2"],
    id: json["id"],
    linkMusik: json["link_musik"],
    judul: json["judul"],
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "1": the1,
    "2": the2,
    "id": id,
    "link_musik": linkMusik,
    "judul": judul,
  };
}
