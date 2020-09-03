// To parse this JSON data, do
//
//     final planetInfo = planetInfoFromJson(jsonString);

import 'dart:convert';

class PlanetInfo {
  PlanetInfo({
    this.name,
    this.rotationPeriod,
    this.orbitalPeriod,
    this.diameter,
    this.climate,
    this.gravity,
    this.terrain,
    this.surfaceWater,
    this.population,
    this.residents,
    this.films,
    this.created,
    this.edited,
    this.url,
  });

  String name;
  String rotationPeriod;
  String orbitalPeriod;
  String diameter;
  String climate;
  String gravity;
  String terrain;
  String surfaceWater;
  String population;
  List<String> residents;
  List<String> films;
  DateTime created;
  DateTime edited;
  String url;

  factory PlanetInfo.fromRawJson(String str) =>
      PlanetInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanetInfo.fromJson(Map<String, dynamic> json) => PlanetInfo(
        name: json["name"],
        rotationPeriod: json["rotation_period"],
        orbitalPeriod: json["orbital_period"],
        diameter: json["diameter"],
        climate: json["climate"],
        gravity: json["gravity"],
        terrain: json["terrain"],
        surfaceWater: json["surface_water"],
        population: json["population"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rotation_period": rotationPeriod,
        "orbital_period": orbitalPeriod,
        "diameter": diameter,
        "climate": climate,
        "gravity": gravity,
        "terrain": terrain,
        "surface_water": surfaceWater,
        "population": population,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "films": List<dynamic>.from(films.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}
