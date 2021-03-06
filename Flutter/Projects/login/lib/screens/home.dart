import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/components/tile_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home"),
      // ),
      body: Column(children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      color: Colors.blue,
                      width: MediaQuery.of(context).size.width * 0.40),
                  Container(
                    color: Colors.yellow,
                    width: MediaQuery.of(context).size.width * 0.40,
                  ),
                  Container(
                      color: Colors.green,
                      width: MediaQuery.of(context).size.width * 0.40)
                ],
              )),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              getTile(
                  title: "Huzaifa",
                  subtitle: "See you tomorrow",
                  time: "11:45 AM"),
              getTile(
                  title: "Rafay",
                  subtitle: "come class tomorrow on time",
                  time: "09:00 PM"),
              getTile(
                  title: "Shazaib",
                  subtitle: "kaam send kardo yar",
                  time: "11:45 AM"),
              getTile(
                  title: "Ahsan",
                  subtitle: "Project ka kuch howa?",
                  time: "09:00 PM"),
              getTile(
                  title: "Ayan",
                  subtitle: "yar tum apny watch hamary ghar bhool gaye",
                  time: "11:45 AM"),
              getTile(
                  title: "hammad",
                  subtitle: "academy kab phonchogy",
                  time: "09:00 PM"),
              getTile(
                  title: "Huzaifa",
                  subtitle: "See you tomorrow",
                  time: "11:45 AM"),
              getTile(
                  title: "Bilal",
                  subtitle: "come class tomorrow on time",
                  time: "09:00 PM"),
            ],
          ),
        ),
      ]),
    );
  }
}
