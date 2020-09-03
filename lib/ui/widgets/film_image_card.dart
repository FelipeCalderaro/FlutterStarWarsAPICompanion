import 'package:flutter/material.dart';
import 'package:starwars_companion/ui/values/colors.dart';
import 'package:starwars_companion/ui/values/values.dart';

class FilmImageCard extends StatelessWidget {
  String assetUrl;
  Function onTap;

  double height = double.infinity;
  double width = 180;

  FilmImageCard({
    @required this.assetUrl,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? onTap : () {},
      child: Card(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: width,
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  assetUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black12,
                    Colors.black,
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(DEFAULT_PADDING),
              child: Text(
                '',
                style: TextStyle(
                  fontSize: 17 / MediaQuery.of(context).textScaleFactor,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
