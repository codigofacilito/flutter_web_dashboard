import 'package:class_dashboart/models/student_model.dart';
import 'package:class_dashboart/navigation/route.dart';
import 'package:class_dashboart/presentation/main/main_page.dart';
import 'package:class_dashboart/presentation/students/components/student_details.dart';
import 'package:class_dashboart/presentation/students/students_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case mainPage:
        return getPageRoute(MainPage());
      case studentsDetails:
        return getPageRoute(StudentDetails());
      default:
        return _errorRoute();
    }
  }
  static getPageRoute(var page)=> MaterialPageRoute(builder: (_)=>page);

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error"),),
        body: const Center(
          child: Text("Error no se encontro la ruta"),
        ),
      );
    });
  }
}