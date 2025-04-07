// To parse this JSON data, do
//
//     final travelModel = travelModelFromJson(jsonString);

import 'dart:convert';

TravelModel travelModelFromJson(String str) => TravelModel.fromJson(json.decode(str));

String travelModelToJson(TravelModel data) => json.encode(data.toJson());

class TravelModel {
    List<Datum> data;

    TravelModel({
        required this.data,
    });

    factory TravelModel.fromJson(Map<String, dynamic> json) => TravelModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String title;
    String image;
    String description;
    int quantity;
    bool isFav;
    String rating;
    String place;

    Datum({
        required this.title,
        required this.image,
        required this.description,
        required this.quantity,
        required this.isFav,
        required this.rating,
        required this.place,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        image: json["image"],
        description: json["description"],
        quantity: json["quantity"],
        isFav: json["isFav"],
        rating: json["rating"],
        place: json["place"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "description": description,
        "quantity": quantity,
        "isFav": isFav,
        "rating": rating,
        "place": place,
    };
}
