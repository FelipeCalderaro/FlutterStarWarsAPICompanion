import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_companion/core/models/all_data.dart';
import 'package:starwars_companion/core/view_models/main_view_model.dart';
import 'package:starwars_companion/ui/screens/about_character.dart';
import 'package:starwars_companion/ui/values/colors.dart';
import 'package:starwars_companion/ui/values/strings.dart';
import 'package:starwars_companion/ui/widgets/image_card.dart';

class SearchScreen extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search character';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      primaryColor: secondaryColor,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () => buildResults(context),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return searchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return searchResults(context);
  }

  Widget searchResults(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    List<AllData> dataList = List();

    // if (query.length > 0) {
    for (var data in mainViewModel.allData) {
      if (data.name.toUpperCase().contains(query.toUpperCase())) {
        dataList.add(data);
      }
    }
    // }

    return dataList.isEmpty && query.length == 0
        ? Center(
            child:
                Text('Type the name of the character that you want to search.'),
          )
        : dataList.isEmpty
            ? Center(
                child: Text("Sorry, can't find any results about $query"),
              )
            : GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 9 / 12,
                children: List.generate(
                  dataList.length,
                  (index) => Hero(
                    tag: 'search_$index',
                    child: ImageCard(
                      imageUrl: dataList[index].image,
                      title: dataList[index].name,
                      onTap: () {
                        mainViewModel.getPeopleInfo(
                            '$BASE_URL/people/${dataList[index].id}');
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => AboutCharacter(
                              title: dataList[index].name,
                              imageUrl: dataList[index].image,
                              heroTag: 'search_$index',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
  }
}
