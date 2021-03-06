import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_companion/core/view_models/main_view_model.dart';
import 'package:starwars_companion/ui/screens/about_character.dart';
import 'package:starwars_companion/ui/screens/about_film.dart';
import 'package:starwars_companion/ui/values/colors.dart';
import 'package:starwars_companion/ui/values/strings.dart';
import 'package:starwars_companion/ui/values/values.dart';
import 'package:starwars_companion/ui/widgets/film_image_card.dart';
import 'package:starwars_companion/ui/widgets/image_card.dart';

class AboutStarshipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Starship'),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/GIFs/star-destroyer.gif',
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
            child: mainViewModel.starShipInfo.name == null
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
                        mainViewModel.starShipInfo.name,
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
                          'Model',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.starShipInfo.model,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Manufacturer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.starShipInfo.manufacturer,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Cost in credits',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.starShipInfo.costInCredits,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Lenght',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.starShipInfo.length,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Max Atmosphering Speed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.starShipInfo.maxAtmospheringSpeed,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Crew',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.starShipInfo.crew,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Passengers',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.starShipInfo.passengers,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Cargo Capacity',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.starShipInfo.cargoCapacity,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Consumables',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.starShipInfo.consumables,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Hyperdrive Rating',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mainViewModel.starShipInfo.hyperdriveRating,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Pilots',
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
                              mainViewModel.pilotsData.length,
                              (index) => ImageCard(
                                width: 115,
                                title: mainViewModel.pilotsData[index].name,
                                imageUrl: mainViewModel.pilotsData[index].image,
                                onTap: () {
                                  mainViewModel.getPeopleInfo(
                                      "$BASE_URL/people/${mainViewModel.pilotsData[index].id}");
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => AboutCharacter(
                                        title: mainViewModel
                                            .pilotsData[index].name,
                                        heroTag: '',
                                        imageUrl: mainViewModel
                                            .pilotsData[index].image,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
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
                                mainViewModel.starShipInfo.films.length,
                                (index) => FilmImageCard(
                                      width: 115,
                                      assetUrl:
                                          "assets/images/films/${mainViewModel.starShipInfo.films[index].split('/')[5]}.jpg",
                                      onTap: () {
                                        mainViewModel.getFilmInfo(mainViewModel
                                            .planetInfo.films[index]);

                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                AboutFilmScreen(
                                              heroTag: '',
                                              assetUrl:
                                                  "assets/images/films/${mainViewModel.planetInfo.films[index].split('/')[5]}.jpg",
                                            ),
                                          ),
                                        );
                                      },
                                    )),
                          ),
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
