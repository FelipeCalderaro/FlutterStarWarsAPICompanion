import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:starwars_companion/core/view_models/main_view_model.dart';
import 'package:starwars_companion/ui/values/colors.dart';
import 'package:starwars_companion/ui/values/values.dart';
import 'package:starwars_companion/ui/widgets/film_image_card.dart';
import 'package:starwars_companion/ui/widgets/image_card.dart';

class AboutFilmScreen extends StatelessWidget {
  String assetUrl;
  String heroTag;

  AboutFilmScreen({
    @required this.heroTag,
    this.assetUrl,
  });

  bool showFilms = true;
  bool showVechicles = false;
  bool showStarships = false;

  double fontSize = 16.5;

  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Film'),
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
                    tag: heroTag,
                    child: FilmImageCard(
                      assetUrl: assetUrl,
                      onTap: () {},
                    )),
                mainViewModel.filmInfo.title == null
                    ? Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: Column(
                          children: List.generate(
                            7,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: SizedBox(
                                height: index == 0 ? 24 : 10,
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
                        width: MediaQuery.of(context).size.width * 0.58,
                        padding: EdgeInsets.symmetric(
                            horizontal: DEFAULT_PADDING / 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mainViewModel.filmInfo.title,
                              style: TextStyle(
                                fontSize:
                                    24 / MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Episode: ${mainViewModel.filmInfo.episodeId}",
                              style: TextStyle(
                                fontSize: fontSize /
                                    MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Director: ${mainViewModel.filmInfo.director}',
                              style: TextStyle(
                                fontSize: fontSize /
                                    MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Producer: ${mainViewModel.filmInfo.producer}',
                              style: TextStyle(
                                fontSize: fontSize /
                                    MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Release date: ${mainViewModel.filmInfo.releaseDate.month}/${mainViewModel.filmInfo.releaseDate.day}/${mainViewModel.filmInfo.releaseDate.year}',
                              style: TextStyle(
                                fontSize: fontSize /
                                    MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
          mainViewModel.filmInfo.title == null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: DEFAULT_PADDING / 2),
                      child: SizedBox(
                        height: 22,
                        width: 80,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey[800],
                          valueColor: AlwaysStoppedAnimation(Colors.grey[700]),
                        ),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        10,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: SizedBox(
                            height: 16,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey[800],
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.grey[700]),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: DEFAULT_PADDING / 2),
                      child: Text(
                        'Sinopse',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        mainViewModel.filmInfo.openingCrawl
                            .replaceAll('\n', '')
                            .replaceAll('\r', ' '),
                        style: TextStyle(
                          fontSize: 16 / MediaQuery.of(context).textScaleFactor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
