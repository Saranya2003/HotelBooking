import 'dart:html';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Homepage/DrawerItems.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:counter_button/counter_button.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // Initial Selected Value
  int adultCounter =0;
  int childCounter = 0;
  String dropdownvalue = 'Novotel';
  String _datein = "Not set";
  String _timein = "Not set";
  String _dateout = "Not set";
  String _timeout = "Not set";
  // List of items in our dropdown menu
  var items = [
    'Novotel',
    'Centara',
    'Mytt Beach Hotel',
    'Dusit Thani',
    'Diamond Riverside Hotel',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Hotel Booking"),backgroundColor: Colors.orangeAccent,),
        body:Column(
        children:[
          Container(
            child:
            Row(
              children:[
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child:Column(
                    children:[
                      Text("Location"),
                      SizedBox(height:20),
                      DropdownButton(

                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                   ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child:Column(
                    children:[
                      Text("Check in - Check out"),
                      SizedBox(height:20),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 4.0,
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              theme: DatePickerTheme(
                                containerHeight: 210.0,
                              ),
                              showTitleActions: true,
                              minTime: DateTime(2000, 1, 1),
                              maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                                print('confirm $date');
                                _datein = '${date.year} - ${date.month} - ${date.day}';
                                setState(() {});
                              }, currentTime: DateTime.now(), locale: LocaleType.en);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.date_range,
                                          size: 18.0,
                                          color: Colors.teal,
                                        ),
                                        Text(
                                          " $_datein",
                                          style: TextStyle(
                                              color: Colors.teal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "  Change",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                      ),
                      SizedBox(height:20),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 4.0,
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              theme: DatePickerTheme(
                                containerHeight: 210.0,
                              ),
                              showTitleActions: true,
                              minTime: DateTime(2000, 1, 1),
                              maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                                print('confirm $date');
                                _dateout = '${date.year} - ${date.month} - ${date.day}';
                                setState(() {});
                              }, currentTime: DateTime.now(), locale: LocaleType.en);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.date_range,
                                          size: 18.0,
                                          color: Colors.teal,
                                        ),
                                        Text(
                                          " $_dateout",
                                          style: TextStyle(
                                              color: Colors.teal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "  Change",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                      ),

                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child:
                  Column(
                    children:[
                      Text("Number of people"),
                      SizedBox(height:20),
                      Text("Adult:"),
                      CounterButton(
                        loading: false,
                        onChange: (int val) {
                          setState(() {
                            adultCounter = val;
                          });
                        },
                        count: adultCounter,
                        countColor: Colors.purple,
                        buttonColor: Colors.purpleAccent,
                        progressColor: Colors.purpleAccent,
                      ),

                    Text("Child:"),
                    CounterButton(
                    loading: false,
                    onChange: (int val) {
                    setState(() {
                    childCounter = val;
                    });
                    },
                    count: childCounter,
                    countColor: Colors.purple,
                    buttonColor: Colors.purpleAccent,
                    progressColor: Colors.purpleAccent,
                    )



                    ],
                  ),
                ),
              ]
            ),
          ),
          Container(
            child: Text("Hotel List")
          ),
          Container(
            child: InfoCard()
          )
      ]
        ),

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text('Hotel Booking'),
            ),
            ListTile(
              title: const Text('Home'),

              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Booking Application'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      )
    );
}

class InfoCard extends StatefulWidget {
  /*const InfoCard({
    Key key="0",
    this.index!,
  }) : super(key: key);*/

  //final int index;

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 320,
        width: 1000,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
                width: 300,
                height: 300,
                child: /*Image.asset(LiveAboardDatas[widget.index].image)),*/
            Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       /* Text('Liveaboard name : ' +
                            HotelList[0].name),*/

                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('City'),
                            SizedBox(width:20),
                            Text('Country'),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        // Text(LiveAboardDatas[widget.index].description),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        Text('Total capacity'),

                        SizedBox(
                          height: 10,
                        ),
                        Text('Room type'),
                        SizedBox(
                          height: 10,
                        ),

                        Align(
                            alignment: Alignment.centerRight,
                            child: Text('Price : ' /* LiveAboardDatas[widget.index].price*/)),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: RaisedButton(
                            onPressed: () {
                              /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LiveaboardDetailScreen()));
*/
                            },
                            color: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text("View boat"),
                          ),
                        )

                      ],
                    ),
                  )),
            )
            )
          ],
        ),
      ),
    );
  }
}

