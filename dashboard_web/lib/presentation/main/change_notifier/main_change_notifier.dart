import 'package:flutter/material.dart';

import '../../../models/menu_model.dart';

List<MenuModel> initialMenu = [
  MenuModel(index: 0,title:"Header",icon: "logo.svg"),
  MenuModel(index: 1,title:"Dashboard",icon: "home.svg"),
  MenuModel(index: 2,title:"Estudiantes",icon: "student.svg"),
  MenuModel(index: 3,title:"Maestros",icon: "teacher.svg"),
  MenuModel(index: 4,title:"Eventos",icon: "event.svg"),
  MenuModel(index: 5,title:"Finanzas",icon: "finance.svg"),
  MenuModel(index: 6,title:"Usuario",icon: "user.svg"),
  MenuModel(index: 7,title:"Configuracion",icon: "setting.svg"),
];

class MainChangeNotifier extends ChangeNotifier{
  MainChangeNotifier() :_menu = initialMenu,_currentItem = initialMenu[1];


  List<MenuModel> _menu=[];

  List<MenuModel>  get menu => _menu;

  MenuModel _currentItem = MenuModel();

  MenuModel get currentItem => _currentItem;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void addCurrentItem(MenuModel currentItem){
    _currentItem = currentItem;
    notifyListeners();
  }
}