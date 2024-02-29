import 'package:dashboard_web/presentation/main/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../ui.theme/colors_app.dart';
import '../dashboard/dashboard_screen.dart';
import 'change_notifier/main_change_notifier.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          key: context.read<MainChangeNotifier>().scaffoldKey,
          backgroundColor: background,
          drawer: SideMenu(),
          body: SafeArea(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // We want this side menu only for large screen
                  if (ResponsiveBreakpoints.of(context).isDesktop)
                    Expanded(
                      child: SideMenu(),
                    ),
                  Expanded(
                    flex: 5,
                    child: IndexedStack(
                      index: context.watch<MainChangeNotifier>().currentItem.index,
                      children: [
                        Text("hola"),
                        DashboardScreen(),
                        Text("hola2"),
                        Text("hola2"),
                        Text("hola3"),
                        Text("hola4"),
                        Text("hola5"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
