import 'package:flutter/material.dart';

import '../../../models/student_model.dart';


class StudentsChangeNotifier extends ChangeNotifier{
  StudentsChangeNotifier() :_students = StudentModel.students;


  List<StudentModel> _students=[];

  List<StudentModel>  get students => _students;

  StudentModel _currentStudent = StudentModel();

  StudentModel get currentStudent => _currentStudent;


  void addCurrentStudent(StudentModel studentModel){
    _currentStudent = studentModel;
    notifyListeners();
  }

  void deleteStudent(StudentModel studentModel){
    _students.remove(studentModel);
    notifyListeners();
  }
}