import 'package:flutter/material.dart';
import '../utils/data.dart';

class InfoPage extends StatelessWidget {
  List<Note> notez;
  int count;
  InfoPage({this.count, this.notez});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            notez[count].title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Card(
              color: Colors.black,
              child: Column(
                children: <Widget>[
                  Image(
                    image: NetworkImage(notez[count].url),
                  ),
                  Text(
                    notez[count].date,
                    //textAlign:,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    notez[count].explanation,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )),
        ));
  }
}
