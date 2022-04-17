
import 'dart:io' as io;
//import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/Database/Database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:untitled/login/Login.dart';
import 'package:numberpicker/numberpicker.dart';

class HotelAddForm extends StatefulWidget {
  @override
  _HotelAddFormState createState() => _HotelAddFormState();
}

class _HotelAddFormState extends State<HotelAddForm> {
  late HotelDatabase _db;
  int _currentValue = 3;
  final _formKey = GlobalKey<FormState>();
  String roomname="";
  int maxocc = 3;
  int price = 0;
  String roomtype = "Standard";

  final List<String> errors = [];
  final TextEditingController _controllerRname = TextEditingController();
  final TextEditingController _controllerRPrice = TextEditingController();

  String selected = "";
  String DivFimagename = "";



  @override
  void initState(){
    super.initState();
    _db = HotelDatabase();
  }

  void loadData() async {

  }
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }


  @override
  Widget build(BuildContext context) {
    loadData();
    double screenwidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(height: 20),
          buildRoomNameFormField(),
          SizedBox(height: 20),
          // LevelDropdown(),
          Text("Number of occupants"),
          SizedBox(height: 20),

          NumberPicker(
            value: maxocc,
            minValue: 1,
            maxValue: 5,
            onChanged: (value) => setState(() => maxocc = value),
          ),
          SizedBox(height: 20),
          buildRoomPriceFormField(),
          SizedBox(height: 20),
          Text("Room Type"),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: roomtype,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                roomtype = newValue!;
              });
            },
            items: <String>['Economy', 'Standard', 'Superior', 'Deluxe','Supreme']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),


          FlatButton(
            onPressed: (){
              print(_controllerRname.text);
              print(_controllerRPrice.text);
              print(maxocc);
              print(roomtype);
              final entity = RoomTableCompanion(
                Roomname: drift.Value(_controllerRname.text),
                Price: drift.Value(int.parse(_controllerRPrice.text)),
                maxoccupants: drift.Value(maxocc),
                Roomtype: drift.Value(roomtype)



              );
              _db.insertRoom(entity).then((value) => ScaffoldMessenger.of(context)
                  .showMaterialBanner(
                  MaterialBanner(
                      content: Text('Room successfully created!'),
                      actions: [
                        TextButton(
                            onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                            child: const Text("Close")
                        )
                      ]

                  )
              )
              );
              Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));

            },
            color: Color(0xfff75BDFF),
            child: Text(
              'Confirm',
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 20),
        ]),
      ),
    );
  }

  TextFormField buildRoomNameFormField() {
    return TextFormField(
      controller: _controllerRname,
      cursorColor: Color(0xFFf5579c6),
      keyboardType: TextInputType.name,
      //onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please enter room name");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter room name");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        //      hintText: "Name",
          labelText: "Room name",
          filled: true,
          // fillColor: Color(0xFFFd0efff),,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.person)),
    );
  }


  TextFormField buildRoomPriceFormField() {
    return TextFormField(
      controller: _controllerRPrice,
      cursorColor: Color(0xFFf5579c6),
      keyboardType: TextInputType.numberWithOptions(),
      //onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please enter price");
        }
        else if (int.tryParse(value) != null) {
          removeError(error: "Only numbers are allowed");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter price");
          return "";
        }
        else if (int.tryParse(value) == null){
          addError(error: "Only numbers are allowed");
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        //      hintText: "Name",
          labelText: "Price",
          filled: true,
          // fillColor: Color(0xFFFd0efff),,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
    );
  }

}