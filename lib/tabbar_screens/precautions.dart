import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';

class Precautions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
            height: 180,
            width: MediaQuery.of(context).size.width,
            color: Colors.indigo[900],
            child: Text(
              "Stay Home. Stay Safe.",
              style: TextStyle(color: Colors.white, fontSize: width / 15),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: width / 25),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "      NOTE      ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width / 25),
            child: Text(
              "These are only precautionary steps that an inidividual can take to decrease the chances of getting infected. If any symptoms start to show, kindly seek immediate medical help.",
              style: TextStyle(color: Colors.red, fontSize: 15, wordSpacing: 1),
            ),
          ),
          Divider(
            height: 35,
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),
          ListTile(
            leading: CircleAvatar(
              foregroundColor: Colors.blue,
              radius: 30,
              backgroundImage: AssetImage("assets/handwash.jpg"),
            ),
            title: Text("Wash your hands regularly with soap."),
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            subtitle: Text(
                "Washing your hand every 6 hours with alcohol based soaps will decrease the chance of getting infected."),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              foregroundColor: Colors.blue,
              backgroundImage: AssetImage("assets/dustbin.png"),
            ),
            title: Text("Discard used tissues immediately."),
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            subtitle: Text(
                "Do not use a tissue after one use. Throw it in a dustbin which you fo not frequently go near."),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              foregroundColor: Colors.red,
              backgroundImage: AssetImage("assets/medical help.jpg"),
            ),
            title: Text("Seek medical help."),
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            subtitle: Text(
                "If you feel you have any symptoms of coronavirus, seek help immediatly via helpline numbers"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              foregroundColor: Colors.red,
              backgroundImage: AssetImage("assets/social distancing.png"),
            ),
            title: Text("Avoid social contact."),
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            subtitle: Text(
                "Practice social distancing and avoid contact with anyone to help stop the spread of the virus."),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            height: 3,
            color: Colors.black,
            indent: 48,
            endIndent: 48,
          ),
          Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      RaisedButton(
                          onPressed: () {
                            launch(
                                "https://www.mohfw.gov.in/pdf/coronvavirushelplinenumber.pdf");
                          },
                          color: Colors.black,
                          child: Text(
                            "National Helpline Numbers",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
