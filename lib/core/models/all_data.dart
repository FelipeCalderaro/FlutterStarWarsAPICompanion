// To parse this JSON data, do
//
//     final allData = allDataFromJson(jsonString);

import 'dart:convert';

List<AllData> allDataFromJson(String str) =>
    List<AllData>.from(json.decode(str).map((x) => AllData.fromJson(x)));

String allDataToJson(List<AllData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllData {
  AllData({
    this.id,
    this.name,
    this.height,
    this.mass,
    this.gender,
    this.homeworld,
    this.wiki,
    this.image,
    this.born,
    this.bornLocation,
    this.died,
    this.diedLocation,
    this.species,
    this.hairColor,
    this.eyeColor,
    this.skinColor,
    this.cybernetics,
    this.affiliations,
    this.masters,
    this.apprentices,
    this.formerAffiliations,
    this.dateCreated,
    this.dateDestroyed,
    this.destroyedLocation,
    this.creator,
    this.manufacturer,
    this.model,
    this.allDatumClass,
    this.sensorColor,
    this.platingColor,
    this.equipment,
    this.productLine,
    this.kajidic,
    this.era,
    this.degree,
    this.armament,
  });

  int id;
  String name;
  double height;
  double mass;
  Gender gender;
  dynamic homeworld;
  String wiki;
  String image;
  dynamic born;
  String bornLocation;
  int died;
  String diedLocation;
  String species;
  String hairColor;
  String eyeColor;
  String skinColor;
  dynamic cybernetics;
  List<String> affiliations;
  dynamic masters;
  dynamic apprentices;
  List<String> formerAffiliations;
  int dateCreated;
  int dateDestroyed;
  String destroyedLocation;
  String creator;
  String manufacturer;
  String model;
  String allDatumClass;
  String sensorColor;
  String platingColor;
  dynamic equipment;
  String productLine;
  String kajidic;
  dynamic era;
  String degree;
  dynamic armament;

  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
        id: json["id"],
        name: json["name"],
        height: json["height"] == null ? null : json["height"].toDouble(),
        mass: json["mass"] == null ? null : json["mass"].toDouble(),
        gender: genderValues.map[json["gender"]],
        homeworld: json["homeworld"],
        wiki: json["wiki"],
        image: json["image"],
        born: json["born"],
        bornLocation:
            json["bornLocation"] == null ? null : json["bornLocation"],
        died: json["died"] == null ? null : json["died"],
        diedLocation:
            json["diedLocation"] == null ? null : json["diedLocation"],
        species: json["species"],
        hairColor: json["hairColor"] == null ? null : json["hairColor"],
        eyeColor: json["eyeColor"],
        skinColor: json["skinColor"] == null ? null : json["skinColor"],
        cybernetics: json["cybernetics"],
        affiliations: List<String>.from(json["affiliations"].map((x) => x)),
        masters: json["masters"],
        apprentices: json["apprentices"],
        formerAffiliations:
            List<String>.from(json["formerAffiliations"].map((x) => x)),
        dateCreated: json["dateCreated"] == null ? null : json["dateCreated"],
        dateDestroyed:
            json["dateDestroyed"] == null ? null : json["dateDestroyed"],
        destroyedLocation: json["destroyedLocation"] == null
            ? null
            : json["destroyedLocation"],
        creator: json["creator"] == null ? null : json["creator"],
        manufacturer:
            json["manufacturer"] == null ? null : json["manufacturer"],
        model: json["model"] == null ? null : json["model"],
        allDatumClass: json["class"] == null ? null : json["class"],
        sensorColor: json["sensorColor"] == null ? null : json["sensorColor"],
        platingColor:
            json["platingColor"] == null ? null : json["platingColor"],
        equipment: json["equipment"],
        productLine: json["productLine"] == null ? null : json["productLine"],
        kajidic: json["kajidic"] == null ? null : json["kajidic"],
        era: json["era"],
        degree: json["degree"] == null ? null : json["degree"],
        armament: json["armament"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "height": height == null ? null : height,
        "mass": mass == null ? null : mass,
        "gender": genderValues.reverse[gender],
        "homeworld": homeworld,
        "wiki": wiki,
        "image": image,
        "born": born,
        "bornLocation": bornLocation == null ? null : bornLocation,
        "died": died == null ? null : died,
        "diedLocation": diedLocation == null ? null : diedLocation,
        "species": species,
        "hairColor": hairColor == null ? null : hairColor,
        "eyeColor": eyeColor,
        "skinColor": skinColor == null ? null : skinColor,
        "cybernetics": cybernetics,
        "affiliations": List<dynamic>.from(affiliations.map((x) => x)),
        "masters": masters,
        "apprentices": apprentices,
        "formerAffiliations":
            List<dynamic>.from(formerAffiliations.map((x) => x)),
        "dateCreated": dateCreated == null ? null : dateCreated,
        "dateDestroyed": dateDestroyed == null ? null : dateDestroyed,
        "destroyedLocation":
            destroyedLocation == null ? null : destroyedLocation,
        "creator": creator == null ? null : creator,
        "manufacturer": manufacturer == null ? null : manufacturer,
        "model": model == null ? null : model,
        "class": allDatumClass == null ? null : allDatumClass,
        "sensorColor": sensorColor == null ? null : sensorColor,
        "platingColor": platingColor == null ? null : platingColor,
        "equipment": equipment,
        "productLine": productLine == null ? null : productLine,
        "kajidic": kajidic == null ? null : kajidic,
        "era": era,
        "degree": degree == null ? null : degree,
        "armament": armament,
      };
}

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

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
