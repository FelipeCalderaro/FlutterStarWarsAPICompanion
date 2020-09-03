/*
* Operações de integração com WS (API)
*/

import 'dart:convert';

import 'package:starwars_companion/core/models/all_data.dart';
import 'package:starwars_companion/core/models/film_info.dart';
import 'package:starwars_companion/core/models/people_info.dart';
import 'package:starwars_companion/core/models/people_list.dart';
import 'package:starwars_companion/core/models/planet_info.dart';
import 'package:starwars_companion/core/models/search_results.dart';
import 'package:starwars_companion/core/services/api.dart';
import 'package:starwars_companion/ui/values/strings.dart';

class CustomAPI extends API {
  static CustomAPI _api;

  CustomAPI();

  static CustomAPI instance() {
    if (_api == null) {
      _api = CustomAPI();
    }

    return _api;
  }

  Future<dynamic> getPeopleList() async {
    try {
      var response = await client.get('$BASE_URL/people');
      if (response.statusCode == 200) {
        return peopleListFromJson(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> getPeopleInfo(String url) async {
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        return PeopleInfo.fromRawJson(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> getPlanetInfo(String url) async {
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        return PlanetInfo.fromRawJson(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> getFilmInfo(String url) async {
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        return FilmInfo.fromRawJson(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> getSearchResults(String query) async {
    try {
      var response = await client.get('$BASE_URL/people?search=$query');
      if (response.statusCode == 200) {
        return SearchResults.fromRawJson(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> getAllData() async {
    try {
      var response = await client.get('$BASE_URL_API2/all.json');
      if (response.statusCode == 200) {
        return allDataFromJson(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      throw e;
    }
  }
}
