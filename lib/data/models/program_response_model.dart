import 'dart:convert';

import 'data_model.dart';

ProgramResponseModel responseFromJson(String str) =>
    ProgramResponseModel.fromJson(json.decode(str));

String responseToJson(ProgramResponseModel data) =>
    json.encode(data.toJson());

class ProgramResponseModel {
  final bool success;
  final String message;
  final Data data;

  ProgramResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProgramResponseModel.fromJson(Map<String, dynamic> json) =>
      ProgramResponseModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}
