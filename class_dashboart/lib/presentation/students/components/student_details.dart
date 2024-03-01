import 'package:class_dashboart/presentation/students/change_notifier/students_change_notifier.dart';
import 'package:class_dashboart/ui.theme/colors_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/staff_info_model.dart';
import '../../../models/student_model.dart';
import '../../dashboard/components/staff/staff_card.dart';

class StudentDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudentDetailsState();
  }
}

class StudentDetailsState extends State<StudentDetails> {
  late ThemeData theme;
  late StudentModel studentModel;
  TextEditingController name = TextEditingController();
  TextEditingController curp = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController phone = TextEditingController();

  loadInfoStudent(){
    name.text=studentModel.fullName!;
    curp.text=studentModel.curp!;
    address.text=studentModel.address!;
    gender.text=studentModel.gender!;
    phone.text=studentModel.phone!;
  }

  bool enable=false;
  @override
  Widget build(BuildContext context) {
    studentModel = context.read<StudentsChangeNotifier>().currentStudent;
    loadInfoStudent();
    theme = Theme.of(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          "Detalles del Estudiante",
          style: theme.textTheme.headlineSmall!
              .copyWith(color: text, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: text, //change your color here
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                enable=!enable;
              });
            },
            icon: Icon(
              Icons.edit,
            ),
            color: text,
          ),
        ],
        elevation: 0.0,
        backgroundColor: background,
      ),
      body: Card(
        margin: EdgeInsets.all(50),
        shape: RoundedRectangleBorder(borderRadius: borderRounded()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.maxFinite,
              decoration:
                  BoxDecoration(color: purple, borderRadius: borderRounded()),
              child: Text(
                "Detalles del alumno",
                style: theme.textTheme.titleMedium!.copyWith(color: white),
              ),
            ),
            Form(
                child:Padding(padding:EdgeInsets.all(20),child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Foto",
                        style: theme.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold, color: text)),

                    SizedBox(
                      height: 10.h,
                    ),
                    Image.asset(
                      "assets/images/${studentModel.image!}",
                      width: 50.w,
                      height: 150.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(
                  width: 30.h,
                ),
                Expanded(
                    child: Column(
                  children: [
                    getTextField("Nombre completo",name),
                    getTextField("CURP",curp),
                    getTextField("Genero",gender)
                  ],
                )),
                SizedBox(
                  width: 30.h,
                ),
                Expanded(
                    child: Column(
                  children: [
                    getTextField("Direccion",address),
                    getTextField("Telefono",phone),
                  ],
                ))
              ],
            )))
          ],
        ),
      ),
    );
  }

  getTextField(String hint,TextEditingController controller) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$hint *",
              style: theme.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.bold, color: text),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextField(controller: controller,
              enabled: enable,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: purple),
                    borderRadius: BorderRadius.circular(3)),
                hintText: hint,
                hintStyle:
                    theme.textTheme.bodySmall!.copyWith(color: hintColor),
              ),
            ),
          ],
        ));
  }

  borderRounded() {
    return BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    );
  }
}
