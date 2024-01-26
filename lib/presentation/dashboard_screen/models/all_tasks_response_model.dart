// To parse this JSON data, do
//
//     final allTasksResponseModel = allTasksResponseModelFromJson(jsonString);

import 'dart:convert';

AllTasksResponseModel allTasksResponseModelFromJson(String str) =>
    AllTasksResponseModel.fromJson(json.decode(str));

String allTasksResponseModelToJson(AllTasksResponseModel data) =>
    json.encode(data.toJson());

class AllTasksResponseModel {
  int? count;
  List<Datum>? data;

  AllTasksResponseModel({
    this.count,
    this.data,
  });

  factory AllTasksResponseModel.fromJson(Map<String, dynamic> json) =>
      AllTasksResponseModel(
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  bool? completed;
  String? id;
  String? title;
  String? description;
  DateTime? dueDate;
  String? owner;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.completed,
    this.id,
    this.title,
    this.description,
    this.dueDate,
    this.owner,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        completed: json["completed"],
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        dueDate: DateTime.parse(json["dueDate"]),
        owner: json["owner"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "completed": completed,
        "_id": id,
        "title": title,
        "description": description,
        "dueDate": dueDate!.toIso8601String(),
        "owner": owner,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
