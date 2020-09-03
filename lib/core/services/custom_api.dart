/*
* Operações de integração com WS (API)
*/

import 'dart:convert';

import 'package:starwars_companion/core/models/people_info.dart';
import 'package:starwars_companion/core/models/people_list.dart';
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
}
