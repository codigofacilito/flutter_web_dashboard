
import 'package:class_dashboart/models/tutor_model.dart';

import '../ui.theme/colors_app.dart';
import 'group_model.dart';

class StudentModel {
  int? id;
  String? fullName;
  String? curp;
  String? gender;
  String? address;
  String? phone;
  GroupModel? groupModel;
  String? image;
  TutorModel? tutorModel;
  StudentModel({this.id,this.fullName,this.curp,this.gender,this.address,this.phone,this.groupModel,this.image,this.tutorModel});

  static List<String> columns = ["Nombre","ID","Tutor","Contacto","Grado",""];
  static List<StudentModel> students = [ StudentModel(
      id: 1,
      fullName: "Marines Mendez",
      gender: "Femenino",
      address: "Av alegria #1",
      curp: "DDSDASAS213",
      groupModel: GroupModel(id: 1,degree: 5,group: "A",color: orange),
      phone: "9231232312",
      image: "student1.png",
      tutorModel: TutorModel(id: 1,fullName: "Laura Mendez")
  ),
    StudentModel(
        id: 2,
        fullName: "Roberto Cancino",
        gender: "Masculino",
        address: "Av alegria #1",
        curp: "DDSDASAS213",
        groupModel: GroupModel(id: 1,degree: 6,group: "B",color: yellow),
        phone: "9231232312",
        image: "student2.png",
        tutorModel: TutorModel(id: 1,fullName: "Carmen Cancino")
    ),
    StudentModel(
        id: 3,
        fullName: "Jose Lopez",
        gender: "Femenino",
        address: "Av alegria #1",
        curp: "DDSDASAS213",
        groupModel: GroupModel(id: 1,degree: 2,group: "C",color: purple),
        phone: "9231232312",
        image: "student2.png",
        tutorModel: TutorModel(id: 1,fullName: "Pedro Lopez")
    ),
    StudentModel(
        id: 4,
        fullName: "Carlos Vera",
        gender: "Masculino",
        address: "Av alegria #1",
        curp: "DDSDASAS213",
        groupModel: GroupModel(id: 1,degree:5,group: "A",color: orange),
        phone: "9231232312",
        image: "student2.png",
        tutorModel: TutorModel(id: 1,fullName: "Michael Vera")
    ),StudentModel(
        id: 5,
        fullName: "Marisol Jimenez",
        gender: "Femenino",
        address: "Av alegria #1",
        curp: "DDSDASAS213",
        groupModel: GroupModel(id: 1,degree: 2,group: "C",color: purple),
        phone: "9231232312",
        image: "student1.png",
        tutorModel: TutorModel(id: 1,fullName: "Kendra Jimenez")
    )];
}