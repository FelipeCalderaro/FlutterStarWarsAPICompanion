import 'package:flutter/material.dart';
import 'package:starwars_companion/ui/values/colors.dart';
import 'package:starwars_companion/ui/values/strings.dart';
import 'package:starwars_companion/ui/values/values.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: primaryColor,
      child: Container(
        height: 400,
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              APP_NAME,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey[700],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                ICONS_BY.length,
                (index) => Text(
                  ICONS_BY[index],
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                GIF_BY.length,
                (index) => Text(
                  GIF_BY[index],
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            //
            Text("Baby Yoda by Aleksandr_Ageev (dribbble.com)"),
            Text("Created by J. Felipe Calderaro"),
            Text("Powered by SWAPI, akabab"),
          ],
        ),
      ),
    );
  }
}
