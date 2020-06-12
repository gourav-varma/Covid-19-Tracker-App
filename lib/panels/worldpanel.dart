import 'package:covid19_infoapp/pages/all_countries.dart';
import 'package:flutter/material.dart';

class WorldWide extends StatelessWidget {
  final Map worldData;

  const WorldWide({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 55,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: width/18),
      color: Colors.indigo[900],
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                worldData["TotalConfirmed"].toString(),
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Text(
                "cases",
                style: TextStyle(color: Colors.white, fontSize: 11),
              )
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: width/20)),

          Text(
            "WORLDWIDE",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: width/11)),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllCountriesPage()));
            },
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 35,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
