import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/config/config_screen.dart';

class Doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctors",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Doctors").snapshots(),
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
                                  image: AssetImage("image/image3.jpg"),
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
                                    "Dr. " + e.data()["name"],
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  Text(
                                    "email : " + e.data()["email"],
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  Text(
                                    "Phone Number : " + e.data()["phoneNumber"],
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
    );

    // SizedBox(
    //   height: 10,
    // ),
    // Card(
    //   elevation: 10,
    //   child: InkWell(
    //     onTap: () {},
    //     child: Container(
    //       padding: const EdgeInsets.only(
    //           left: 10, top: 5, right: 5, bottom: 5),
    //       width: Config.screenWidth,
    //       height: Config.screenHeight / 8,
    //       color: Colors.white,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           new Container(
    //             width: 70.0,
    //             height: 70.0,
    //             decoration: new BoxDecoration(
    //               color: const Color(0xff7c94b6),
    //               image: new DecorationImage(
    //                 image: AssetImage("image/image3.jpg"),
    //                 fit: BoxFit.cover,
    //               ),
    //               borderRadius:
    //                   new BorderRadius.all(new Radius.circular(50.0)),
    //               border: new Border.all(
    //                 color: Colors.red,
    //                 width: 4.0,
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             width: 30,
    //           ),
    //           Center(
    //             child: Column(
    //               children: [
    //                 Text(
    //                   "Dr. Muhamad Ali Ahmad",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //                 Text(
    //                   "email : muhamad.ali87@gmail.com",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //                 Text(
    //                   "Phone Number : 07504567623",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // SizedBox(
    //   height: 10,
    // ),
    // Card(
    //   elevation: 10,
    //   child: InkWell(
    //     onTap: () {
    //       print("hii");
    //     },
    //     child: Container(
    //       padding: const EdgeInsets.only(
    //           left: 10, top: 5, right: 5, bottom: 5),
    //       width: Config.screenWidth,
    //       height: Config.screenHeight / 8,
    //       color: Colors.white,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           new Container(
    //             width: 70.0,
    //             height: 70.0,
    //             decoration: new BoxDecoration(
    //               color: const Color(0xff7c94b6),
    //               image: new DecorationImage(
    //                 image: AssetImage("image/image3.jpg"),
    //                 fit: BoxFit.cover,
    //               ),
    //               borderRadius:
    //                   new BorderRadius.all(new Radius.circular(50.0)),
    //               border: new Border.all(
    //                 color: Colors.red,
    //                 width: 4.0,
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             width: 30,
    //           ),
    //           Center(
    //             child: Column(
    //               children: [
    //                 Text(
    //                   "Dr. Qadir Kareem Luqman",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //                 Text(
    //                   "email : Qadir.lumqn@yahoo.com",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //                 Text(
    //                   "Phone Number : 07507654234",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // SizedBox(
    //   height: 10,
    // ),
    // Card(
    //   elevation: 10,
    //   child: InkWell(
    //     onTap: () {
    //       print("hii");
    //     },
    //     child: Container(
    //       padding: const EdgeInsets.only(
    //           left: 10, top: 5, right: 5, bottom: 5),
    //       width: Config.screenWidth,
    //       height: Config.screenHeight / 8,
    //       color: Colors.white,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           new Container(
    //             width: 70.0,
    //             height: 70.0,
    //             decoration: new BoxDecoration(
    //               color: const Color(0xff7c94b6),
    //               image: new DecorationImage(
    //                 image: AssetImage("image/image3.jpg"),
    //                 fit: BoxFit.cover,
    //               ),
    //               borderRadius:
    //                   new BorderRadius.all(new Radius.circular(50.0)),
    //               border: new Border.all(
    //                 color: Colors.red,
    //                 width: 4.0,
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             width: 30,
    //           ),
    //           Center(
    //             child: Column(
    //               children: [
    //                 Text(
    //                   "Dr. Zhyan Dara Rostam",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //                 Text(
    //                   "email : Zhyan.dara77@hotmail.com",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //                 Text(
    //                   "Phone Number : 07506789012",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // SizedBox(
    //   height: 10,
    // ),
    // Card(
    //   elevation: 10,
    //   child: InkWell(
    //     onTap: () {
    //       print("hii");
    //     },
    //     child: Container(
    //       padding: const EdgeInsets.only(
    //           left: 10, top: 5, right: 5, bottom: 5),
    //       width: Config.screenWidth,
    //       height: Config.screenHeight / 8,
    //       color: Colors.white,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           new Container(
    //             width: 70.0,
    //             height: 70.0,
    //             decoration: new BoxDecoration(
    //               color: const Color(0xff7c94b6),
    //               image: new DecorationImage(
    //                 image: AssetImage("image/image3.jpg"),
    //                 fit: BoxFit.cover,
    //               ),
    //               borderRadius:
    //                   new BorderRadius.all(new Radius.circular(50.0)),
    //               border: new Border.all(
    //                 color: Colors.red,
    //                 width: 4.0,
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             width: 30,
    //           ),
    //           Center(
    //             child: Column(
    //               children: [
    //                 Text(
    //                   "Dr. Barham Salih Ahmed",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //                 Text(
    //                   "email : Barham.a@gmail.com",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //                 Text(
    //                   "Phone Number : 07503456789",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // SizedBox(
    //   height: 10,
    // ),
    // Card(
    //   elevation: 10,
    //   child: InkWell(
    //     onTap: () {
    //       print("hii");
    //     },
    //     child: Container(
    //       padding: const EdgeInsets.only(
    //           left: 10, top: 5, right: 5, bottom: 5),
    //       width: Config.screenWidth,
    //       height: Config.screenHeight / 8,
    //       color: Colors.white,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           new Container(
    //             width: 70.0,
    //             height: 70.0,
    //             decoration: new BoxDecoration(
    //               color: const Color(0xff7c94b6),
    //               image: new DecorationImage(
    //                 image: AssetImage("image/image3.jpg"),
    //                 fit: BoxFit.cover,
    //               ),
    //               borderRadius:
    //                   new BorderRadius.all(new Radius.circular(50.0)),
    //               border: new Border.all(
    //                 color: Colors.red,
    //                 width: 4.0,
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             width: 30,
    //           ),
    //           Center(
    //             child: Column(
    //               children: [
    //                 Text(
    //                   "Dr. Kawa Essam Nadr",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //                 Text(
    //                   "email : Kawa.nadr@gmail.com",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //                 Text(
    //                   "Phone Number : 07507652113",
    //                   style:
    //                       TextStyle(fontSize: 15, color: Colors.black),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // SizedBox(
    //   height: 10,
    // ),
  }
}
