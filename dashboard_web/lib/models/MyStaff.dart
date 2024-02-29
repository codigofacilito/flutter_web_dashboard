import 'package:flutter/material.dart';

import '../ui.theme/colors_app.dart';

class StaffInfo {
  final String? pngSrc, title;
  final String? numOfPersons;
  final Color? color;

  StaffInfo({
    this.pngSrc,
    this.title,
    this.numOfPersons,
    this.color
  });
}

List demoMyStaff = [
  StaffInfo(
    title: "Estudiantes",
    numOfPersons: "10000",
    pngSrc: "student.svg",
    color: purple
  ),
  StaffInfo(
    title: "Maestros",
    numOfPersons: "354",
    pngSrc: "teacher.svg",
    color: orange
  ),
  StaffInfo(
    title: "Eventos",
    numOfPersons: "40",
    pngSrc: "event.svg",
    color: yellow
  ),
  StaffInfo(
    title: "Ingresos",
    numOfPersons: "\$1000000",
    pngSrc: "finance.svg",
    color: text
  ),
];
