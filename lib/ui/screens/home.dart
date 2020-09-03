import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_companion/core/view_models/main_view_model.dart';
import 'package:starwars_companion/ui/screens/about_character.dart';
import 'package:starwars_companion/ui/screens/search_screen.dart';
import 'package:starwars_companion/ui/values/values.dart';
import 'package:starwars_companion/ui/widgets/image_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: AppBar(
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
                  "Main Characters",
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
                        tag: 'character_$index',
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
                                  heroTag: 'character_$index',
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
                Text("Last Films"),
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
