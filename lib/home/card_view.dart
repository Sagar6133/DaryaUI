import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/config/config_screen.dart';
import 'package:medicalapp/widgets/appointment.dart';
import 'package:medicalapp/widgets/doctors.dart';
import 'package:medicalapp/widgets/hospital.dart';
import 'package:medicalapp/widgets/payment_services.dart';

class Cardview extends StatefulWidget {
  _Card_view createState() => _Card_view();
}

class _Card_view extends State<Cardview> {
  Future<QuerySnapshot> getData(String queryString) async {
    return FirebaseFirestore.instance
        .collection("Doctors")
        .where("name", isEqualTo: queryString)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              "Hello Tazra",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline.apply(
                    fontFamily: "Marmelad",
                    color: Colors.lightBlueAccent,
                    fontWeightDelta: 3,
                  ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 70,
                    color: Colors.grey,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) async {
                        QuerySnapshot shot = await getData(value);
                        return ListView.builder(
                          itemCount: shot.docs.length,
                          itemBuilder: (_, int index) {
                            return ListTile(
                              title: Text(shot.docs[index]["name"]),
                            );
                          },
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 6,
                ),
                Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Doctor()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, top: 0, right: 0, bottom: 5),
                      width: Config.screenWidth / 2 - 20,
                      height: Config.screenHeight / 4,
                      //  color: Colors.blueAccent,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('image/logo2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Find Doctor",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              "125 doctors",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Hospital()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, top: 0, right: 0, bottom: 5),
                      width: Config.screenWidth / 2 - 20,
                      height: Config.screenHeight / 4,
                      //  color: Colors.black45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('image/hospital.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Find Hospital",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              "26 hospital",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 6,
                ),
                Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Appointment()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, top: 0, right: 0, bottom: 5),
                      width: Config.screenWidth / 2 - 20,
                      height: Config.screenHeight / 4,
                      //color: Colors.black45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('image/logo.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Appointment",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              "20 available",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Card(
                  child: InkWell(
                    onTap: () {
                      //  PaymentServices
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => PaymentServices()));
                      print("hii");
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, top: 0, right: 0, bottom: 5),
                      width: Config.screenWidth / 2 - 20,
                      height: Config.screenHeight / 4,
                      //color: Colors.black45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('image/logo.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Price Services",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              "18 services",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
