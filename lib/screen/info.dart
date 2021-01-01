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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: NetworkImage(notez[count].url),
                  ),
                  Text(
                    'Date: ' + notez[count].date,
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
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
