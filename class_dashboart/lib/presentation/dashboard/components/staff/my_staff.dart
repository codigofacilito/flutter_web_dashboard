import 'package:class_dashboart/models/staff_info_model.dart';
import 'package:class_dashboart/presentation/dashboard/components/staff/staff_card.dart';
import 'package:class_dashboart/ui.theme/colors_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyStaff extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: ResponsiveGridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          gridDelegate: ResponsiveGridDelegate(
            maxCrossAxisExtent: 400,
            childAspectRatio: 3
          ),
          itemCount: StaffInfoModel.demoMyStaff.length,
          itemBuilder: (context,index)=>StaffCard(StaffInfoModel.demoMyStaff[index])
      ),
    );
  }

}