import 'package:class_dashboart/presentation/main/change_notifier/main_change_notifier.dart';
import 'package:class_dashboart/ui.theme/colors_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../menu_model.dart';

class SideMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var main = context.read<MainChangeNotifier>();
    // TODO: implement build
    return Drawer(
      backgroundColor: purple,
      child: ListView.builder(
          itemCount: MenuModel.initialMenu.length,
          itemBuilder: (context,index){
            MenuModel menuModel = MenuModel.initialMenu[index];
            if(index == 0 ){
              return DrawerHeader(child: SvgPicture.asset("assets/icons/${menuModel.icon}"));
            }
          return ListTile(
            title: Text(menuModel.title),
            leading:SvgPicture.asset("assets/icons/${menuModel.icon}",
            colorFilter: ColorFilter.mode(gray2,BlendMode.srcIn ),) ,
            onTap: (){
              main.addCurrentItem(menuModel);
            },
          );
      }),
    );
  }

}