
import 'package:dashboard_web/models/tutor_model.dart';

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
}