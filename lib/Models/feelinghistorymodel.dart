// To parse this JSON data, do
//
//     final feelingHistoryModel = feelingHistoryModelFromJson(jsonString);

import 'dart:convert';

FeelingHistoryModel feelingHistoryModelFromJson(String str) =>
    FeelingHistoryModel.fromJson(json.decode(str));

class FeelingHistoryModel {
  FeelingHistoryModel({
    this.status,
    this.data,
  });

  String? status;
  Data? data;

  factory FeelingHistoryModel.fromJson(Map<String, dynamic> json) =>
      FeelingHistoryModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.feelingPercentage,
    this.feelingList,
    this.videoArr,
  });

  FeelingPercentage? feelingPercentage;
  List<FeelingList>? feelingList;
  List<VideoArr>? videoArr;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        feelingPercentage: json["feeling_percentage"] == null
            ? null
            : FeelingPercentage.fromJson(json["feeling_percentage"]),
        feelingList: json["feeling_list"] == null
            ? null
            : List<FeelingList>.from(
                json["feeling_list"].map((x) => FeelingList.fromJson(x))),
        videoArr: json["video_arr"] == null
            ? null
            : List<VideoArr>.from(
                json["video_arr"].map((x) => VideoArr.fromJson(x))),
      );
}

class FeelingList {
  FeelingList({
    this.userFeelingId,
    this.feelingId,
    this.feelingName,
    this.submitTime,
  });

  String? userFeelingId;
  String? feelingId;
  String? feelingName;
  DateTime? submitTime;

  factory FeelingList.fromJson(Map<String, dynamic> json) => FeelingList(
        userFeelingId:
            json["user_feeling_id"] == null ? null : json["user_feeling_id"],
        feelingId: json["feeling_id"] == null ? null : json["feeling_id"],
        feelingName: json["feeling_name"] == null ? null : json["feeling_name"],
        submitTime: json["submit_time"] == null
            ? null
            : DateTime.parse(json["submit_time"]),
      );
}

class FeelingPercentage {
  FeelingPercentage({
    this.happy,
    this.sad,
    this.energetic,
    this.calm,
    this.angry,
    this.bored,
  });

  String? happy;
  String? sad;
  String? energetic;
  String? calm;
  String? angry;
  String? bored;

  factory FeelingPercentage.fromJson(Map<String, dynamic> json) =>
      FeelingPercentage(
        happy: json["Happy"] == null ? null : json["Happy"],
        sad: json["Sad"] == null ? null : json["Sad"],
        energetic: json["Energetic"] == null ? null : json["Energetic"],
        calm: json["Calm"] == null ? null : json["Calm"],
        angry: json["Angry"] == null ? null : json["Angry"],
        bored: json["Bored"] == null ? null : json["Bored"],
      );

  Map<String, dynamic> toJson() => {
        "Happy": happy == null ? null : happy,
        "Sad": sad == null ? null : sad,
        "Energetic": energetic == null ? null : energetic,
        "Calm": calm == null ? null : calm,
        "Angry": angry == null ? null : angry,
        "Bored": bored == null ? null : bored,
      };
}

class VideoArr {
  VideoArr({
    this.title,
    this.description,
    this.youtubeUrl,
  });

  String? title;
  String? description;
  String? youtubeUrl;

  factory VideoArr.fromJson(Map<String, dynamic> json) => VideoArr(
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        youtubeUrl: json["youtube_url"] == null ? null : json["youtube_url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "youtube_url": youtubeUrl == null ? null : youtubeUrl,
      };
}
