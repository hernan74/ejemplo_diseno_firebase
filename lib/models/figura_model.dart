import 'dart:convert';

FiguraModel figuraModelFromJson(String str) =>
    FiguraModel.fromJson(json.decode(str));

String figuraModelToJson(FiguraModel data) => json.encode(data.toJson());

class FiguraModel {
  FiguraModel(
      {required this.id,
      required this.idFirebase,
      required this.forma,
      required this.rgb});

  String id;
  String idFirebase;
  String forma;
  String rgb;

  factory FiguraModel.fromJson(Map<String, dynamic> json) => FiguraModel(
        id: json["id"],
        idFirebase: json["idFirebase"],
        forma: json["forma"],
        rgb: json["rgb"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idFirebase": idFirebase,
        "forma": forma,
        "rgb": rgb,
      };
}
