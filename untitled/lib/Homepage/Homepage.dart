import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Homepage/DrawerItems.dart';


class MainCompanyScreen extends StatelessWidget {
  //final MenuCompany _controller = Get.put(MenuCompany());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: DrawerItems(),
      body: SingleChildScrollView(
        child: Column(
          children: [
           // HeaderCompany(),
            //CenterCompanySection(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback press;

  const DrawerItem({
    Key key,
    @required this.title,
    @required this.isActive,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      selected: isActive,
      selectedTileColor: Color(0xfffB4CFEC),
      onTap: press,
      title: Text(
        title,
        style: TextStyle(color: Color(0xfff281E5D)),
      ),
    );
  }
}