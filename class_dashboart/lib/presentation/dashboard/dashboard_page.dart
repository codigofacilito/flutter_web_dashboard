import 'package:flutter/cupertino.dart';

import 'components/header.dart';
import 'components/staff/my_staff.dart';
import 'components/survey/survey.dart';

class DashboardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
          Header(),
          const SizedBox(height: 16.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child:
                Column(
                  children: [
                  MyStaff(),
                  SizedBox(height: 16.0,),
                 SchoolSurvey()
                ],crossAxisAlignment: CrossAxisAlignment.start,))
              ],
            )
          ],),
        )
    );
  }

}