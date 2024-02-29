import 'package:flutter/cupertino.dart';

import 'components/header.dart';

class DashboardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            Header(),
            SizedBox(height: 16.0,),
            Row(
              children: [
                Expanded(child: Column(children: [

                ],))
              ],
            )
          ],),
        )
    );
  }

}