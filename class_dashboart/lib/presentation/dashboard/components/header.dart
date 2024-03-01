import 'package:class_dashboart/presentation/main/change_notifier/main_change_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:badges/badges.dart' as badges;
import '../../../ui.theme/colors_app.dart';

class Header extends StatelessWidget {
 late ThemeData theme;
  @override
  Widget build(BuildContext context) {
     theme = Theme.of(context);
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (ResponsiveBreakpoints.of(context).isTablet)
          IconButton(
              onPressed: () {
                context.read<MainChangeNotifier>().controlMenu();
              },
              icon: const Icon(Icons.menu)),
        Text(
          context.watch<MainChangeNotifier>().currentItem.title,
          style: theme.textTheme.titleLarge!
              .copyWith(color: text, fontWeight: FontWeight.bold),
        ),
        Spacer(),
     if(ResponsiveBreakpoints.of(context).isDesktop)
        Expanded(child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
    child:searchWidget())),
        Row(
          children: [
            badges.Badge(
              badgeContent: Text("3"),
              child: Icon(
                Icons.notifications_none_rounded,
                color: gray2,
                size:35
              ),
            ),
           Padding(padding:EdgeInsets.only(left: 30) ,child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/cody.jpeg"),
              maxRadius: ResponsiveBreakpoints.of(context).isDesktop ? 25 : 20,
            ))
          ],
        )
      ],
    );
  }

  searchWidget(){
    return Material(child:Container(
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search,color: hintColor,)),
        Expanded(child:  TextField(
          decoration: InputDecoration.collapsed(
              hintText: "Busca aqui",
          hintStyle:theme.textTheme.bodySmall!.copyWith(color: hintColor),
          border: InputBorder.none),
        ))
      ],),
    ));
  }
}
