
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Database/Database.dart';
//import 'package:note_keeper/screen/note_list_page.dart';
import 'package:provider/provider.dart';

class RoomTest extends StatefulWidget {
  const RoomTest({Key? key}) : super(key: key);

  @override
  _RoomTestState createState() => _RoomTestState();
}

class _RoomTestState extends State<RoomTest> {
  late HotelDatabase _db;
  @override
  void initState(){
    super.initState();
    _db = HotelDatabase();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _db = Provider.of<HotelDatabase>(context);
    return Scaffold(
      body: FutureBuilder<List<RoomTableData>>(
        future: _db.getRoomList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<RoomTableData>? Rooms = snapshot.data;
            if (Rooms != null) {
              if (Rooms.isEmpty) {
                return Center(
                  child: Text(
                    'No Room found in the list',
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2,
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: Rooms.length,
                  itemBuilder: (context, index){
                    final Room = Rooms[index];
                    return Card(
                      child: Column(
                        children:[
                          Text(Room.Roomid.toString()),
                          Text(Room.Roomname.toString()),
                          Text(Room.Price.toString()),
                          Text(Room.maxoccupants.toString()),
                          Text(Room.Roomtype.toString()),
                          FlatButton(
                            onPressed: (){

                              _db.deleteRoom(Room.Roomid);

                            },
                            color: Color(0xfff75BDFF),
                            child: Text(
                              'Delete',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ]
                      )
                    );
                  }

                );
              }
            }
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText2,
                ));
          }
          return Center(
            child: Text(
              'No user in the list',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText2,
            ),
          );
        },
      ),
    );
  }

  Future<List<UserTableData>> getUserList() async {
    return await _db.getUserList();
  }


}