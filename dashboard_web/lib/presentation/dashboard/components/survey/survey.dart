import 'package:dashboard_web/presentation/dashboard/components/survey/survey_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../ui.theme/colors_app.dart';

class HospitalSurvey extends StatelessWidget {
  HospitalSurvey({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> survey = [
    {"income": 105, "title": "Ingresos de hoy"},
    {"income": 305, "title": "Ingresos de la semana"},
    {"income": 1450, "title": "Ingreso del mes"},
    {"income": 8000, "title": "Ingreso del año"}
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      child: Padding(padding: EdgeInsets.all(20),child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rendimiento académico",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            width: double.infinity,
            child: getSurveyWidgets(survey, context),
          ),
          Divider(),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "Crecimiento (\$)",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0),
                ),
              ),
              Expanded(child: SurveyChart()),
            ],
          )
        ],
      ),
    ));
  }
}

Widget getSurveyWidgets(
    List<Map<String, dynamic>> survey, BuildContext context) {
  if (ResponsiveBreakpoints.of(context).isTablet)
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: survey
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: items(item),
              ),
            )
            .toList());
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: survey
          .map(
            (item) => items(item),
          )
          .toList());
}

Widget items(item){
  return Column(
    children: [
      Text(
        "\$ ${item['income']}",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0),
      ),
      Text(
        item['title'],
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 16.0),
      ),
    ],
  );
}
