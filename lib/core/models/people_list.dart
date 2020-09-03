// To parse this JSON data, do
//
//     final peopleList = peopleListFromJson(jsonString);

import 'dart:convert';

PeopleList peopleListFromJson(String str) =>
    PeopleList.fromJson(json.decode(str));

String peopleListToJson(PeopleList data) => json.encode(data.toJson());

class PeopleList {
  PeopleList({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<Result> results;

  factory PeopleList.fromJson(Map<String, dynamic> json) => PeopleList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
    this.created,
    this.edited,
    this.url,
    this.imageUrl,
  });

  String name;
  String height;
  String mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  Gender gender;
  String homeworld;
  List<String> films;
  List<String> species;
  List<String> vehicles;
  List<String> starships;
  DateTime created;
  DateTime edited;
  String url;
  String imageUrl;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: genderValues.map[json["gender"]],
        homeworld: json["homeworld"],
        films: List<String>.from(json["films"].map((x) => x)),
        species: List<String>.from(json["species"].map((x) => x)),
        vehicles: List<String>.from(json["vehicles"].map((x) => x)),
        starships: List<String>.from(json["starships"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "height": height,
        "mass": mass,
        "hair_color": hairColor,
        "skin_color": skinColor,
        "eye_color": eyeColor,
        "birth_year": birthYear,
        "gender": genderValues.reverse[gender],
        "homeworld": homeworld,
        "films": List<dynamic>.from(films.map((x) => x)),
        "species": List<dynamic>.from(species.map((x) => x)),
        "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
        "starships": List<dynamic>.from(starships.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}

enum Gender { MALE, N_A, FEMALE }

final genderValues = EnumValues(
    {"female": Gender.FEMALE, "male": Gender.MALE, "n/a": Gender.N_A});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
