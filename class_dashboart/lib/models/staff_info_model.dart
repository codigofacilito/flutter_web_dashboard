import 'package:flutter/material.dart';

import '../ui.theme/colors_app.dart';

class StaffInfoModel{
  String title;
  String numOfPerson;
  Color? color;
  String icon;
  StaffInfoModel({this.title="",this.numOfPerson="",this.color,this.icon=""});


 static List demoMyStaff = [
    StaffInfoModel(
        title: "Estudiantes",
        numOfPerson: "10000",
        icon: "student.svg",
        color: purple
    ),
    StaffInfoModel(
        title: "Maestros",
        numOfPerson: "354",
        icon: "teacher.svg",
        color: orange
    ),
    StaffInfoModel(
        title: "Eventos",
        numOfPerson: "40",
        icon: "event.svg",
        color: yellow
    ),
    StaffInfoModel(
        title: "Ingresos",
        numOfPerson: "\$1000000",
        icon: "finance.svg",
        color: text
    ),
  ];

}