import 'dart:math';

import 'package:flutter/material.dart';
import 'package:starwars_companion/core/view_models/main_view_model.dart';
import 'package:starwars_companion/ui/screens/home.dart';
import 'package:starwars_companion/ui/values/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _opacityAnimationController1;
  AnimationController _opacityAnimationController2;
  AnimationController _valueController;

  Animation<double> _opacityAnimation1;
  Animation<double> _opacityAnimation2;
  Animation<double> _valueAnimation;

  CurvedAnimation _curvedAnimation1;
  CurvedAnimation _curvedAnimation2;
  CurvedAnimation _curvedValueAnimation;

  double random;

  @override
  void initState() {
    final mainViewModel = MainViewModel.instance();

    _valueController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _curvedValueAnimation = CurvedAnimation(
      parent: _valueController,
      curve: Curves.decelerate,
    );

    _valueAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_curvedValueAnimation);

    _opacityAnimationController1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _opacityAnimationController2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _curvedAnimation1 = CurvedAnimation(
      parent: _opacityAnimationController1,
      curve: Curves.linear,
    );
    _curvedAnimation2 = CurvedAnimation(
      parent: _opacityAnimationController2,
      curve: Curves.linear,
    );

    _opacityAnimation1 =
        Tween<double>(begin: 1, end: 0).animate(_curvedAnimation1);
    _opacityAnimation2 =
        Tween<double>(begin: 1, end: 0).animate(_curvedAnimation2);

    _opacityAnimationController1.repeat(reverse: true);
    _opacityAnimationController2.repeat(reverse: true);
    _valueController.forward();

    random = Random().nextDouble();
    _valueController
        .animateTo(random > 0.6 ? random / 2 : random,
            duration: Duration(milliseconds: 500))
        .then(
          (value) async => await mainViewModel.getPeopleList().then(
            (value) {
              _valueController
                  .animateTo(
                1,
                duration: Duration(seconds: 1),
              )
                  .then(
                (value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              );
            },
          ),
        );

    super.initState();
  }

  @override
  void dispose() {
    _opacityAnimationController1.dispose();
    _opacityAnimationController2.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _opacityAnimationController1.isCompleted
      //         ? _opacityAnimationController1.reverse()
      //         : _opacityAnimationController1.forward();
      //     _opacityAnimationController2.isCompleted
      //         ? _opacityAnimationController2.reverse()
      //         : _opacityAnimationController2.forward();
      //   },
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/images/BabyYodaLogo.png",
              fit: BoxFit.cover,
              width: 250,
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _opacityAnimation1,
              builder: (context, _) => AnimatedBuilder(
                animation: _opacityAnimation2,
                builder: (context, _) => Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        primaryColor.withOpacity(1 * _opacityAnimation1.value),
                        primaryColor.withOpacity(1 * _opacityAnimation2.value),
                      ],
                    ),
                  ),
                  height: 120,
                  width: 120,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.35,
            left: MediaQuery.of(context).size.width * 0.45,
            child: SizedBox(
              child: AnimatedBuilder(
                animation: _valueAnimation,
                builder: (context, _) => CircularProgressIndicator(
                  backgroundColor: tertiaryColor,
                  value: _valueAnimation.value,
                  valueColor: AlwaysStoppedAnimation(secondaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
