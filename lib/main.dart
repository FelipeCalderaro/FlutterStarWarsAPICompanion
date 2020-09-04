import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_companion/core/view_models/main_view_model.dart';
import 'package:starwars_companion/ui/screens/home.dart';
import 'package:starwars_companion/ui/screens/splash_screen.dart';
import 'package:starwars_companion/ui/values/colors.dart';
import 'package:starwars_companion/ui/values/routes.dart' as Routes;
import 'package:starwars_companion/ui/values/strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainViewModel>(
          create: (_) => MainViewModel.instance(),
        ),
      ],
      child: MaterialApp(
        title: APP_NAME,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: secondaryColor,
            scaffoldBackgroundColor: primaryColor,
            textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
            )),
        home: SplashScreen(),
      ),
    );
  }
}
