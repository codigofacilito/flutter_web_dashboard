import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../ui.theme/colors_app.dart';
import '../../main/change_notifier/main_change_notifier.dart';
import 'package:badges/badges.dart' as badges;

class Header extends StatelessWidget {
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (ResponsiveBreakpoints.of(context).isTablet)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: context.read<MainChangeNotifier>().controlMenu,
            ),
            Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                    context.watch<MainChangeNotifier>().currentItem.title,
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: text, fontWeight: FontWeight.w900))),
          Spacer(),
          if (ResponsiveBreakpoints.of(context).isDesktop)
            Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const SearchField()),
            ),
          Row(
            children: [
              const badges.Badge(
                badgeContent: Text('3'),
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: gray2,
                  size: 35,
                ),
              ),
             Padding(padding:EdgeInsets.only(left: 20) ,child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/cody.jpeg"),
                maxRadius: ResponsiveBreakpoints.of(context).isDesktop ? 25 : 20,
              ),)
            ],
          )
        ],
    );
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: white, borderRadius: BorderRadius.circular(25.0)),
      child: const Center(
        child: Row(
          children: [
            Icon(Icons.search, color: hintColor),
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration.collapsed(
                  hintText: "Search here...",
                  hintStyle: TextStyle(color: hintColor),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
