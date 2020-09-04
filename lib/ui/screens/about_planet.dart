import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_companion/core/view_models/main_view_model.dart';
import 'package:starwars_companion/ui/values/colors.dart';
import 'package:starwars_companion/ui/values/values.dart';
import 'package:starwars_companion/ui/widgets/film_image_card.dart';
import 'package:starwars_companion/ui/widgets/image_card.dart';

class AboutPlanetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Planet'),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/planets/planetEarth.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor.withOpacity(0.6),
                  primaryColor,
                ],
              ),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            padding: EdgeInsets.all(DEFAULT_PADDING),
            child: mainViewModel.planetInfo.name == null
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        secondaryColor,
                      ),
                    ),
                  )
                : ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Text(
                        mainViewModel.planetInfo.name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      ListTile(
                        title: Text(
                          'Rotation period',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.planetInfo.rotationPeriod,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Orbital period',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.planetInfo.orbitalPeriod,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Diameter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.planetInfo.diameter,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Climate',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.planetInfo.climate,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Gravity',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.planetInfo.gravity,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Surface water',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.planetInfo.surfaceWater,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Population',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.planetInfo.population,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Residents',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Container(
                          height: 200,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              mainViewModel.residentsData.length,
                              (index) => ImageCard(
                                width: 115,
                                title: mainViewModel.residentsData[index].name,
                                imageUrl:
                                    mainViewModel.residentsData[index].image,
                              ),
                            ),
                          ),
                        ),
                      ),
                      mainViewModel.planetInfo.films.isNotEmpty
                          ? ListTile(
                              title: Text(
                                'Films',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Container(
                                height: 200,
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(
                                      mainViewModel.planetInfo.films.length,
                                      (index) => FilmImageCard(
                                            width: 115,
                                            assetUrl:
                                                "assets/images/films/${mainViewModel.planetInfo.films[index].split('/')[5]}.jpg",
                                            onTap: () {},
                                          )),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
