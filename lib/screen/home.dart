import 'package:apod_nasa/screen/info.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import '../utils/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = List<Note>();

  Future<List<Note>> fetchImage() async {
    Response response = await get(
        'https://api.nasa.gov/planetary/apod?&start_date=2020-12-20&api_key=QkDUPKRdIInYFYbJMRA7RDz4u33Y1Qadmygr3soF');
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var x in notesJson) {
        if (x['media_type'] == 'image') {
          notes.add(Note.fromJson(x));
        }
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchImage().then((value) {
      setState(() {
        notes.addAll(value);
        print(notes);
      });
    });
    Future.delayed(Duration(seconds: 7)).then((value) {
      setState(() {
        print(5);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Astronomical Picture of the Day',
            style: TextStyle(color: Colors.black),
          ),
          leading:
              Image.network('https://img.icons8.com/color/48/000000/nasa.png'),
          backgroundColor: Colors.cyan,
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              // return GestureDetector(

              // onDoubleTap: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (BuildContext context) =>
              //               InfoPage(count: index, notez: notes)));
              // },
              return Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                InfoPage(count: index, notez: notes)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(notes[index].url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }));
  }
}
