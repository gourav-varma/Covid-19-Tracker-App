import "package:flutter/material.dart";

import 'datasource.dart';

class FAQs extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(top: 25),
          height: 180,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: width/20),
              child: Center(
                child: Text(
            "Know more about the Coronavirus",
            style: TextStyle(color: Colors.white, fontSize: 33),
          ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            children: <Widget>[
              Container(
                child: Text(
                  "Top Questions",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: DataSource.questionAnswers.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(
                    DataSource.questionAnswers[index]['question'],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          DataSource.questionAnswers[index]['answer'],
                          style: TextStyle(
                            wordSpacing: 3,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
