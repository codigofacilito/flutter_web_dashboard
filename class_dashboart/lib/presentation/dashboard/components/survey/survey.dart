import 'package:class_dashboart/models/chart_model.dart';
import 'package:class_dashboart/presentation/dashboard/components/survey/survey_chart.dart';
import 'package:class_dashboart/ui.theme/colors_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SchoolSurvey extends StatelessWidget{
 late ThemeData theme;
  @override
  Widget build(BuildContext context) {
     theme = Theme.of(context);
    // TODO: implement build
   return Card(
     color: white,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10.0)
     ),
     child: Padding(padding:EdgeInsets.all(20),child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
       Text("Rendimiento academico",
       style:theme.textTheme.bodyLarge!.copyWith(
         fontWeight: FontWeight.bold,
         color: black
       ) ,),
       const SizedBox(height: 10,),
       const Divider(),
       getSurveyWidgets(context),
         const Divider(),
         const SizedBox(height: 10.0,),
         Row(children: [
         RotatedBox(quarterTurns: 3,
         child: Text("crecimiento (\$)",style: theme.textTheme.bodySmall!.copyWith(
           fontWeight: FontWeight.w600,
           color: black
         ),),),
           Expanded(child: SurveyChart())
         ],)
     ],),
   ));
  }

  getSurveyWidgets(BuildContext context){
    if(ResponsiveBreakpoints.of(context).isTablet) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        for(var chartModel in ChartModel.survey)
          Padding(padding: EdgeInsets.only(bottom: 20.0),child:items(chartModel))
      ],);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      for(var chartModel in ChartModel.survey)
        items(chartModel)
    ],);
  }

  Widget items(ChartModel chartModel){
    return Column(children: [
      Text("\$ ${chartModel.income}",style: theme.textTheme.bodySmall!.copyWith(
        color: black,
        fontWeight: FontWeight.bold
      ),),
      Text(chartModel.title,style: theme.textTheme.bodySmall!.copyWith(
          color: black,
          fontWeight: FontWeight.normal
      ),)
    ],);

  }
}