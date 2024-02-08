// To parse this JSON data, do
//
//     final plant = plantFromJson(jsonString);

import 'dart:convert';

List<Plant> plantFromJson(String str) => List<Plant>.from(json.decode(str).map((x) => Plant.fromJson(x)));

String plantToJson(List<Plant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plant {
  String name;
  String phone;
  String address;
  String symptom;
  String status;

  Plant({
    required this.name,
    required this.phone,
    required this.address,
    required this.symptom,
    required this.status,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    symptom: json["symptom"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "address": address,
    "symptom": symptom,
    "status": status,
  };
}
