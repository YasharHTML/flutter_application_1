// To parse this JSON data, do
//
//     final monumentResponse = monumentResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MonumentResponse monumentResponseFromJson(String str) => MonumentResponse.fromJson(json.decode(str));

String monumentResponseToJson(MonumentResponse data) => json.encode(data.toJson());

class MonumentResponse {
    MonumentResponse({
        required this.monuments,
    });

    final List<Monument> monuments;

    factory MonumentResponse.fromJson(Map<String, dynamic> json) => MonumentResponse(
        monuments: List<Monument>.from(json["monuments"].map((x) => Monument.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "monuments": List<dynamic>.from(monuments.map((x) => x.toJson())),
    };
}

class MonumentResponsePost {
    MonumentResponsePost({
        required this.monuments,
    });

    final List<dynamic> monuments;
    // deserialize a json list
    factory MonumentResponsePost.fromJson(List<dynamic> json) => MonumentResponsePost(
        monuments: List<MonumentPost>.from(json.map((x) => MonumentPost.fromJson(x))),
    );

    // serialize a list of monuments
    List<dynamic> toJson() => List<dynamic>.from(monuments.map((x) => x.toJson()));
}

class Monument {
    Monument({
        required this.uid,
        required this.name,
        required this.photoUrl,
        required this.description,
        required this.location,
        required this.latlon,
    });

    final int uid;
    final String name;
    final String photoUrl;
    final String description;
    final String location;
    final Latlon latlon;

    factory Monument.fromJson(Map<String, dynamic> json) => Monument(
        uid: json["uid"],
        name: json["name"],
        photoUrl: json["photoUrl"],
        description: json["description"],
        location: json["location"],
        latlon: Latlon.fromJson(json["latlon"]),
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "photoUrl": photoUrl,
        "description": description,
        "location": location,
        "latlon": latlon.toJson(),
    };
}

class MonumentPost {
    MonumentPost({
        required this.uid,
        required this.title,
        required this.correctAnswer,
        required this.answers,
    });

    final int uid;
    final String title;
    final String correctAnswer;
    final List<dynamic> answers;


    factory MonumentPost.fromJson(Map<String, dynamic> json) => MonumentPost(
        uid: json["uid"],
        title: json["title"],
        correctAnswer: json["correctAnswer"]["value"],
        answers: List<String>.from(json["answers"].map((x) => x["value"].toString())),
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "title": title,
        "correctAnswer": correctAnswer,
        "answers": List<dynamic>.from(answers.map((x) => x)),
    };
}

class Latlon {
    Latlon({
        required this.lat,
        required this.lon,
    });

    final double lat;
    final double lon;

    factory Latlon.fromJson(Map<String, dynamic> json) => Latlon(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
    };
}

// class Answer {
//     Answer({
//         required this.uid,
//         required this.value,
//     });
//     late int uid;
//     late String value;

//     factory Answer.fromJson(Map<String, dynamic> json) => Answer(
//         uid: json["uid"],
//         value: json["value"],
//     );
// }