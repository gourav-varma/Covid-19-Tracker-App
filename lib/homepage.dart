import 'package:covid19_infoapp/drawer.dart';
import 'package:covid19_infoapp/tabbar_screens/faq.dart';
import 'package:covid19_infoapp/tabbar_screens/overview.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'tabbar_screens/precautions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("COVID-19 ",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w300)),
              Text("InfoKit",
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.w700))
            ],
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // color: Colors.white,
                border: Border.all(color: Colors.black)),
            tabs: <Widget>[
              Tab(
                child: TabBarItems(
                  item: "OVERVIEW",
                ),
              ),
              Tab(
                  child: TabBarItems(
                item: "FAQ",
              )),
              Tab(
                child: TabBarItems(
                  item: "Precautions",
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            OverView(),
            FAQs(),
            Precautions(),
          ],
        ),
        drawer: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.black.withOpacity(0.7)),
          child: Container(
            width: width / 1.05,
            child: Drawer(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: DrawerItems(
                        title: "HOME",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launch("https://www.helpageindia.org/covid-19/");
                      },
                      child: DrawerItems(
                        title: "DONATE",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launch(
                            "https://www.mohfw.gov.in/pdf/coronvavirushelplinenumber.pdf");
                      },
                      child: DrawerItems(
                        title: "GET HELP",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launch(
                            "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
                      },
                      child: DrawerItems(
                        title: "MYTHBUSTERS",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
