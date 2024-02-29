import 'package:class_dashboart/menu_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainChangeNotifier extends ChangeNotifier{

  MainChangeNotifier():_currentItem = MenuModel.initialMenu[1];
  MenuModel _currentItem = MenuModel();
  MenuModel get currentItem =>_currentItem;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu(){
    if(!_scaffoldKey.currentState!.isDrawerOpen){
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void addCurrentItem(MenuModel currentItem){
    _currentItem = currentItem;
    notifyListeners();
  }
}