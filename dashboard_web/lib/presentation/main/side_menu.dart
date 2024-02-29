import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../models/menu_model.dart';
import '../../ui.theme/colors_app.dart';
import 'change_notifier/main_change_notifier.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var main = Provider.of<MainChangeNotifier>(context, listen: false);
    return Drawer(
      backgroundColor: purple,elevation: 0,
      child: ListView.builder(padding: EdgeInsets.only(left: 30),
        itemCount: main.menu.length,
        itemBuilder: (_, index) {
          MenuModel menuModel = main.menu[index];
          if (index == 0){
            return  DrawerHeader(
              child: SvgPicture.asset(
                "assets/icons/${menuModel.icon}",
                width: 300,
                height: 300,
              ),
            );
          }
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            tileColor: isSelectMenu(menuModel, context),
            title: Text(
              menuModel.title,
              style: TextStyle(color: isSelectMenuContent(menuModel, context),fontWeight: FontWeight.w200),
            ),
            leading: SvgPicture.asset("assets/icons/${menuModel.icon}",
                colorFilter: ColorFilter.mode(
                    isSelectMenuContent(menuModel, context), BlendMode.srcIn),
                semanticsLabel: 'A red up arrow'),
            onTap: () {
              main.addCurrentItem(menuModel);
            },
          );
        },
      ),
    );
  }

  isSelectMenu(MenuModel menuModel, context) =>
      Provider.of<MainChangeNotifier>(context).currentItem == menuModel
          ? background
          : purple;

  isSelectMenuContent(MenuModel menuModel, context) =>
      Provider.of<MainChangeNotifier>(context).currentItem == menuModel
          ? purple
          : gray2;
}
