import 'package:starwars_companion/core/models/people_info.dart';
import 'package:starwars_companion/core/models/people_info_api_picture.dart';
import 'package:starwars_companion/core/models/people_list.dart';
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
  }

  // Models
  CustomAPI api = CustomAPI();

  // Variables
  PeopleList peopleList = PeopleList();
  PeopleInfo peopleInfo = PeopleInfo();

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
}
