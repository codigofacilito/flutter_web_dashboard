import 'package:class_dashboart/presentation/students/change_notifier/students_change_notifier.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../models/student_model.dart';
import '../../../navigation/route.dart';
import '../../../ui.theme/colors_app.dart';

class StudentsTable extends StatelessWidget {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    final students = context.watch<StudentsChangeNotifier>().students;
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: DataTable2(
              showCheckboxColumn: false,
              columns: createColumns(),
              rows: List<DataRow>.generate(students.length, (index) {
                StudentModel studentModel = students[index];
                return DataRow(
                    onSelectChanged: (value) {
                      context.read<StudentsChangeNotifier>().addCurrentStudent(studentModel);
                      Navigator.pushNamed(context, studentsDetails);
                    },
                    cells: [
                      dataCellName(context, studentModel),
                      DataCell(Text(studentModel.id!.toString())),
                      DataCell(Text(studentModel.tutorModel!.fullName!)),
                      dataCellContact(context, studentModel),
                      dataCellGroup(studentModel),
                      DataCell(IconButton(
                        onPressed: () {
                          context.read<StudentsChangeNotifier>().deleteStudent(studentModel);
                        },
                        icon: const Icon(
                          Icons.delete_outline_rounded,
                          color: red,
                        ),
                      ))
                    ]);
              })),
        ));
  }

  List<DataColumn2> createColumns() {
    return List<DataColumn2>.generate(
        StudentModel.columns.length,
        (index) => DataColumn2(
              label: Text(StudentModel.columns[index]),
              size: ColumnSize.L,
            ));
  }

  DataCell dataCellName(context, studentModel) {
    return DataCell(Row(
      children: [
        if (!ResponsiveBreakpoints.of(context).isTablet)
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/${studentModel.image}"),
          ),
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(studentModel.fullName!,
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: text, fontWeight: FontWeight.bold))))
      ],
    ));
  }

  DataCell dataCellContact(context, studentModel) {
    return DataCell(FloatingActionButton(
        heroTag: "call",
        elevation: 0.0,
        child: const Icon(
          Icons.perm_phone_msg_outlined,
          color: purple,
        ),
        backgroundColor: purple.withOpacity(0.1),
        mini: true,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text(
                    'Contacto',
                    style: theme.textTheme.headlineSmall!.copyWith(color: text),
                  ),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text("Numero de telefono"),
                        SelectableText(
                          studentModel.phone!,
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        child: Text("Cerrar"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                );
              });
        }));
  }

  dataCellGroup(studentModel) {
    return DataCell(Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        color: studentModel.groupModel!.color,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            "${studentModel.groupModel!.group!} ${studentModel.groupModel!.degree.toString()} ",
            style: theme.textTheme.bodySmall!.copyWith(color: white),
          ),
        )));
  }
}
