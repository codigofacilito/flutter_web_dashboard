import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../models/staff_info_model.dart';
import '../../../../ui.theme/colors_app.dart';

class StaffCard extends StatelessWidget{
  StaffInfoModel infoModel;
  StaffCard(this.infoModel);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // TODO: implement build
   return Row(
     crossAxisAlignment: CrossAxisAlignment.center,
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
     CircleAvatar(
       child: Padding(padding:EdgeInsets.all(8),child:SvgPicture.asset("assets/icons/${infoModel.icon}",
       colorFilter: ColorFilter.mode(white, BlendMode.srcIn),)),
       backgroundColor: infoModel.color!,
     ),
       Padding(padding:EdgeInsets.only(left: 10) ,child:
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
         Text(infoModel.title,style: theme.textTheme.bodyMedium!.copyWith(
           color: gray3
         ),),
         SelectableText(infoModel.numOfPerson,style: theme.textTheme.headlineSmall!
             .copyWith(fontWeight: FontWeight.bold,color: text),)
       ],))
   ],);
  }

}