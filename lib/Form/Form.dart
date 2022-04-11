import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Hotel {
  final String id;
  final String name, imageUrl, location;

  Hotel({
    this.id,
    this.name,
    this.imageUrl,
    this.location,
  });

  factory Hotel.fromJson(Map<String, dynamic> jsonData) {
    return Hotel(
      id: jsonData['id'],
      name: jsonData['name'],
      location: jsonData['location'],
      imageUrl: "http://192.168.12.2/PHP/spacecrafts/images/"+jsonData['image_url'],
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<Hotel> spacecrafts;

  CustomListView(this.spacecrafts);

  Widget build(context) {
    return ListView.builder(
      itemCount: spacecrafts.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(spacecrafts[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Hotel hotel, BuildContext context) {
    return new ListTile(
        title: new Card(
          elevation: 5.0,
          child: new Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(hotel.imageUrl),
                  padding: EdgeInsets.only(bottom: 8.0),
                ),
                Row(children: <Widget>[
                  Padding(
                      child: Text(
                        hotel.name,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                  Text(" | "),
                  Padding(
                      child: Text(
                        hotel.propellant,
                        style: new TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                ]),
              ],
            ),
          ),
        ),
        onTap: () {
          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
            new SecondScreen(value: hotel),
          );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          Navigator.of(context).push(route);
        });
  }
}

//Future is n object representing a delayed computation.
Future<List<Hotel>> downloadJSON() async {
  final jsonEndpoint =
      "http://192.168.12.2/PHP/spacecrafts";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List hotels = json.decode(response.body);
    return hotels
        .map((hotel) => new Hotel.fromJson(hotel))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}

class SecondScreen extends StatefulWidget {
  final Hotel value;

  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Detail Page')),
      body: new Container(
        child: new Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: new Text(
                  'SPACECRAFT DETAILS',
                  style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                //`widget` is the current configuration. A State object's configuration
                //is the corresponding StatefulWidget instance.
                child: Image.network('${widget.value.imageUrl}'),
                padding: EdgeInsets.all(12.0),
              ),
              Padding(
                child: new Text(
                  'NAME : ${widget.value.name}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Padding(
                child: new Text(
                  'PROPELLANT : ${widget.value.location}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              )
            ],   ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new Scaffold(
        appBar: new AppBar(title: const Text('MySQL Images Text')),
        body: new Center(
          //FutureBuilder is a widget that builds itself based on the latest snapshot
          // of interaction with a Future.
          child: new FutureBuilder<List<Hotel>>(
            future: downloadJSON(),
            //we pass a BuildContext and an AsyncSnapshot object which is an
            //Immutable representation of the most recent interaction with
            //an asynchronous computation.
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Hotel> hotels = snapshot.data;
                return new CustomListView(hotels);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              //return  a circular progress indicator.
              return new CircularProgressIndicator();
            },
          ),

        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
//end
