import 'package:starwars_companion/core/models/all_data.dart';
import 'package:starwars_companion/core/models/film_info.dart';
import 'package:starwars_companion/core/models/people_info.dart';
import 'package:starwars_companion/core/models/people_info_api_picture.dart';
import 'package:starwars_companion/core/models/people_list.dart';
import 'package:starwars_companion/core/models/planet_info.dart';
import 'package:starwars_companion/core/models/search_results.dart';
import 'package:starwars_companion/core/models/starships_info.dart';
import 'package:starwars_companion/core/models/vehicles_info.dart';
import 'package:starwars_companion/core/services/custom_api.dart';
import 'package:starwars_companion/core/view_models/base_view_model.dart';
import 'package:starwars_companion/ui/values/strings.dart';

class MainViewModel extends BaseViewModel {
  static MainViewModel _mainViewModel;

  static MainViewModel instance() {
    if (_mainViewModel == null) {
      _mainViewModel = MainViewModel();
    }
    return _mainViewModel;
  }

  // Constructor
  MainViewModel() {
    getPeopleList();
    getAllData();
  }

  // Models
  CustomAPI api = CustomAPI();

  // Variables
  PeopleList peopleList = PeopleList();
  PeopleInfo peopleInfo = PeopleInfo();
  PlanetInfo planetInfo = PlanetInfo();
  VehiclesInfo vehiclesInfo = VehiclesInfo();
  StarshipsInfo starShipInfo;
  FilmInfo filmInfo = FilmInfo();
  SearchResults searchResults = SearchResults();
  List<AllData> allData = List();

  // SWAPI related Functions
  void getPeopleList() async {
    try {
      var response = await api.getPeopleList();
      if (response is PeopleList) {
        peopleList = response;
        getPeoplePicture();
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  void getPeopleInfo(String url) async {
    peopleInfo = PeopleInfo();
    notifyListeners();
    try {
      var response = await api.getPeopleInfo(url);
      if (response is PeopleInfo) {
        peopleInfo = response;
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  void getPlanetInfo(String url) async {
    planetInfo = PlanetInfo();
    notifyListeners();
    try {
      var response = await api.getPlanetInfo(url);
      if (response is PlanetInfo) {
        planetInfo = response;
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  void getFilmInfo(String url) async {
    filmInfo = FilmInfo();
    notifyListeners();
    try {
      var response = await api.getFilmInfo(url);
      if (response is FilmInfo) {
        filmInfo = response;
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  void getVehicleInfo(String url) async {
    vehiclesInfo = VehiclesInfo();
    notifyListeners();
    try {
      var response = await api.getVehicleInfo(url);
      if (response is VehiclesInfo) {
        vehiclesInfo = response;
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  void getStarshipInfo(String url) async {
    starShipInfo = StarshipsInfo();
    notifyListeners();
    try {
      var response = await api.getStarshipsInfo(url);
      if (response is StarshipsInfo) {
        starShipInfo = response;
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  // akabab related functions
  void getPeoplePicture() async {
    try {
      for (var i = 1; i < peopleList.results.length + 1; i++) {
        var response = await api.client.get("$BASE_URL_API2/id/$i.json");
        if (response.statusCode == 200) {
          peopleList.results[i - 1].imageUrl =
              PeopleInfoApiPicture.fromRawJson(response.body).image;
        }
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  void getAllData() async {
    try {
      var response = await api.getAllData();
      if (response is List<AllData>) {
        response.removeRange(response.length - 5, response.length);
        allData = response;
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  void getSearchResults(String query) async {
    searchResults = SearchResults();
    notifyListeners();
    try {
      var response = await api.getSearchResults(query);
      if (response is SearchResults) {
        searchResults = response;
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  String getImageUrlForCharacter(String characterName) {
    for (var character in allData) {
      if (characterName == character.name) {
        return character.image;
      }
    }
    return '';
  }
}
