import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllStatesPage extends StatefulWidget {
  @override
  _AllStatesPageState createState() => _AllStatesPageState();
}

class _AllStatesPageState extends State<AllStatesPage> {
  // Map stateData;
  List stateList;
  fetchAllStateData() async {
    http.Response response =
        await http.get("https://api.covidindiatracker.com/state_data.json");
    setState(() {
      stateList = jsonDecode(response.body);
      // stateList = stateData['state'];
    });
  }

  @override
  void initState() {
    fetchAllStateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          "State Info",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Padding(padding: EdgeInsets.symmetric(vertical:5),),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "TOTAL CASES",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "ACTIVE",
                    style: TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.bold),
                  ),
                  Text("RECOVERED",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                  Text("DEATHS",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            stateList == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: stateList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        margin: EdgeInsets.symmetric(
                            vertical: 5, horizontal: width / 50),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[400],
                                  blurRadius: 30,
                                  offset: Offset(0, 10))
                            ]),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              // margin: EdgeInsets.symmetric(horizontal: 2),
                              width: width/1.1,
                              child: Stack(
                                alignment: Alignment.center,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Positioned(
                                    left: width / 50,
                                    child: Text(
                                      stateList[index]['state'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Positioned(
                                    right: width / 2.1,
                                    child: Text(
                                        stateList[index]['confirmed']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Positioned(
                                    right: width/3,
                                    child: Text(
                                        stateList[index]['active'].toString(),
                                        style: TextStyle(
                                            color: Color(0xffffca28),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Positioned(
                                    right: width/5.8,
                                    child: Text(
                                        stateList[index]['recovered']
                                            .toString(),
                                        style: TextStyle(
                                            color: Color(0xff66bb6a),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Positioned(
                                    right: width/40,
                                    child: Text(
                                        stateList[index]['deaths'].toString(),
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
