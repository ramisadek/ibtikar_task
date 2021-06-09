import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double _targetValue = 50;
  static final int _loadDuration = 2;
  FlutterLogoStyle _style = FlutterLogoStyle.markOnly;

  goToHome() async{
    await Future.delayed(Duration(seconds: _loadDuration+2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToHome();
    setState(() {
      _targetValue = 250;
      Future.delayed(Duration(seconds: 1),(){
        _style = FlutterLogoStyle.horizontal;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double> (
          tween: Tween<double> (begin: 50,end: _targetValue),
          duration: Duration(seconds: _loadDuration-1),
          builder: (BuildContext context,double size,Widget? child){
            return FlutterLogo(
              size: size,
              style: _style,
              curve: Curves.bounceInOut,
              duration: Duration(seconds: _loadDuration),
            );
          },
        ),
      ),
    );
  }
}
