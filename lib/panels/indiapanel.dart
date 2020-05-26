import 'package:flutter/material.dart';

class IndiaPanel extends StatelessWidget {
  final Map indiaData;
  const IndiaPanel({Key key, this.indiaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
            ),
            StatusPanel(
              title: 'CONFIRMED',
              panelColor: Color(0xffffca28),
              textColor: Colors.white,
              count: indiaData["confirmed_cases"].toString(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
            ),
            StatusPanel(
              title: 'ACTIVE',
              panelColor: Color(0xff42A5f5),
              textColor: Colors.white,
              count: indiaData["active_cases"].toString(),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
            ),
            StatusPanel(
              title: 'RECOVERED',
              panelColor: Color(0xff66bb6a),
              textColor: Colors.white,
              count: indiaData["recovered_cases"].toString(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
            ),
            StatusPanel(
              title: 'DEATHS',
              panelColor: Colors.red,
              textColor: Colors.white,
              count: indiaData["death_cases"].toString(),
            )
          ],
        ),
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: panelColor,
      ),
      height: 150,
      width: width / 2.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                count,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: textColor),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: textColor),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
