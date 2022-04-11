import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/Signup/Signup.dart';
import 'package:untitled/Homepage/Homepage.dart';
//import 'dart:typed_data';
//import 'package:hive/hive.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  final usrcontroller = TextEditingController();
  final psscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment"),backgroundColor: Colors.orangeAccent,),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                child: Text("Payment Registration"),
              )
            ],
          ),
        ),
      ),
    );
  }

}


