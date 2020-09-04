import 'package:flutter/material.dart';
import 'package:starwars_companion/ui/values/colors.dart';
import 'package:starwars_companion/ui/values/values.dart';

class ImageCard extends StatelessWidget {
  String title;
  String imageUrl;
  Function onTap;

  double height;
  double width;

  ImageCard({
    @required this.title,
    @required this.imageUrl,
    this.onTap,
    this.height = double.infinity,
    this.width = 180,
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
                child: Image.network(
                  imageUrl == null
                      ? "https://flymobi.com.br/images/placeholder-img.jpg"
                      : imageUrl,
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
            Container(
              width: width,
              padding: EdgeInsets.all(DEFAULT_PADDING),
              child: Text(
                title,
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
  }
}
