import 'dart:async';
import 'dart:convert';
import 'package:covid19_infoapp/panels/statepanel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:covid19_infoapp/pages/all_states.dart';
import 'package:covid19_infoapp/panels/indiapanel.dart';
import 'package:covid19_infoapp/panels/worldpanel.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class OverView extends StatefulWidget {
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> with AutomaticKeepAliveClientMixin{
  List indiaList;
  Map worldData;
  Map indiaData;
  List stateList;

  @override
  bool get wantKeepAlive => true;

  StreamSubscription<DataConnectionStatus> listener;
  // fetchIndiaData() async {
  //   http.Response response =
  //       await http.get("http://covid19-india-adhikansh.herokuapp.com/summary");
  //   setState(() {
  //     indiaData = jsonDecode(response.body);
  //   });
  // }

  // fetchWorldData() async {
  //   http.Response response = await http.get("https://corona.lmao.ninja/v2/all");
  //   setState(() {
  //     worldData = jsonDecode(response.body);
  //   });
  // }

  // fetchStateData() async {
  //   // DataConnectionStatus status = await checkInternet();
  //   // if(status == DataConnectionStatus.connected){
  //   http.Response response =
  //       await http.get("http://covid19-india-adhikansh.herokuapp.com/states");
  //   setState(() {
  //     stateData = jsonDecode(response.body);
  //     stateList = stateData['state'];
  //   });
  //   // } else{
  //   //   showDialog(
  //   //     context: context,
  //   //     builder: (context)  => AlertDialog(
  //   //       title: Text("No Internet"),
  //   //       content:  Text("Check your internet connection"),
  //   //     )
  //   //   );
  //   // }
  // }

  fetchAllData() async {
    DataConnectionStatus status = await checkInternet();
    if (status == DataConnectionStatus.connected) {
      http.Response response1 = await http
          .get("https://covid-19india-api.herokuapp.com/v2.0/country_data");
      http.Response response2 =
          await http.get("https://api.covid19api.com/world/total");
      http.Response response3 =
          await http.get("https://api.covidindiatracker.com/state_data.json");
      setState(() {
        indiaList = jsonDecode(response1.body);
        worldData = jsonDecode(response2.body);
        stateList = jsonDecode(response3.body);
        indiaData = indiaList[1];
      });
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("No Internet Detected"),
                content: Text(
                    "Please check your internet connection and try again."),
              ));
    }
  }

  checkInternet() async {
    // print("The statement 'this machine is connected to the Internet' is: ");

    // print(await DataConnectionChecker().hasConnection);

    print("Current status: ${await DataConnectionChecker().connectionStatus}");

    // print("Last results: ${DataConnectionChecker().lastTryResults}");

    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    });

    // close listener after 30 seconds, so the program doesn't run forever
    await Future.delayed(Duration(seconds: 5));
    await listener.cancel();

    return DataConnectionChecker().connectionStatus;
  }

  @override
  void initState() {
    // fetchIndiaData();
    // fetchWorldData();
    // fetchStateData();
    fetchAllData();
    super.initState();
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        Container(
          child: Stack(children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: width / 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.indigo[800]),
                                child: Text(
                                  "   INDIA   ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                )),
                            Container(
                              child: RaisedButton(
                                highlightColor: Colors.blue,
                                color: Colors.indigo[700],
                                elevation: 15,
                                child: Text(
                                  "Last Updated",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () =>
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                          indiaData["last_updated"].toString(),
                                        ),
                                        duration: Duration(seconds: 3))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    height: 140,
                    width: width,
                    color: Colors.indigo[800],
                  ),
                  Container(
                    height: 295,
                    width: width,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
                top: 90,
                child: Container(
                    child: indiaData == null
                        ? Center(child: Container())
                        : IndiaPanel(indiaData: indiaData))),
          ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        worldData == null
            ? Center(child: CircularProgressIndicator())
            : WorldWide(worldData: worldData),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        stateList == null
            ? Container(
                child: Center(
                    child: Text(
                "Loading the info...\nPlease wait, this might take a few secs.",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )))
            : StatePanel(stateList: stateList),
        worldData == null
            ? Container()
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Other States"),
                    textColor: Colors.white,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllStatesPage()));
                    },
                  ),
                  SizedBox(width: 30),
                ],
              ),
      ]),
    );
  }
}
