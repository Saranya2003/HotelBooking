import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/Signup/Signup.dart';
import 'package:untitled/Homepage/Homepage.dart';
//import 'dart:typed_data';
//import 'package:hive/hive.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _isObscure = true;
  //var dummyusername = 'Numchok';
  //var dummypassword = 'Numchok';
  final usrcontroller = TextEditingController();
  final psscontroller = TextEditingController();
  //try {
    //var response = stub.login(loginRequest);
    //print('response: ${response}');
    //response.then((p0) => {
    //send token to other files
    //print(p0.token)
    //});
    //} catch (e) {

    //print(e);
    //}
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Email', style: TextStyle(color: Colors.black)
          // kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: usrcontroller,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              //fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Enter your Email',
              //hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Password', style: TextStyle(color: Colors.black)
          //kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: psscontroller,
            obscureText: _isObscure,
            style: TextStyle(
              color: Colors.black,
              // fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Enter your Password',
              //hintStyle: kHintTextStyle,
            ),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                 // _rememberMe = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {
          //sendLogin(),
          print('Login Button Pressed'), //Determine what to do after clicking
          // usrcontroller.text == dummyusername &&
          //         psscontroller.text == dummypassword
          //     ?
          //showError(),

          Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen()))
          // : showDialog(
          //     context: context,
          //     builder: (context) {
          //       return AlertDialog(
          //           content: Text("Incorrect Username or Password"));
          //     })
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            // fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      //padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        /*children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'assets/images/facebook.jpg',
            ),
          ),*/
        children: <Widget>[
          RaisedButton(
            elevation: 5.0,
            onPressed: () {
              /*print(
                  'Login Button Pressed'); //Determine what to do after clicking*/
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          RaisedButton(
            elevation: 5.0,
            onPressed: () {
              print(
                  'Login Button Pressed'); //Determine what to do after clicking
             // Navigator.push(
             //     context,
                 // MaterialPageRoute(
                     // builder: (context) => SignupCompanyScreen()));
            },
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => SignUpScreen())),
      //print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  //color: Color(0xfffdcfffb)
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          // Color(0xfff7AD7F0),
                          Color(0xfff92DFF3),
                          Color(0xfffB7E9F7),
                          Color(0xfffDBF3FA),
                          Color(0xfffF5FCFF),
                        ])
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage("assets/images/S__77250562.jpg"),
                  //         fit: BoxFit.cover) //Background

                  //color:Colors.white,
                  /*gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],*/

                ),
              ),
              Container(
                //height: double.infinity,

                constraints: BoxConstraints(maxWidth: 400, maxHeight: 600),
                //margin: EdgeInsets.all(80),
                //height: 600,
                //width: 661,

                decoration: BoxDecoration(color: Color(0xfff7AD7F0)
                  // Colors.greenAccent.withOpacity(0.5)
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.only(left: 40, top: 10, right: 40
                    //padding: EdgeInsets.symmetric(
                    //  horizontal: 40.0,
                    //  vertical: 40.0,
                    //vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          // color: Colors.white,
                          //fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          // shadows: [
                          //   Shadow(
                          //       // bottomLeft
                          //       offset: Offset(-1.5, -1.5),
                          //       color: Colors.black),
                          //   Shadow(
                          //       // bottomRight
                          //       offset: Offset(1.5, -1.5),
                          //       color: Colors.black),
                          //   Shadow(
                          //       // topRight
                          //       offset: Offset(1.5, 1.5),
                          //       color: Colors.black),
                          //   Shadow(
                          //       // topLeft
                          //       offset: Offset(-1.5, 1.5),
                          //       color: Colors.black),
                          //    ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      //_buildForgotPasswordBtn(),
                      _buildLoginBtn(),
                      //_buildSignInWithText(),
                     // _buildSocialBtnRow(),
                      _buildSignupBtn(),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showError() async {
    await Future.delayed(Duration(microseconds: 1));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Incorrect password or username, please try again."),
            actions: <Widget>[
            ],
          );
        });
  }
}

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);