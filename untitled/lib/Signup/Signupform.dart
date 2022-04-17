
import 'dart:io' as io;
//import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/Database/Database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:untitled/login/Login.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late HotelDatabase _db;
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  String username="";
  String name="";
  String lastname="";
  // String level;
  String phoneNumber="";
  String email="";
  String password="";
  String confirmPassword="";
  String usertype="User";
  final List<String> errors = [];
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerLastname = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerConfirm = TextEditingController();
  //io.File DiverImage;
  //io.File DiveBack;
  //DateTime _dateTime;
  String selected = "";
  String DivFimagename = "";
  Map<String, int> levelTypeMap = {};

  //PickedFile divfront;
  //PickedFile card;

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
          buildUsernameFormField(),
          SizedBox(height: 20),
          buildNameFormField(),
          SizedBox(height: 20),
          buildLastnameFormField(),
          SizedBox(height: 20),
          // LevelDropdown(),


          buildEmailFormField(),
          SizedBox(height: 20),
          buildPhoneNumberFormField(),
          SizedBox(height: 20),

          SizedBox(height: 20),
          buildPasswordFormField(),
          SizedBox(height: 20),
          buildConfirmPasswordFormField(),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: usertype,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                usertype = newValue!;
              });
            },
            items: <String>['User','Admin']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

          FlatButton(
            onPressed: (){
              final entity = UserTableCompanion(
                username: drift.Value(_controllerUsername.text),
                password: drift.Value(_controllerPassword.text),
                category: drift.Value(2),
              );
              _db.insertUser(entity).then((value) => ScaffoldMessenger.of(context)
                  .showMaterialBanner(
                  MaterialBanner(
                    content: Text('User successfully created!'),
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

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: _controllerName,
      cursorColor: Color(0xFFf5579c6),
      keyboardType: TextInputType.name,
      //onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please enter name");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter name");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        //      hintText: "Name",
          labelText: "First Name",
          filled: true,
          // fillColor: Color(0xFFFd0efff),,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.person)),
    );
  }

  TextFormField buildLastnameFormField() {
    return TextFormField(
      controller: _controllerLastname,
      cursorColor: Color(0xFFf5579c6),
      keyboardType: TextInputType.name,
      onSaved: (newValue) => lastname = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please enter lastname");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter lastname");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        //   hintText: "Lastname",
          labelText: "Last Name",
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.person)),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      controller: _controllerUsername,
      cursorColor: Color(0xFFf5579c6),
      onSaved: (newValue) => username = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please enter username");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter username");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        //     hintText: "Username",
          labelText: "Username",
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.person)),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: _controllerConfirm,
      obscureText: _isObscure,
      onSaved: (newValue) => confirmPassword = newValue!,
      onChanged: (value) {
        if (password == confirmPassword) {
          removeError(error: "Password doesn't match");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: "Password doesn't match");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: "Confirm password",
          //   hintText: "Confirm password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              })),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _controllerPassword,
      obscureText: _isObscure,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please enter password");
        } else if (value.length >= 8) {
          removeError(error: "Password is too short");
        } else if (RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(value)) {
          removeError(error: "Please enter valid Password");
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter password");
          return "";
        } else if (value.length < 8) {
          addError(error: "Password is too short");
          return "";
        } else if (!(RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))
            .hasMatch(value)) {
          addError(error: "Please enter valid Password");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          //  hintText: "Password",
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              })),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please enter email");
        } else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          removeError(error: "Please enter valid Email");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter email");
          return "";
        } else if (!(RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
            .hasMatch(value)) {
          addError(error: "Please enter valid Email");
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: "Email",
        //  hintText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.mail),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _controllerPhone,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please enter phone");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please enter phone");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: "Phone number",
        // hintText: "Phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone),
      ),
    );
  }
}