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
        padding: EdgeInsets.only(left: 30),
          itemCount: MenuModel.initialMenu.length,
          itemBuilder: (context,index){
            MenuModel menuModel = MenuModel.initialMenu[index];
            if(index == 0 ){
              return DrawerHeader(child: SvgPicture.asset("assets/icons/${menuModel.icon}"));
            }
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30)
              )
            ),
            title: Text(menuModel.title,style: TextStyle(color:isSelectMenuContent(context,menuModel)),),
            tileColor: isSelectItem(context,menuModel),
            leading: SvgPicture.asset("assets/icons/${menuModel.icon}",
            colorFilter: ColorFilter.mode(isSelectMenuContent(context,menuModel),BlendMode.srcIn ),) ,
            onTap: (){
              main.addCurrentItem(menuModel);
            },
          );
      }),
    );
  }

  isSelectItem(BuildContext context,MenuModel menuModel)
  => context.watch<MainChangeNotifier>().currentItem==menuModel?background:purple;

  isSelectMenuContent(BuildContext context,MenuModel menuModel)=>
      context.watch<MainChangeNotifier>().currentItem==menuModel?purple:gray2;
}