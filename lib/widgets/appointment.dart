import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/config/config_screen.dart';

class Appointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("Appointments").snapshots(),
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
                  return Card(
                    elevation: 10,
                    child: InkWell(
                      onTap: () {
                        print("hii");
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 5, top: 5, right: 5, bottom: 5),
                        width: Config.screenWidth,
                        height: Config.screenHeight / 8,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                e.data()["name"],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              Text(
                                "Days : " + e.data()["days"],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                "Time : " + e.data()["time"],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              )
                            ],
                          ),
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
      //           onTap: () {
      //             print("hii");
      //           },
      //           child: Container(
      //             padding: const EdgeInsets.only(
      //                 left: 5, top: 5, right: 5, bottom: 5),
      //             width: Config.screenWidth,
      //             height: Config.screenHeight / 8,
      //             color: Colors.white,
      //             child: Center(
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     "Name : SunShine Hospital",
      //                     style: TextStyle(fontSize: 20, color: Colors.black),
      //                   ),
      //                   Text(
      //                     "Place : Irbil",
      //                     style: TextStyle(fontSize: 15, color: Colors.black),
      //                   ),
      //                   Text(
      //                     "Department Available :  Gynaecology, Cardiology",
      //                     style: TextStyle(fontSize: 15, color: Colors.black),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Card(
      //         elevation: 10,
      //         child: InkWell(
      //           onTap: () {
      //             print("hii");
      //           },
      //           child: Container(
      //             padding: const EdgeInsets.only(
      //                 left: 5, top: 5, right: 5, bottom: 5),
      //             width: Config.screenWidth,
      //             height: Config.screenHeight / 8,
      //             color: Colors.white,
      //             child: Center(
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     "Name : Tazra care",
      //                     style: TextStyle(fontSize: 20, color: Colors.black),
      //                   ),
      //                   Text(
      //                     "Place : Irbil",
      //                     style: TextStyle(fontSize: 15, color: Colors.black),
      //                   ),
      //                   Text(
      //                     "Department Available :  Gynaecology, Cardiology",
      //                     style: TextStyle(fontSize: 15, color: Colors.black),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Card(
      //         elevation: 10,
      //         child: InkWell(
      //           onTap: () {
      //             print("hii");
      //           },
      //           child: Container(
      //             padding: const EdgeInsets.only(
      //                 left: 5, top: 5, right: 5, bottom: 5),
      //             width: Config.screenWidth,
      //             height: Config.screenHeight / 8,
      //             color: Colors.white,
      //             child: Center(
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     "Name : Darya Care",
      //                     style: TextStyle(fontSize: 20, color: Colors.black),
      //                   ),
      //                   Text(
      //                     "Place : Irbil",
      //                     style: TextStyle(fontSize: 15, color: Colors.black),
      //                   ),
      //                   Text(
      //                     "Department Available :  Gynaecology, Cardiology",
      //                     style: TextStyle(fontSize: 15, color: Colors.black),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Card(
      //         elevation: 10,
      //         child: InkWell(
      //           onTap: () {
      //             print("hii");
      //           },
      //           child: Container(
      //             padding: const EdgeInsets.only(
      //                 left: 5, top: 5, right: 5, bottom: 5),
      //             width: Config.screenWidth,
      //             height: Config.screenHeight / 8,
      //             color: Colors.white,
      //             child: Center(
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     "Name : Apollo Hospital",
      //                     style: TextStyle(fontSize: 20, color: Colors.black),
      //                   ),
      //                   Text(
      //                     "Place : Irbil",
      //                     style: TextStyle(fontSize: 15, color: Colors.black),
      //                   ),
      //                   Text(
      //                     "Department Available :  Gynaecology, Cardiology",
      //                     style: TextStyle(fontSize: 15, color: Colors.black),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
