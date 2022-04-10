
import 'package:flutter/material.dart';
import 'package:untitled/Database/Database.dart';
//import 'package:note_keeper/screen/note_list_page.dart';
import 'package:provider/provider.dart';

class UserTest extends StatefulWidget {
  const UserTest({Key? key}) : super(key: key);

  @override
  _UserTestState createState() => _UserTestState();
}

class _UserTestState extends State<UserTest> {
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
      body: FutureBuilder<List<UserTableData>>(
        future: _db.getUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserTableData>? users = snapshot.data;
            if (users != null) {
              if (users.isEmpty) {
                return Center(
                  child: Text(
                    'No User found in the list',
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2,
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index){
                    final user = users[index];
                    return Card(
                      child: Column(
                        children:[
                          Text(user.id.toString()),
                          Text(user.username.toString()),
                          Text(user.password.toString())
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