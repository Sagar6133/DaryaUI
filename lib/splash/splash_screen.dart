import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/config/config_screen.dart';
import 'package:medicalapp/home/login.dart';

class SplashScreen extends StatefulWidget {
  _Splash createState() => _Splash();
}

class _Splash extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LogIn()));
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Container(
        width: Config.screenWidth,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: Colors.white12,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: Config.blockSizeVertical * 12.50,
              ),
              cAvatar(),
              SizedBox(
                height: 50,
              ),
              Text(
                "Medical App",
                style: Theme.of(context).textTheme.headline3.apply(
                      fontFamily: "Marmelad",
                      color: Colors.black87,
                      fontWeightDelta: 3,
                    ),
              ),
              SizedBox(
                height: 60,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
                backgroundColor: Colors.blue,
                strokeWidth: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  cAvatar() {
    return CircleAvatar(
      backgroundColor: Colors.white12,
      radius: 100,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Image.asset("image/logo.png"),
      ),
    );
  }
}
