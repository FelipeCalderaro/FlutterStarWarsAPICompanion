import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:starwars_companion/core/view_models/main_view_model.dart';
import 'package:starwars_companion/ui/values/colors.dart';
import 'package:starwars_companion/ui/values/values.dart';
import 'package:starwars_companion/ui/widgets/film_image_card.dart';
import 'package:starwars_companion/ui/widgets/image_card.dart';

class AboutCharacter extends StatefulWidget {
  String title;
  String imageUrl;
  String heroTag;

  AboutCharacter({
    @required this.title,
    @required this.heroTag,
    this.imageUrl,
  });

  @override
  _AboutCharacterState createState() => _AboutCharacterState();
}

class _AboutCharacterState extends State<AboutCharacter> {
  bool showFilms = true;
  bool showVechicles = false;
  bool showStarships = false;

  double fontSize = 16.5;

  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: BackButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Container(
            height: 250,
            child: Row(
              children: [
                Hero(
                  tag: widget.heroTag,
                  child: ImageCard(
                    title: '',
                    imageUrl: widget.imageUrl,
                  ),
                ),
                mainViewModel.peopleInfo.name == null
                    ? Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: Column(
                          children: List.generate(
                            7,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: SizedBox(
                                height: 10,
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.grey[800],
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.grey[700]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.43,
                        padding: EdgeInsets.symmetric(
                            horizontal: DEFAULT_PADDING / 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Height: ${double.parse(mainViewModel.peopleInfo.height) / 100} Meters',
                              style: TextStyle(
                                fontSize: fontSize /
                                    MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Weight: ${mainViewModel.peopleInfo.mass} Kg',
                              style: TextStyle(
                                fontSize: fontSize /
                                    MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Hair color: ${mainViewModel.peopleInfo.hairColor}',
                              style: TextStyle(
                                fontSize: fontSize /
                                    MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Skin color: ${mainViewModel.peopleInfo.skinColor}',
                              style: TextStyle(
                                fontSize: fontSize /
                                    MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Eye color: ${mainViewModel.peopleInfo.eyeColor}',
                              style: TextStyle(
                                fontSize: fontSize /
                                    MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Birth year: ${mainViewModel.peopleInfo.birthYear}',
                              style: TextStyle(
                                fontSize: fontSize /
                                    MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Gender: ${mainViewModel.peopleInfo.gender}',
                              style: TextStyle(
                                fontSize: fontSize /
                                    MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              color: secondaryColor,
                              onPressed: () {},
                              child: Text(
                                "Homeworld",
                                style: TextStyle(
                                  fontSize: 15 /
                                      MediaQuery.of(context).textScaleFactor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
              ],
            ),
          ),
          Divider(
            color: secondaryColor,
            thickness: 3.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING / 2),
            child: Text(
              "Films",
              style: TextStyle(
                fontSize: 22 / MediaQuery.of(context).textScaleFactor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          mainViewModel.peopleInfo.films != null
              ? GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 14,
                  children: List.generate(
                    mainViewModel.peopleInfo.films.length,
                    (index) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FilmImageCard(
                        assetUrl:
                            "assets/images/films/${mainViewModel.peopleInfo.films[index].split('/')[5]}.jpg",
                        onTap: () {},
                      ),
                    ),
                  ),
                )
              : GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 14,
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey[800],
                          valueColor: AlwaysStoppedAnimation(Colors.grey[700]),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
