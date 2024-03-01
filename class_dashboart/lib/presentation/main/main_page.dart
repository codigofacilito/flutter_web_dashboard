import 'package:class_dashboart/presentation/main/change_notifier/main_change_notifier.dart';
import 'package:class_dashboart/presentation/main/slide_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../dashboard/dashboard_page.dart';
import '../students/students_page.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: context.read<MainChangeNotifier>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            if(!ResponsiveBreakpoints.of(context).isTablet)
               Expanded(child: SideMenu(),),
            Expanded(
                flex: 5,
                child: IndexedStack(
                  index: context.watch<MainChangeNotifier>().currentItem.index,
                  children: [
                    SizedBox.shrink(),
                    DashboardPage(),
                    StudentPage(),
                    Text("4"),
                    Text("5"),
                    Text("6"),
                    Text("7"),
                    Text("8"),
                  ],
                ))
          ],
        ),
      ),
    );
  }

}