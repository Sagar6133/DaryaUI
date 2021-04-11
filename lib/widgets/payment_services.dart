import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/config/config_screen.dart';

class PaymentServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Services",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("PriceServices").snapshots(),
        // ignore: missing_return
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xffdaa520),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {}
          if (snapshot.hasError)
            return Center(
              child: Text("Some error came"),
            );
          if (!snapshot.hasData || !snapshot.data.docs.isNotEmpty) {
            //  return CompanyDetails();
          } else {
            return ListView(
              children: snapshot.data.docs.map(
                (e) {
                  print(e.data()["email"]);
                  return Card(
                    elevation: 10,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 10, top: 5, right: 5, bottom: 5),
                        width: Config.screenWidth,
                        height: Config.screenHeight / 8,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            new Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: new BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: new DecorationImage(
                                  image: AssetImage("image/img1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(50.0)),
                                border: new Border.all(
                                  color: Colors.red,
                                  width: 4.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    e.data()["name"],
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  Text(
                                    "Dr's Name : " + e.data()["drname"],
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  Text(
                                    "Price : " + e.data()["price"],
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            );
          }
        },
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: <Widget>[
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Card(
      //         elevation: 10,
      //         child: InkWell(
      //           onTap: () {},
      //           child: Container(
      //             padding: const EdgeInsets.only(
      //                 left: 10, top: 5, right: 5, bottom: 5),
      //             width: Config.screenWidth,
      //             height: Config.screenHeight / 8,
      //             color: Colors.white,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 new Container(
      //                   width: 70.0,
      //                   height: 70.0,
      //                   decoration: new BoxDecoration(
      //                     color: const Color(0xff7c94b6),
      //                     image: new DecorationImage(
      //                       image: AssetImage("image/hospital.png"),
      //                       fit: BoxFit.cover,
      //                     ),
      //                     borderRadius:
      //                         new BorderRadius.all(new Radius.circular(50.0)),
      //                     border: new Border.all(
      //                       color: Colors.red,
      //                       width: 4.0,
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: 30,
      //                 ),
      //                 Center(
      //                   child: Column(
      //                     children: [
      //                       Text(
      //                         "Emirates private hospital",
      //                         style:
      //                             TextStyle(fontSize: 15, color: Colors.black),
      //                       ),
      //                       Text(
      //                         "Erbil - Gullan road",
      //                         style:
      //                             TextStyle(fontSize: 15, color: Colors.black),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Card(
      //         elevation: 10,
      //         child: InkWell(
      //           onTap: () {
      //             print("hii");
      //           },
      //           child: Container(
      //             padding: const EdgeInsets.only(
      //                 left: 10, top: 5, right: 5, bottom: 5),
      //             width: Config.screenWidth,
      //             height: Config.screenHeight / 8,
      //             color: Colors.white,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 new Container(
      //                   width: 70.0,
      //                   height: 70.0,
      //                   decoration: new BoxDecoration(
      //                     color: Colors.white,
      //                     image: new DecorationImage(
      //                       image: AssetImage("image/logo.png"),
      //                       fit: BoxFit.cover,
      //                     ),
      //                     borderRadius:
      //                         new BorderRadius.all(new Radius.circular(50.0)),
      //                     border: new Border.all(
      //                       color: Colors.red,
      //                       width: 4.0,
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: 30,
      //                 ),
      //                 Center(
      //                   child: Column(
      //                     children: [
      //                       Text(
      //                         "Erbil international Hospital",
      //                         style:
      //                             TextStyle(fontSize: 15, color: Colors.black),
      //                       ),
      //                       Text(
      //                         "Erbil - 100m Road",
      //                         style:
      //                             TextStyle(fontSize: 15, color: Colors.black),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Card(
      //         elevation: 10,
      //         child: InkWell(
      //           onTap: () {
      //             print("hii");
      //           },
      //           child: Container(
      //             padding: const EdgeInsets.only(
      //                 left: 10, top: 5, right: 5, bottom: 5),
      //             width: Config.screenWidth,
      //             height: Config.screenHeight / 8,
      //             color: Colors.white,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 new Container(
      //                   width: 70.0,
      //                   height: 70.0,
      //                   decoration: new BoxDecoration(
      //                     color: const Color(0xff7c94b6),
      //                     image: new DecorationImage(
      //                       image: AssetImage("image/preview.jpg"),
      //                       fit: BoxFit.cover,
      //                     ),
      //                     borderRadius:
      //                         new BorderRadius.all(new Radius.circular(50.0)),
      //                     border: new Border.all(
      //                       color: Colors.red,
      //                       width: 4.0,
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: 30,
      //                 ),
      //                 Center(
      //                   child: Column(
      //                     children: [
      //                       Text(
      //                         "Zhin International hospital",
      //                         style:
      //                             TextStyle(fontSize: 15, color: Colors.black),
      //                       ),
      //                       Text(
      //                         "Erbil - Koya Road",
      //                         style:
      //                             TextStyle(fontSize: 15, color: Colors.black),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Card(
      //         elevation: 10,
      //         child: InkWell(
      //           onTap: () {
      //             print("hii");
      //           },
      //           child: Container(
      //             padding: const EdgeInsets.only(
      //                 left: 10, top: 5, right: 5, bottom: 5),
      //             width: Config.screenWidth,
      //             height: Config.screenHeight / 8,
      //             color: Colors.white,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 new Container(
      //                   width: 70.0,
      //                   height: 70.0,
      //                   decoration: new BoxDecoration(
      //                     color: const Color(0xff7c94b6),
      //                     image: new DecorationImage(
      //                       image: AssetImage("image/img1.jpg"),
      //                       fit: BoxFit.cover,
      //                     ),
      //                     borderRadius:
      //                         new BorderRadius.all(new Radius.circular(50.0)),
      //                     border: new Border.all(
      //                       color: Colors.red,
      //                       width: 4.0,
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: 30,
      //                 ),
      //                 Center(
      //                   child: Column(
      //                     children: [
      //                       Text(
      //                         "Sardem private Hospital",
      //                         style:
      //                             TextStyle(fontSize: 15, color: Colors.black),
      //                       ),
      //                       Text(
      //                         "Erbil - Newroz road",
      //                         style:
      //                             TextStyle(fontSize: 15, color: Colors.black),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Card(
      //         elevation: 10,
      //         child: InkWell(
      //           onTap: () {
      //             print("hii");
      //           },
      //           child: Container(
      //             padding: const EdgeInsets.only(
      //                 left: 10, top: 5, right: 5, bottom: 5),
      //             width: Config.screenWidth,
      //             height: Config.screenHeight / 8,
      //             color: Colors.white,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 new Container(
      //                   width: 70.0,
      //                   height: 70.0,
      //                   decoration: new BoxDecoration(
      //                     color: const Color(0xff7c94b6),
      //                     image: new DecorationImage(
      //                       image: AssetImage("image/hospital.png"),
      //                       fit: BoxFit.cover,
      //                     ),
      //                     borderRadius:
      //                         new BorderRadius.all(new Radius.circular(50.0)),
      //                     border: new Border.all(
      //                       color: Colors.red,
      //                       width: 4.0,
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: 30,
      //                 ),
      //                 Center(
      //                   child: Column(
      //                     children: [
      //                       Text(
      //                         "Par Private Hospital",
      //                         style:
      //                             TextStyle(fontSize: 15, color: Colors.black),
      //                       ),
      //                       Text(
      //                         "Erbil - 60m Road",
      //                         style:
      //                             TextStyle(fontSize: 15, color: Colors.black),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}