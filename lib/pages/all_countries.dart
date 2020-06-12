import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllCountriesPage extends StatefulWidget {
  @override
  _AllCountriesPageState createState() => _AllCountriesPageState();
}

class _AllCountriesPageState extends State<AllCountriesPage> {
  List countryData;
  fetchAllCountryData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries?sort=cases");
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchAllCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Country Info",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                  Text(
                    "RECOVERED",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "DEATHS",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            countryData == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: countryData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        margin: EdgeInsets.symmetric(
                            horizontal: width / 50, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[400],
                                  blurRadius: 30,
                                  offset: Offset(0, 10))
                            ]),
                        child: Row(
                          // alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              width: width / 1.1,
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Positioned(
                                    left: width / 20,
                                    child: Text(
                                      countryData[index]["country"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Positioned(
                                    right: width / 1.9,
                                    child: Text(
                                      countryData[index]['cases'].toString(),
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    right: width/2.9,
                                    child: Text(
                                        countryData[index]['active'].toString(),
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Positioned(
                                    right: width/5.5,
                                    child: Text(
                                        countryData[index]['recovered']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Positioned(
                                    right: width/40,
                                    child: Text(
                                        countryData[index]['deaths'].toString(),
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
                    })
          ],
        ),
      ),
    );
  }
}
