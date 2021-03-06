import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menulist extends GetxController{
  RxInt _selectedIndex=0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems =>["Create trip","Create hotel","Create liveaboard","Create boat","Create dive master","Create staff","Profile"];

  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  void openOrCloseDrawer(){
    if (_scaffoldKey.currentState.isDrawerOpen){
      _scaffoldKey.currentState.openEndDrawer!();
    }else{
      _scaffoldKey.currentState.openDrawer();
    }
  }
  void setMenuIndex(int index){
    _seleectedIndex.value=index;


  }
}