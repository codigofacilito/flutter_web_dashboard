import 'package:dashboard_web/presentation/main/change_notifier/main_change_notifier.dart';
import 'package:dashboard_web/presentation/main/side_menu.dart';
import 'package:dashboard_web/ui.theme/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'navigation/navigation_app.dart';
import 'navigation/route.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MainChangeNotifier(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);

    return ScreenUtilInit(
        minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) =>
         MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: text, fontSizeFactor: MediaQuery.of(context).size.width<1201?1:1.3),
          ),
          builder: (context, child) {
            return ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 1200, name: TABLET),
                const Breakpoint(start: 1201, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            );
          },
          initialRoute: mainScreen,
          routes: {
            slide: (context) => SideMenu(),
          },
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
        )
    );
  }
}
