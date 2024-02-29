import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'components/header.dart';
import 'components/staff/my_staff.dart';
import 'components/survey/survey.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Header(),
            SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyStaff(),
                      SizedBox(height: 16.0),
                      HospitalSurvey(),
                      SizedBox(
                        height: 20.0,
                      ),
                      if (!ResponsiveBreakpoints.of(context).isMobile)
                        Row(
                          children: [
                            SizedBox(width: 16.0),
                            Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
