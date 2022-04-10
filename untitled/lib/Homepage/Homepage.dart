import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Homepage/DrawerItems.dart';
import 'package:untitled/UserTest/UserTestScreen.dart';
import 'package:untitled/login/Login.dart';


class HomeScreen extends StatelessWidget {

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
                      TextField(decoration: InputDecoration(border:OutlineInputBorder(),
                        hintText: 'Enter Location here'
                      )
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
                      TextField(decoration: InputDecoration(border:OutlineInputBorder(),
                          hintText: 'Check in'
                      )
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
                      TextField(decoration: InputDecoration(border:OutlineInputBorder(),
                          hintText: 'Add number of people here'
                      )
                      ),
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
              title: const Text('User List'), //Test Only
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => UserTest()));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));

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

