import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:untitled/Homepage/DrawerItems.dart';
import 'package:untitled/UserTest/UserTestScreen.dart';
import 'package:untitled/login/Login.dart';
import 'package:untitled/HotelAddScreen/HotelAddScreen.dart';
import 'package:untitled/UserTest/RoomTestScreen.dart';




class AdminHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("Hotel Administration"),backgroundColor: Colors.blueAccent,),
      body:Column(

          children:[
            Text("Hotel Adminstration Dashboard"),
            Row(
              children:[
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: _DBOccupancy()

                ),
                Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: _TypeOcc()
                )
              ]
            ),
            Row(
                children:[
                  Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Text("Dash3")

                  ),
                  Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Text("Dash4")
                  )
                ]
            ),


            Text("AdminScreen"),
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
                color: Colors.lightBlueAccent,
              ),
              child: Text('Admin Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => AdminHomeScreen()));

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
              title: const Text('Room List'), //Test Only
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => RoomTest()));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Room adding form'), //Test Only
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => HotelAddScreen()));
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


class _DBOccupancy extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _DBOccupancy({Key? key}) : super(key: key);

  @override
  _DBOccupancyState createState() => _DBOccupancyState();
}

class _DBOccupancyState extends State<_DBOccupancy> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Vacant', 12, Colors.green),
      _ChartData('Booked', 15, Colors.red),
      ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SfCircularChart(
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
              widget: Container(
                  child: PhysicalModel(
                      child: Container(),
                      shape: BoxShape.circle,
                      elevation: 10,
                      shadowColor: Colors.black,
                      color: const Color.fromRGBO(230, 230, 230, 1)))),
          CircularChartAnnotation(
              widget: Container(
                  child: Text(data[1].y.toString(),
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25))))
        ],
        series: <CircularSeries>[
          // Render pie chart
          DoughnutSeries<_ChartData, String>(
              dataSource: data,
              pointColorMapper:(_ChartData data,  _) => data.color,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y
          )
        ]
    );
  }
}

class _TypeOcc extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _TypeOcc({Key? key}) : super(key: key);

  @override
  _TypeOccState createState() => _TypeOccState();
}


class _TypeOccState extends State<_TypeOcc> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Economy', 5, Colors.brown),
      _ChartData('Standard', 8, Colors.deepPurpleAccent),
      _ChartData('Superior', 1, Colors.orangeAccent),
      _ChartData('Deluxe', 3, Colors.lightBlueAccent),
      _ChartData('Supreme', 4, Colors.green),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Barchart");
      /*SfCartesianChart(
        series: <ChartSeries>[
          // Renders bar chart
          BarSeries<_ChartData, double>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y
          )
        ]
    );*/
  }
}




class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}