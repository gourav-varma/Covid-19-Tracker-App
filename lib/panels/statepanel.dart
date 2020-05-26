import 'package:flutter/material.dart';

class StatePanel extends StatefulWidget {
  final List stateList;

  const StatePanel({Key key, this.stateList}) : super(key: key);

  @override
  _StatePanelState createState() => _StatePanelState(stateList);
}

class _StatePanelState extends State<StatePanel> {
  final List stateList;

  _StatePanelState(this.stateList);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 30,
                  offset: Offset(0, 10))
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        stateList[index]['state'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 20),
                      ),
                      Text(stateList[index]['confirmed'].toString(),
                          style: TextStyle(
                              color: Color(0xffffca28),
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 35),
                      ),
                      Text(stateList[index]['recovered'].toString(),
                          style: TextStyle(
                              color: Color(0xff66bb6a),
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 35),
                      ),
                      Text(stateList[index]['deaths'].toString(),
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
