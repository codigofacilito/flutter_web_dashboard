import 'package:class_dashboart/navigation/route.dart';
import 'package:class_dashboart/presentation/main/change_notifier/main_change_notifier.dart';
import 'package:class_dashboart/presentation/students/change_notifier/students_change_notifier.dart';
import 'package:class_dashboart/presentation/students/components/student_details.dart';
import 'package:class_dashboart/presentation/students/students_page.dart';
import 'package:class_dashboart/ui.theme/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'navigation/navigation_app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainChangeNotifier()),
      ChangeNotifierProvider(create: (context) => StudentsChangeNotifier())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              onGenerateRoute: RouteGenerator.generateRoute,
              initialRoute: mainPage,
              theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: false,
                  textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context)
                      .textTheme
                      .apply(bodyColor: text,
                          fontSizeFactor:
                              MediaQuery.of(context).size.width < 1201
                                  ? 1
                                  : 1.3))),
              builder: (context, child) {
                return ResponsiveBreakpoints.builder(
                    child: child!,
                    breakpoints: [
                      const Breakpoint(start: 0, end: 450, name: MOBILE),
                      const Breakpoint(start: 451, end: 1200, name: TABLET),
                      const Breakpoint(start: 1201, end: 1920, name: DESKTOP),
                      const Breakpoint(
                          start: 1921, end: double.infinity, name: "4k"),
                    ]);
              },
          routes: {
          },
            ));
  }
}
