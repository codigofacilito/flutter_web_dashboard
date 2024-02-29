import 'package:dashboard_web/presentation/dashboard/components/staff/staff_info_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../models/MyStaff.dart';
import '../../../../ui.theme/colors_app.dart';

class MyStaff extends StatelessWidget {
  const MyStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ResponsiveGridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: demoMyStaff.length,
          gridDelegate: ResponsiveGridDelegate(
            maxCrossAxisExtent: 350,
              childAspectRatio:3 //Relacion del ancho y el alto seria una tercera parte 350/3 seria el alto
          ),

          itemBuilder: (context, index) =>
              StaffInfoCards(info: demoMyStaff[index]),
        ));
  }
}
