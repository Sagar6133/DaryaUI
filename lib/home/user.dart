import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              backgroundColor: Colors.white12,
              radius: 100,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Image.asset("image/user.png"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Full name: Tazra jassim",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Username: tazra.jassim98",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Email: tazra_jassim@outlook.com",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Contact: 07501889878",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Address: erbil - gullan",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
