import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_companion/core/view_models/main_view_model.dart';
import 'package:starwars_companion/ui/screens/about_character.dart';
import 'package:starwars_companion/ui/screens/about_film.dart';
import 'package:starwars_companion/ui/screens/search_screen.dart';
import 'package:starwars_companion/ui/values/colors.dart';
import 'package:starwars_companion/ui/values/strings.dart';
import 'package:starwars_companion/ui/values/values.dart';
import 'package:starwars_companion/ui/widgets/custom_dialog.dart';
import 'package:starwars_companion/ui/widgets/film_image_card.dart';
import 'package:starwars_companion/ui/widgets/image_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => CustomDialog(),
            );
          },
        ),
        title: Text("SWAPI Companion"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchScreen(),
              );
            },
          )
        ],
      ),
      body: mainViewModel.peopleList.results != null
          ? ListView(
              padding: EdgeInsets.all(DEFAULT_PADDING),
              children: [
                Text(
                  "Some Characters",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mainViewModel.peopleList.results.length,
                    itemBuilder: (context, index) {
                      return Hero(
                        tag:
                            'character_${mainViewModel.peopleList.results[index].name}',
                        child: ImageCard(
                          title: mainViewModel.peopleList.results[index].name,
                          imageUrl:
                              mainViewModel.peopleList.results[index].imageUrl,
                          onTap: () {
                            mainViewModel.getPeopleInfo(
                                mainViewModel.peopleList.results[index].url);
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => AboutCharacter(
                                  title: mainViewModel
                                      .peopleList.results[index].name,
                                  imageUrl: mainViewModel
                                      .peopleList.results[index].imageUrl,
                                  heroTag:
                                      'character_${mainViewModel.peopleList.results[index].name}',
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 3.0,
                ),
                Text(
                  "Last Films",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 9 / 14,
                  children: List.generate(
                    6,
                    (index) => Hero(
                      tag: 'Film_${6 - index}',
                      child: FilmImageCard(
                        assetUrl: 'assets/images/films/${6 - index}.jpg',
                        onTap: () {
                          mainViewModel
                              .getFilmInfo('$BASE_URL/films/${6 - index}/');
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AboutFilmScreen(
                                heroTag: 'Film_${6 - index}',
                                assetUrl:
                                    'assets/images/films/${6 - index}.jpg',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).primaryColor),
              ),
            ),
    );
  }
}
