import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/home/card_view.dart';
import 'package:medicalapp/home/user.dart';
import 'package:medicalapp/widgets/appointment.dart';

class Home extends StatefulWidget {
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final tab = [Cardview(), Appointment(), User()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Medical App",
          style: TextStyle(
            fontFamily: "Marmelad",
            fontSize: 20,
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 30),
            icon: IconButton(
              icon: Icon(
                Icons.add_alert_sharp,
                color: Colors.grey,
              ),
              iconSize: 30,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: tab[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              title: Text('Appointment')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), title: Text('Profile'))
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
