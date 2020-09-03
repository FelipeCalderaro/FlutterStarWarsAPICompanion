// To parse this JSON data, do
//
//     final peopleInfoApiPicture = peopleInfoApiPictureFromJson(jsonString);

import 'dart:convert';

class PeopleInfoApiPicture {
  PeopleInfoApiPicture({
    this.image,
  });

  String image;

  factory PeopleInfoApiPicture.fromRawJson(String str) =>
      PeopleInfoApiPicture.fromJson(json.decode(str));

  factory PeopleInfoApiPicture.fromJson(Map<String, dynamic> json) =>
      PeopleInfoApiPicture(
        image: json["image"],
      );
}
